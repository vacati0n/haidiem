using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using SquareGroup.DAL;

namespace Parody.Cms.Email
{
	/// <summary>
	/// Class Sender Email
	/// </summary>
	public class EmailProvider
	{
		protected string DebugEmail {get;set;}
		protected string DefaultSenderEmail { get; set; }
		protected string DefaultSenderName { get; set; }

		/// <summary>
		/// Class Sender Email
		/// </summary>
		/// <param name="DefaultSenderEmail">Sender Email is required</param>
		/// <param name="DefaultSenderName">Sender Name is required</param>
		/// <param name="DebugEmail">Nếu có dữ liệu thì sẽ gửi mail Debug</param>
		public EmailProvider(string DefaultSenderEmail, string DefaultSenderName, string DebugEmail = null)
		{ 
			this.DefaultSenderEmail = DefaultSenderEmail;
			this.DefaultSenderName = DefaultSenderName;
			this.DebugEmail = DebugEmail;

			if (string.IsNullOrWhiteSpace(this.DefaultSenderEmail))
				throw new ArgumentNullException("Default Sender Email is required.");
			if (string.IsNullOrWhiteSpace(this.DefaultSenderName))
				throw new ArgumentNullException("Default Sender Name is required.");
		}

		/// <summary>
		/// Function thực thi Send Email
		/// </summary>
		/// <param name="email"></param>
		public void SendEmail(EmailMessage email)
		{
			//do something to send email
			string debugerEmails = DebugEmail;
			bool isDebug = !string.IsNullOrWhiteSpace(debugerEmails);
			//loop through each email
			using (var client = new SmtpClient())
			{
				if (isDebug)
				{
					email.Body = String.Concat(email.Body, "<br/><br/>--- Debug ---<br/>To: ", email.ReceiverEmail, "<br/>Cc: ", email.CC);
					email.ReceiverEmail = debugerEmails;
					email.CC = null;
				}
				#region Send email item

				if (string.IsNullOrWhiteSpace(DefaultSenderEmail))
					throw new ArgumentException("Default sender Email is not null or empty");
				if (string.IsNullOrWhiteSpace(DefaultSenderName))
					throw new ArgumentException("Default sender Name is not null or empty");

				using (var message = new MailMessage())
				{
					message.To.Add(email.ReceiverEmail);
					// Sender: From Mail and Name
					MailAddress Sender = new MailAddress(email.SenderEmail ?? DefaultSenderEmail, email.SenderName ??  DefaultSenderName, Encoding.UTF8);
					message.From = Sender;

					message.Subject = email.Subject;
					message.SubjectEncoding = Encoding.UTF8;
					message.Body = email.Body;
					message.BodyEncoding = Encoding.UTF8;
					if (!string.IsNullOrEmpty(email.ReplyToEmail))
						message.ReplyToList.Add(email.ReplyToEmail);
					message.IsBodyHtml = email.Format == EmailFormat.HTML;

					if (!string.IsNullOrEmpty(email.CC))
					{
						message.CC.Add(email.CC);
					}
					if (!string.IsNullOrEmpty(email.BCC))
					{
						message.Bcc.Add(email.BCC);
					}
					client.Send(message);
				}
				#endregion
			}
		}
	}
}
