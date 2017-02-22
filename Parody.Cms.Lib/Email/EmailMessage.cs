using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Parody.Cms.Email
{
	public class EmailMessage
	{
		public EmailMessage()
		{
			Type = "";
			Status = EmailStatus.Pending;
		}
		public long ID { get; set; }
		public string Type { get; set; }

		public string SenderEmail { get; set; }
		public string SenderName { get; set; }

		#region ReceiverEmail, CC, BCC
		private Dictionary<string, bool> _DicReceiverEmail = new Dictionary<string, bool>();
		private string _ReceiverEmail;
		/// <summary>
		/// To
		/// </summary>
		public string ReceiverEmail
		{
			get
			{
				if (_ReceiverEmail == null)
				{
					if (_DicReceiverEmail.Count == 0)
					{
						return "";
					}
					_ReceiverEmail = string.Join(",", _DicReceiverEmail.Keys);
				}
				return _ReceiverEmail;
			}
			set
			{
				_DicReceiverEmail = new Dictionary<string, bool>();
				_ReceiverEmail = null;
				if (value != null)
				{
					AddReceiverEmail(value.Split(new string[] { ",", ";" }, StringSplitOptions.RemoveEmptyEntries));
				}
			}
		}
		private Dictionary<string, bool> _DicCC = new Dictionary<string, bool>();
		private string _CC;
		/// <summary>
		/// CC
		/// </summary>
		public string CC
		{
			get
			{
				if (_CC == null)
				{
					_CC = string.Join(",", _DicCC.Keys);
				}
				return _CC;
			}
			set
			{
				_DicCC = new Dictionary<string, bool>();
				_CC = null;
				if (value != null)
				{
					AddCC(value.Split(new string[] { ",", ";" }, StringSplitOptions.RemoveEmptyEntries));
				}
			}
		}
		private Dictionary<string, bool> _DicBCC = new Dictionary<string, bool>();
		private string _BCC;
		/// <summary>
		/// Bcc
		/// </summary>
		public string BCC
		{
			get
			{
				if (_BCC == null)
				{
					_BCC = string.Join(",", _DicBCC.Keys);
				}
				return _BCC;
			}
			set
			{
				_DicBCC = new Dictionary<string, bool>();
				_BCC = null;
				if (value != null)
				{
					AddBCC(value.Split(new string[] { ",", ";" }, StringSplitOptions.RemoveEmptyEntries));
				}
			}
		}

		public bool AddCC(string email)
		{
			if (string.IsNullOrEmpty(email) || _DicReceiverEmail.ContainsKey(email) || _DicCC.ContainsKey(email))
			{
				return false;
			}
			if (_DicBCC.ContainsKey(email))
			{
				_DicBCC.Remove(email);
				_BCC = null;
			}
			_DicCC[email] = true;
			_CC = null;
			return true;
		}
		public void AddCC(IEnumerable<string> ListCC)
		{
			foreach (var email in ListCC)
			{
				AddCC(email);
			}
		}
		public bool AddBCC(string email)
		{
			if (string.IsNullOrEmpty(email) || _DicReceiverEmail.ContainsKey(email) || _DicBCC.ContainsKey(email) || _DicCC.ContainsKey(email))
			{
				return false;
			}
			_DicBCC[email] = true;
			_BCC = null;
			return true;
		}
		public void AddBCC(IEnumerable<string> ListBCC)
		{
			foreach (var email in ListBCC)
			{
				AddBCC(email);
			}
		}
		public bool AddReceiverEmail(string email)
		{
			if (string.IsNullOrEmpty(email) || _DicReceiverEmail.ContainsKey(email))
			{
				return false;
			}
			_DicReceiverEmail[email] = true;
			_ReceiverEmail = null;
			if (_DicCC.ContainsKey(email))
			{
				_DicCC.Remove(email);
				_CC = null;
			}
			if (_DicBCC.ContainsKey(email))
			{
				_DicBCC.Remove(email);
				_BCC = null;
			}
			return true;
		}
		public void AddReceiverEmail(IEnumerable<string> ListReceiverEmail)
		{
			foreach (var email in ListReceiverEmail)
			{
				AddReceiverEmail(email);
			}
		}
		#endregion

		/// <summary>
		/// Tiêu đề mail
		/// </summary>
		public string Subject { get; set; }
		/// <summary>
		/// Nội dung email
		/// </summary>
		public string Body { get; set; }
		public int Priority { get; set; }
		public DateTime AddedDate { get; set; }
		public DateTime SendDate { get; set; }
		public DateTime? SentDate { get; set; }
		public int RetryCount { get; set; }
		public EmailStatus Status { get; set; }
		public string ReplyToName { get; set; }
		public string ReplyToEmail { get; set; }
		public EmailFormat Format { get; set; }
	}

	public enum EmailStatus
	{
		Sent,
		Failed,
		Pending
	}
	public enum EmailFormat
	{
		HTML
	}    
    
}
