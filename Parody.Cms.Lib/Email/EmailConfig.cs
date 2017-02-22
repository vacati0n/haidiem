using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using Parody.Cms.Email;

namespace Parody.Cms.Email
{
	public class EmailConfig
	{
		private static string SectionName = "EmailConfig";
		private static EmailSetting _config;
		public static EmailSetting Current
		{
			get
			{
				if (_config == null)
				{
					object obj = ConfigurationManager.GetSection(SectionName);
					if (obj is EmailSetting)
					{
						_config = (EmailSetting)obj;
					}
					else
					{
						_config = new EmailSetting();
					}
				}
				return _config;
			}
		}

	}
	public class EmailSetting : ConfigurationSection, IQueueEmailSetting
	{
		public EmailSetting() { }
		public string SqlConnectionString { get; set; }

		/// <summary>
		/// Nếu là true thì sẽ add vào database chờ queue gữi, fasle thì sẽ gữi mail rùi mới add vào database
		/// </summary>
		[ConfigurationProperty("Async", DefaultValue = true)]
		public bool Async
		{
			get { return Convert.ToBoolean(this["Async"]); }
		}

		[ConfigurationProperty("RETRY", DefaultValue = 3)]
		public int MaxRetry
		{
			get { return Convert.ToInt32(this["RETRY"]); }
		}

		[ConfigurationProperty("DELAY_TIME", DefaultValue = 6000)]
		public int DelayTime
		{
			get { return Convert.ToInt32(this["DELAY_TIME"]); }
		}

		[ConfigurationProperty("DELAY_FIRST_TIME", DefaultValue = 6000)]
		public int DelayFirstTime
		{
			get { return Convert.ToInt32(this["DELAY_FIRST_TIME"]); }
		}

		[ConfigurationProperty("NUMBER_OF_EMAILS_SEND_IN_ONE_TIME", DefaultValue = 5)]
		public int NumberEmailSendOneTime
		{
			get { return Convert.ToInt32(this["NUMBER_OF_EMAILS_SEND_IN_ONE_TIME"]); }
		}

		[ConfigurationProperty("DEBUG_EMAILS", DefaultValue = "")]
		public string DebugEmail
		{
			get { return this["DEBUG_EMAILS"].ToString(); }
		}

		[ConfigurationProperty("DEFAULT_SENDER_EMAIL", DefaultValue = "")]
		public string DefaultSenderEmail
		{
			get { return this["DEFAULT_SENDER_EMAIL"].ToString(); }
		}

		[ConfigurationProperty("DEFAULT_SENDER_NAME", DefaultValue = "")]
		public string DefaultSenderName
		{
			get { return this["DEFAULT_SENDER_NAME"].ToString(); }
		}
	}
}