using Parody.Cms.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using umbraco;
using umbraco.interfaces;
using Umbraco.Core.Models;
using Umbraco.Web;

/// <summary>
/// Đây là class chứa các hàm Extension không cần dùng trực tiếp
/// </summary>
public static class ParodyCmsUmbracoExtension
{
	public static UmbracoHelper UmbracoHelper
	{
		get
		{
			return ParodyCmsHelper.GetUmbracoHelper();
		}
	}

	/// <summary>
	/// Hàm helper add parameter (giá trị null add DBNull)
	/// </summary>
	/// <param name="SqlHelper"></param>
	/// <param name="name"></param>
	/// <param name="value"></param>
	/// <returns></returns>
	public static umbraco.DataLayer.IParameter Parameter(this umbraco.DataLayer.ISqlHelper SqlHelper, string name, object value)
	{
		if (value == null)
		{
			return SqlHelper.CreateParameter(name, DBNull.Value);
		}
		else
		{
			return SqlHelper.CreateParameter(name, value);
		}
	}

	[Obsolete("use Html.Raw(node.GetProperty<string>(fieldAlias))")]
	public static IHtmlString RawHtml(this INode node, string fieldAlias, string emptyString = "")
	{
		var pro = UmbracoHelper.TypedContent(node.Id).GetProperty(fieldAlias);
		if (pro == null)
		{
			return new HtmlString(emptyString);
		}
		else
		{
			return new HtmlString(pro.Value.ToString());
		}
	}
	/// <summary>
	/// Lấy value của thuộc tính có kiểu là MultiNodeTreePicker
	/// </summary>
	/// <param name="node"></param>
	/// <param name="fieldAlias">tên thuộc tính</param>
	/// <returns>Danh sách node Id được chọn</returns>
	public static IEnumerable<int> GetValueIDNodeOfMultiNodeTreePicker(this INode node, string fieldAlias)
	{
		if (node.HasProperty(fieldAlias))
		{
			return uQuery.GetXmlIds(node.GetProperty<string>(fieldAlias));
		}
		else
		{
			return new int[0];
		}
	}
	/// <summary>
	/// Lấy value của thuộc tính có kiểu là MultiNodeTreePicker
	/// </summary>
	/// <param name="node"></param>
	/// <param name="fieldAlias">tên thuộc tính</param>
	/// <returns>Danh sách Node được chọn</returns>
	public static IEnumerable<INode> GetValueOfMultiNodeTreePicker(this INode node, string fieldAlias)
	{
		if (node.HasProperty(fieldAlias))
		{
			return uQuery.GetNodesByXml(node.GetProperty<string>(fieldAlias));
		}
		else
		{
			return new INode[0];
		}
	}

	/// <summary>
	/// Thêm Domain cho href
	/// </summary>
	/// <param name="Request"></param>
	/// <param name="href"></param>
	/// <returns></returns>
	public static string GetUrlDomain(this HttpRequestBase Request, string href = null)
	{
		if (Request == null)
			return null;

		string scheme = Request.Url.Scheme.ToLower();
		string host = Request.Url.Host.ToLower();

		string UrlDomain = string.Format("{0}://{1}", scheme, host);

		int port = Request.Url.Port;
		if (port > 0 && ((scheme == "http" && port != 80) || (scheme == "https" && port != 443)))
		{
			UrlDomain += ":" + port.ToString();
		}
		UrlDomain += "/";

		if (!string.IsNullOrEmpty(href))
		{
			if (href.StartsWith("~/"))
				href = href.Substring(2);
			if (href.StartsWith("/"))
				href = href.Substring(1);

			UrlDomain += href;
		}
		return UrlDomain;
	}
	/// <summary>
	/// Lấy domain hiện tại http://www.xxxx.xxx
	/// </summary>
	/// <param name="Request"></param>
	/// <returns></returns>
	public static string GetDomain(this HttpRequestBase Request)
	{
		if (Request == null)
			return null;

		string scheme = Request.Url.Scheme.ToLower();
		string host = Request.Url.Host.ToLower();

		string UrlDomain = string.Format("{0}://{1}", scheme, host);

		int port = Request.Url.Port;
		if (port > 0 && ((scheme == "http" && port != 80) || (scheme == "https" && port != 443)))
		{
			UrlDomain += ":" + port.ToString();
		}
		return UrlDomain;
	}
	public static string GetUrlDomain(this HttpRequest Request, string href = null)
	{
		return Request.RequestContext.HttpContext.Request.GetUrlDomain(href);
	}
	public static string GetDomain(this HttpRequest Request)
	{
		return Request.RequestContext.HttpContext.Request.GetDomain();
	}
	/// <summary>
	/// Lấy chuổi query string từ url mà bỏ qua một vài tham số
	/// </summary>
	/// <param name="Request"></param>
	/// <param name="excludeQueryName">tên tham số bỏ qua, rổng sẽ không bỏ qua tham số nào hết, null sẽ báo lỗi</param>
	/// <returns>chuổi query string đã được loại bỏ các tham số </returns>
    public static string GetQueryWithOut(this HttpRequestBase Request, params string[] excludeQueryName)
    {
        string urlQuery = "";
        var queryString = Request.Url.Query;
        if (queryString.StartsWith("?"))
        {
            queryString = queryString.Substring(1);
        }
        foreach (string query in queryString.Split('&'))
        {
            var isExclude = false;
            foreach (var eqn in excludeQueryName)
            {
                if (query.StartsWith(eqn + "="))
                {
                    isExclude = true;
                    break;
                }
            }
            if (isExclude)
            {
                continue;
            }
            if (urlQuery.Length == 0)
                urlQuery += query;
            else
                urlQuery += "&" + query;
        }
        return urlQuery;
    }
	public static void AddErrorMessage(this System.Web.UI.Page page, string Error, string Group)
	{
		System.Web.UI.WebControls.CustomValidator cv = new System.Web.UI.WebControls.CustomValidator();
		cv.IsValid = false;
		cv.ErrorMessage = Error;
		cv.ValidationGroup = Group;
		page.Validators.Add(cv);
	}

}
