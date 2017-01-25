using Parody.Cms.Email;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using umbraco.BusinessLogic;

namespace Parody.Cms.Core.Email
{
	public class EmailQueueModule : IHttpModule
	{
		static Lazy<QueueEmailEngine> _EmailEngine = new Lazy<QueueEmailEngine>(delegate() {
			var setting = EmailConfig.Current;
			setting.SqlConnectionString = Application.SqlHelper.ConnectionString;
			var engine = new QueueEmailEngine(setting);
			engine.Error += engine_Error;
			return engine;
		}, true);

		static void engine_Error(Exception ex)
		{
			ParodyCmsHelper.Log("EmailQueueModule", ex);
		}
		public static QueueEmailEngine EmailEngine
		{
			get { return _EmailEngine.Value; }
		}
		/// <summary>
		/// EmailEngineModule dùng để kích hoạt email engine chạy
		/// </summary>
		#region IHttpModule Members

		public void Dispose()
		{
		}

		public void Init(HttpApplication context)
		{
			EmailEngine.Start();
		}

		#endregion
	}

}