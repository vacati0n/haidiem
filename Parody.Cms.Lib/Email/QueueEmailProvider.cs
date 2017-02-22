using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using SquareGroup.DAL;

namespace Parody.Cms.Email
{
	public interface IQueueEmailSetting
	{
		
		string DebugEmail { get; }
		/// <summary>
		/// địa chỉ mail
		/// </summary>
		string DefaultSenderEmail { get; }
		/// <summary>
		/// Tên người gữi
		/// </summary>
		string DefaultSenderName { get; }

		/// <summary>
		/// Kết nối đến database
		/// </summary>
		string SqlConnectionString { get; }

		/// <summary>
		/// thời gian chờ sau 1 lần lấy dữ liệu từ database và gửi mail.
		/// </summary>
		int DelayTime { get; }
		/// <summary>
		/// Thời gian chờ sau khi web start thì bắt đầu gữi mail.
		/// </summary>
		int DelayFirstTime { get; }
		/// <summary>
		/// Số mail giữ trong 1 lúc. ảnh hưởng đến lúc thead, đây là số lượng dữ liệu lấy từ database trong 1 lần chạy
		/// </summary>
		int NumberEmailSendOneTime { get; }
		/// <summary>
		/// Số lần gữi lại mail khi thất bại
		/// </summary>
		int MaxRetry { get; }
	}

	public class QueueEmailProvider
	{
		protected IQueueEmailSetting _setting;
		protected DbProvider db { get; private set; }
		public EmailProvider EmailProvider { get; private set; }
		public QueueEmailProvider(IQueueEmailSetting setting)
		{
			_setting = setting;

			if (string.IsNullOrWhiteSpace(_setting.SqlConnectionString))
				throw new ArgumentNullException("QueueEmailSetting.SqlConnectionString is required.");
			if (string.IsNullOrWhiteSpace(_setting.DefaultSenderEmail))
				throw new ArgumentNullException("QueueEmailSetting.DefaultSenderEmail is required.");
			if (string.IsNullOrWhiteSpace(_setting.DefaultSenderName))
				throw new ArgumentNullException("QueueEmailSetting.DefaultSenderName is required.");

			this.db = new SquareGroup.DAL.MsSql.MSSQLDbProvider(_setting.SqlConnectionString);
			EmailProvider = new EmailProvider(this._setting.DefaultSenderEmail, this._setting.DefaultSenderName, this._setting.DebugEmail);
		}

		public void AddEMailToQueue(EmailMessage email)
		{
			email.AddedDate = DateTime.UtcNow;
			email.SendDate = DateTime.UtcNow;
			db.ClearParameter();
			db.CommandText = @"INSERT INTO [dsQueueMails] (Type, SenderEmail, ReceiverEmail, CC, BCC, Subject, Body, Priority, AddedDate, SendDate, RetryCount, Status, Format, SenderName)
				VALUES(@Type, @SenderEmail, @ReceiverEmail, @CC, @BCC, @Subject, @Body, 1, @AddedDate, @SendDate, 0, @Status, @Format, @SenderName)";
			db.CommandType = System.Data.CommandType.Text;
			db.AddParameter("Type", email.Type ?? "");
			db.AddParameter("SenderEmail", email.SenderEmail ?? _setting.DefaultSenderEmail);
			db.AddParameter("Status", email.Status.ToString());
			db.AddParameter("ReceiverEmail", email.ReceiverEmail);
			db.AddParameter("CC", email.CC);
			db.AddParameter("BCC", email.BCC);
			db.AddParameter("Subject", email.Subject);
			db.AddParameter("Body", email.Body);
			db.AddParameter("Priority", email.Priority);
			db.AddParameter("SenderName", email.SenderName ??_setting.DefaultSenderName);
			db.AddParameter("Format", email.Format);
			db.AddParameter("AddedDate", email.AddedDate);
			db.AddParameter("SendDate", email.SendDate);
			db.ExecuteNonQuery();
		}

		public List<EmailMessage> GetEmailToSend(int concurrent, int retry)
		{
			db.ClearParameter();
			db.CommandText = @"SELECT TOP (@quantity) ID, Type, SenderEmail, ReceiverEmail, CC, BCC, Subject, Body, Priority, AddedDate, SendDate, SentDate, RetryCount, Status, ReplyToName, ReplyToEmail, AttachmentFiles, Format, SenderName
				FROM [dsQueueMails]
				WHERE [Status] <> 'Sent' AND COALESCE(RetryCount, 0) < @maxretry
						AND SendDate <= GETDATE()
				ORDER BY Priority DESC, SendDate";
			db.CommandType = System.Data.CommandType.Text;
			db.AddParameter("quantity", concurrent);
			db.AddParameter("maxretry", retry);

			return db.ExecuteListObject<EmailMessage>();
		}
		public List<EmailMessage> GetListEmail(string to, DateTime? formDate, DateTime? toDate, EmailStatus? status, int begin, int end, out int total)
		{
			if (string.IsNullOrWhiteSpace(to))
			{
				to = null;
			}
			else
			{
				to = to + "%";
			}
			db.CommandType = System.Data.CommandType.Text;
			db.ClearParameter();
			db.CommandText = @"SELECT COUNT(1)
				FROM [dsQueueMails]
				WHERE (@Status IS NULL OR @Status = [Status])
					AND (@FormDate IS NULL OR @FormDate <= [AddedDate])
					AND (@ToDate IS NULL OR @ToDate >= [AddedDate])
					AND (@To IS NULL OR [ReceiverEmail] LIKE @To)
				";
			db.AddParameter("To", to);
			db.AddParameter("FormDate", formDate);
			db.AddParameter("ToDate", toDate);
			if (status.HasValue)
			{
				db.AddParameter("Status", status.ToString());
			}
			else
			{
				db.AddParameter("Status", DBNull.Value);
			}
			total = Convert.ToInt32(db.ExecuteScalar());
			db.CommandText = @"SELECT * FROM (
				SELECT *, ROW_NUMBER() OVER(ORDER BY ID) AS [RowCount] 
				FROM [dsQueueMails]
				WHERE (@Status IS NULL OR @Status = [Status])
					AND (@FormDate IS NULL OR @FormDate <= [AddedDate])
					AND (@ToDate IS NULL OR @ToDate >= [AddedDate])
					AND (@To IS NULL OR [ReceiverEmail] LIKE @To)
				 ) T
			WHERE T.[RowCount] BETWEEN @Begin AND @End";
			db.AddParameter("Begin", begin);
			db.AddParameter("End", end);
			return db.ExecuteListObject<EmailMessage>();
		}

		public EmailMessage GetEmail(long Id)
		{
			db.ClearParameter();
			db.CommandText = @"SELECT *
				FROM [dsQueueMails]
				WHERE [ID] = @ID";
			db.CommandType = System.Data.CommandType.Text;
			db.AddParameter("ID", Id);
			return db.ExecuteObject<EmailMessage>();
		}
		private void ChangeEmailStatus(long ID, EmailStatus Status)
		{
			db.ClearParameter();
			db.CommandText = @"UPDATE [dsQueueMails]
				SET  [Status] = @status
				, RetryCount = CASE WHEN @status <> 'SENT' THEN COALESCE(RetryCount, 0) + 1 ELSE COALESCE(RetryCount, 0) END
				, SentDate = GETDATE()
				WHERE ID = @emailId";
			db.CommandType = System.Data.CommandType.Text;
			db.AddParameter("emailId", ID);
			db.AddParameter("status", Status.ToString());
			db.ExecuteNonQuery();
		}

		public void SendMailQueue(IEnumerable<EmailMessage> listItems)
		{
			foreach (var item in listItems)
			{
				try
				{
					EmailProvider.SendEmail(item);
					ChangeEmailStatus(item.ID, EmailStatus.Sent);
				}
				catch (Exception)
				{
					ChangeEmailStatus(item.ID, EmailStatus.Failed);
				}

			}
		}

	}

	public delegate void LogDelegate(Exception ex);
	public class QueueEmailEngine : IDisposable
	{
		public event LogDelegate Error;
		Thread worker;
		bool isRunning = false;
		private Object thisLock = new Object();

		protected IQueueEmailSetting _setting;
		public QueueEmailEngine(IQueueEmailSetting setting)
		{
			_setting = setting;
			worker = new Thread(Run);
		}

		public void Start()
		{
			if (isRunning == false)
			{
				isRunning = true;
				worker.Start();
			}
		}
		private void Run()
		{
			try
			{
				var MaxRetry = _setting.MaxRetry;
				if (MaxRetry <= 0)
				{
					MaxRetry = 5;
				}

				var NumberMailSendOneTime = _setting.NumberEmailSendOneTime;
				if (NumberMailSendOneTime <= 0)
				{
					NumberMailSendOneTime = 100;
				}

				var DelayTime = _setting.DelayTime;
				if (DelayTime <= 0)
				{
					DelayTime = 5000;
				}

				if (_setting.DelayFirstTime > 0)
				{
					Thread.Sleep(_setting.DelayFirstTime);
				}
				var emailProvider = new QueueEmailProvider(this._setting);
				
				while (isRunning)
				{
					try
					{
						//get emails to send
						var emailOnAir = new List<EmailMessage>();
						//CODE TO GET EMAIL ITEM ON QUEUE HERE
						emailOnAir = emailProvider.GetEmailToSend(NumberMailSendOneTime, MaxRetry);
						if (emailOnAir != null && emailOnAir.Any())
						{
							emailProvider.SendMailQueue(emailOnAir);
						}
					}
					catch (Exception ex)
					{
						if (Error != null)
						{
							Error(ex);
						}
					}

					Thread.Sleep(DelayTime);

				}
			}
			catch (ThreadInterruptedException)
			{
				return;
			}
			catch (Exception ex)
			{
				if (Error != null)
				{
					Error(ex);
				}
			}
		}
		public void Stop()
		{
			isRunning = false;
			this.worker.Interrupt();
		}

		public void Dispose()
		{
			this.Stop();
		}
	}
}
