using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using umbraco.BusinessLogic;
using umbraco.DataLayer;
using umbraco;
using Parody.Cms.Email;
using System.Text.RegularExpressions;
using System.Web;

namespace Parody.Cms.Core.Email
{
	public class EmailHelper
	{
		private static ISqlHelper SqlHelper
		{
			get { return Application.SqlHelper; }
		}
		public QueueEmailProvider QueueEmail { get; private set; }
		private EmailProvider dbEmailEngine;
		private EmailSetting setting;
		public static EmailHelper Current 
		{
			get{
				if (HttpContext.Current == null)
				{
					return new EmailHelper();
				}
				if (HttpContext.Current.Items["Parody.Cms-EmailHelper"] == null)
				{
					HttpContext.Current.Items["Parody.Cms-EmailHelper"] = new EmailHelper();
				}				
				return (EmailHelper)HttpContext.Current.Items["Parody.Cms-EmailHelper"];
			}
		}
		public EmailHelper()
		{
			this.setting = EmailConfig.Current;
			this.setting.SqlConnectionString = SqlHelper.ConnectionString;
			QueueEmail = new QueueEmailProvider(this.setting);
			dbEmailEngine = QueueEmail.EmailProvider;
		}

		private string AddDomainPathRegex(string html)
		{
			string domain = HelperExtensions.GetUrlDomain(HttpContext.Current.Request).TrimEnd('/');

			//Parse local link của Umbraco
			html = Umbraco.Web.Templates.TemplateUtilities.ParseInternalLinks(html);
			//Replace link domain
			html = ReplaceLink(domain, html, "src=[\"\']([^\"\']*)[\"\']");
			html = ReplaceLink(domain, html, "href=[\"\']([^\"\']*)[\"\']");
			html = ReplaceLink(domain, html, "background=[\"\']([^\"\']*)[\"\']");
			html = ReplaceLink(domain, html, "background-image:url\\([\"\']([^\"\']*)[\"\']\\)");
			html = ReplaceLink(domain, html, "background:[^url]*url\\([\"\']([^\"\']*)[\"\']\\)");
			//return Html sau khi path
			return html;
		}
		private string ReplaceLink(string domain, string html, string regexMatch)
		{
			domain = domain.TrimEnd('/');

			html = Regex.Replace(html, regexMatch, new MatchEvaluator(delegate(Match m)
			{
				string value = m.Groups[1].Value;

				if (string.IsNullOrWhiteSpace(value))
					return m.Value;

				if (!value.StartsWith("http:") && !value.StartsWith("https:"))
					return m.Value.Replace(value, domain + value);
				else
					return m.Value;
			}));

			return html;
		}

		public void SendMail(EmailMessage email)
		{
			if (email == null)
				return;
			
			// Gắn Domain path vào các link của nội dung email
			email.Body = this.AddDomainPathRegex(email.Body);
			if (this.setting.Async)
			{
				try
				{
					dbEmailEngine.SendEmail(email);
					email.Status = EmailStatus.Sent;
				}
				catch
				{
					email.Status = EmailStatus.Pending;
				} 
			}
			else
			{
				try
				{
					dbEmailEngine.SendEmail(email);
					email.Status = EmailStatus.Sent;
				}
				catch
				{
					email.Status = EmailStatus.Failed;
				}
			}
			email.Type = "";
			QueueEmail.AddEMailToQueue(email);
		}
		/// <summary>
		/// Send mail và add vào QueueEmail, để log hoặc gửi lại nếu thất bại
		/// </summary>
		/// <param name="subject">Tiêu đề mail</param>
		/// <param name="body">Nội dung email, sẽ được ParseInternalLinks và add domain</param>
		/// <param name="to">email gửi đến (nhiều mail phân cách bằng dấu phẩy)</param>
		/// <param name="Replaces">Nội dung thay thế (chạy trước khi ParseInternalLinks và add domain)</param>
		public void SendMail(string subject, string body, string to, IDictionary<string, string> Replaces)
		{
			EmailMessage email = new EmailMessage();
			email.Body = body ?? "";
			foreach (var item in Replaces)
			{
				email.Body = email.Body.Replace("{" + item.Key + "}", item.Value);
			}			
			email.Subject = subject ?? "";
			email.ReceiverEmail = to;

			this.SendMail(email);
		}
		/// <summary>
		/// Send mail và add vào QueueEmail, để log hoặc gửi lại nếu thất bại
		/// </summary>
		/// <param name="subject">Tiêu đề mail</param>
		/// <param name="body">Nội dung email, sẽ được ParseInternalLinks và add domain</param>
		/// <param name="to">email gửi đến (nhiều mail phân cách bằng dấu phẩy)</param>
		/// <param name="Replaces">Nội dung thay thế (chạy trước khi ParseInternalLinks và add domain)</param>
		public void SendMail(string subject, string body, string to, object replaces)
		{
			EmailMessage email = new EmailMessage();
			email.Body = body ?? "";
			var list = replaces.GetType().GetProperties();
			foreach (var item in list)
			{
				email.Body = email.Body.Replace("{" + item.Name + "}", Convert.ToString(item.GetValue(replaces)));
			}
			email.Subject = subject ?? "";
			email.ReceiverEmail = to;

			this.SendMail(email);
		}
	}
}
