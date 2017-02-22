using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Parody.Cms
{
	/*
	 * 
	 * 
	*/
	public static class HelperExtensions
	{
		/// <summary>
		/// Lấy chuỗi Domain
		/// VD: http://huggies.com.vn/
		/// </summary>
		/// <param name="Request"></param>
		/// <param name="href">
		///	chuỗi url cần gắn thêm 
		///	VD: ~/media/image.png -> http://huggies.com.vn/media/image.png
		/// </param>
		/// <returns></returns>
		public static string GetUrlDomain(this HttpRequestBase Request, string href = null)
		{
			if (Request == null)
				return null;

			return GetUrlDomain(Request.Url, href);
		}
		/// <summary>
		/// Lấy chuỗi Domain
		/// VD: http://huggies.com.vn/
		/// </summary>
		/// <param name="Request"></param>
		/// <param name="href">
		///	chuỗi url cần gắn thêm 
		///	VD: ~/media/image.png -> http://huggies.com.vn/media/image.png
		/// </param>
		/// <returns></returns>
		public static string GetUrlDomain(this HttpRequest Request, string href = null)
		{
			if (Request == null)
				return null;

			return GetUrlDomain(Request.Url, href);
		}
		/// <summary>
		/// Lấy chuỗi Domain
		/// VD: http://huggies.com.vn/
		/// </summary>
		/// <param name="Request"></param>
		/// <param name="href">
		///	chuỗi url cần gắn thêm 
		///	VD: ~/media/image.png -> http://huggies.com.vn/media/image.png
		/// </param>
		/// <returns></returns>
		public static string GetUrlDomain(this Uri Url, string href = null)
		{
			if (Url == null)
				return null;

			string scheme = Url.Scheme.ToLower();
			string host = Url.Host.ToLower();

			string UrlDomain = string.Format("{0}://{1}", scheme, host);

			int port = Url.Port;
			if (port > 0 && ((scheme == "http" && port != 80) || (scheme == "https" && port != 443)))
			{
				UrlDomain += ":" + port.ToString();
			}
			UrlDomain += "/";

			if (!string.IsNullOrEmpty(href))
			{
				if (href.Substring(1, 1).Equals("~"))
					href = href.Substring(2);
				if (href.Substring(1, 1).Equals("/"))
					href = href.Substring(2);

				UrlDomain += href;
			}
			return UrlDomain;
		}

	}
}
