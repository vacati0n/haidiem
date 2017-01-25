using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using umbraco;
using umbraco.interfaces;
using Umbraco.Core.Logging;
using Umbraco.Core.Models;
using Umbraco.Web;

namespace Parody.Cms.Core
{
	/// <summary>
	/// class chứa hàm helper giúp thao tác nhanh
	/// </summary>
	public static class ParodyCmsHelper
	{
		public const string EmailRegex = @"^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$";
		public const string PasswordRegex = @"^.{4,20}$";
		public const string IdentityNoRegex = @"^\d{9,20}$";
		public const string MobileNoRegex = @"^\d{10,11}$";		

		/// <summary>
		/// Writes a message to the log file. 
		/// Đây là hàm ghi log vào umbraco log
		/// </summary>
		/// <param name="txt">Text to be logged</param>
		/// <returns>True on success or false on failure</returns>
		public static bool Log(string txt)
		{
			return Log("Error", new Exception(txt));
		}
		public static bool Log(string name, Exception ex)
		{
			LogHelper.Error(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, name, ex);
			try
			{
				LogHelper.Error(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType, name, ex);
				return true;
			}
			catch { }
			return false;
		}

		/// <summary>
		/// Hàm helper lấy Dictionary Value trong umbraco, nếu không có return key
		/// </summary>
		/// <param name="key"></param>
		/// <returns></returns>
		public static string GetDictionaryValue(string key)
		{
			var v = umbraco.library.GetDictionaryItem(key);
			if (string.IsNullOrWhiteSpace(v))
			{
				return key;
			}
			return v;
		}

		/// <summary>
		/// Lấy Umbraco helper
		/// </summary>
		/// <returns></returns>
		public static UmbracoHelper GetUmbracoHelper()
		{
			if (HttpContext.Current.Items["Parody.Cms-UmbracoHelper"] == null)
			{
				HttpContext.Current.Items["Parody.Cms-UmbracoHelper"] = new UmbracoHelper(UmbracoContext.Current);
			}
			return (UmbracoHelper)HttpContext.Current.Items["Parody.Cms-UmbracoHelper"];
		}
		public static INode CurrentNode()
		{
			return uQuery.GetCurrentNode();
		}
		public static dynamic CurrentPage()
		{
			return GetUmbracoHelper().Content(CurrentNode().Id);
		}
		public static IPublishedContent CurrentContent()
		{
			return GetUmbracoHelper().TypedContent(CurrentNode().Id);
		}
	}
}
