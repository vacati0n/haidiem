using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;
using Umbraco.Web.Mvc;

namespace Parody.Cms.Core
{
	public class TextItemStorage
	{
		private IDictionary<string, string> Data { get; set; }
		public TextItemStorage()
		{
			Data = new Dictionary<string, string>();
		}
		public void SetTextItem(string key, string data)
		{
			if (Data.ContainsKey(key))
			{
				//override
				Data[key] = data;
			}
			else
			{
				Data.Add(key, data);
			}
		}

		public IDictionary<string, string> GetTextItems()
		{
			return Data;
		}

		public string GetItemValue(string key)
		{
			if (Data.Any() && Data.ContainsKey(key))
			{
				return Data[key];
			}
			return string.Empty;
		}
	}


	public class HtmlItemStorage
	{ 
		private IDictionary<string, IHtmlString> Data { get; set; }
		public HtmlItemStorage()
		{
			Data = new Dictionary<string, IHtmlString>();
		}
		public bool SetHtmlItem(string key, IHtmlString script)
		{
			if (Data.ContainsKey(key))
			{
				return false;
			}
			else
			{
				Data.Add(key, script);
				return true;
			}
		}

		public IEnumerable<IHtmlString> GetHtmlItems()
		{
			return Data.Values;
		}
	}

	public static class ContextItemKeyList
	{
		public const string Parody_REGISTER_SCRIPT_BLOCK = "Parody_REGISTER_SCRIPT_BLOCK";
		public const string Parody_REGISTER_SCRIPT_LINK = "Parody_REGISTER_SCRIPT_LINK";
		public const string Parody_REGISTER_CSS_LINK = "Parody_REGISTER_CSS_LINK";
		public const string Parody_REGISTER_HEAD_TAG = "Parody_REGISTER_HEAD_TAG";
		public const string Parody_REGISTER_JS_LANG = "Parody_REGISTER_JS_LANG";
		public const string Parody_PAGE_TITLE = "Parody_PAGE_TITLE";
		public const string Parody_PAGE_KEYWORDS = "Parody_PAGE_KEYWORDS";
		public const string Parody_PAGE_DESCRIPTION = "Parody_PAGE_DESCRIPTION";
		public const string Parody_PAGE_CANONICAL_LINK = "Parody_PAGE_CANONICAL_LINK";
	}

	public static class ContextItemMonitor
	{
		#region Javascript Lang
		public static void RegisteredJsLang(this WebPage webPage, string dictionaryKey)
		{
			RegisteredJsLang(webPage.Context, dictionaryKey);
		}
		public static void RegisteredJsLang(this WebViewPage webPage, string dictionaryKey)
		{
			RegisteredJsLang(webPage.Context, dictionaryKey);
		}

		public static void RegisteredJsLang(this System.Web.WebPages.WebPage webPage, string key, string value)
		{
			RegisteredJsLang(webPage.Context, key, value);
		}
		public static void RegisteredJsLang(this WebViewPage webPage, string key, string value)
		{
			RegisteredJsLang(webPage.Context, key, value);
		}

		private static void RegisteredJsLang(this HttpContextBase context, string dictionaryKey)
		{
			TextItemStorage rs = null;
			string contextItemKey = ContextItemKeyList.Parody_REGISTER_JS_LANG;
			if (context.Items.Contains(contextItemKey) == false || !(context.Items[contextItemKey] is TextItemStorage))
			{
				context.Items[contextItemKey] = rs = new TextItemStorage();
			}
			else
			{
				rs = context.Items[contextItemKey] as TextItemStorage;
			}
			string value = umbraco.library.GetDictionaryItem(dictionaryKey);
			rs.SetTextItem(dictionaryKey, value);
		}

		private static void RegisteredJsLang(HttpContextBase context, string key, string value)
		{
			TextItemStorage rs = null;
			string contextItemKey = ContextItemKeyList.Parody_REGISTER_JS_LANG;
			if (context.Items.Contains(contextItemKey) == false || !(context.Items[contextItemKey] is TextItemStorage))
			{
				context.Items[contextItemKey] = rs = new TextItemStorage();
			}
			else
			{
				rs = context.Items[contextItemKey] as TextItemStorage;
			}
			rs.SetTextItem(key, value);
		}

		public static IHtmlString RenderRegisteredJsLang(this WebViewPage webPage)
		{
			StringBuilder sb = new StringBuilder();
			string contextItemKey = ContextItemKeyList.Parody_REGISTER_JS_LANG;
			if (webPage.Context.Items.Contains(contextItemKey))
			{
				TextItemStorage rs = webPage.Context.Items[contextItemKey] as TextItemStorage;
				if (rs != null)
				{
					var jsLangItems = rs.GetTextItems();
					if (jsLangItems != null && jsLangItems.Any())
					{
						sb.AppendLine("<script language=\"javascript\" type=\"text/javascript\">");
						sb.AppendLine("var Lang = window.Lang || new Array();");
						foreach (var item in jsLangItems)
						{
							sb.AppendLine(string.Format("Lang[\"{0}\"] = \"{1}\";", item.Key, item.Value));
						}
						sb.AppendLine("</script>");
					}
				}
			}
			return new HtmlString(sb.ToString());
		}

		#endregion	

		#region Script Files

		/// <summary>
		/// Đăng ký một link javascript để master page dùng
		/// </summary>
		/// <param name="webPage"></param>
		/// <param name="key">Để xác định link trùng</param>
		/// <param name="link">link javascript (link ảo)</param>
		public static void RegisteredScripts(this System.Web.WebPages.WebPage webPage, string key, string link)
		{
			RegisteredScripts(webPage.Context, key, link);
		}
		public static void RegisteredScripts(this WebViewPage webPage, string key, string link)
		{
			RegisteredScripts(webPage.Context, key, link);
		}
		public static void RegisteredScripts(this HttpContextBase context, string key, string link)
		{
			TextItemStorage rs = null;
			string contextItemKey = ContextItemKeyList.Parody_REGISTER_SCRIPT_LINK;
			if (context.Items.Contains(contextItemKey) == false || !(context.Items[contextItemKey] is TextItemStorage))
			{
				context.Items[contextItemKey] = rs = new TextItemStorage();
			}
			else
			{
				rs = context.Items[contextItemKey] as TextItemStorage;
			}
			rs.SetTextItem(key, link);
		}
		public static IHtmlString RenderRegisteredScripts(this WebViewPage webPage)
		{
			StringBuilder sb = new StringBuilder();
			string contextItemKey = ContextItemKeyList.Parody_REGISTER_SCRIPT_LINK;
			if (webPage.Context.Items.Contains(contextItemKey))
			{
				TextItemStorage rs = webPage.Context.Items[contextItemKey] as TextItemStorage;
				if (rs != null)
				{
					var items = rs.GetTextItems();
					foreach (var item in items)
					{
						sb.AppendFormat("<script src=\"{0}\" type=\"text/javascript\"></script>", webPage.Url.Content(item.Value));
					}
				}
			}
			return new HtmlString(sb.ToString());
		}
		#endregion

		#region Script Block

		public static void RegisteredScriptBlock(this System.Web.WebPages.WebPage webPage, string key, IHtmlString scriptBlock)
		{
			RegisteredScriptBlock(webPage.Context, key, scriptBlock);
		}
		public static void RegisteredScriptBlock(this WebViewPage webPage, string key, IHtmlString scriptBlock)
		{
			RegisteredScriptBlock(webPage.Context, key, scriptBlock);
		}
		public static void RegisteredScriptBlock(this HttpContextBase context, string key, IHtmlString scriptBlock)
		{
			HtmlItemStorage rs = null;
			string contextItemKey = ContextItemKeyList.Parody_REGISTER_SCRIPT_BLOCK;
			if (context.Items.Contains(contextItemKey) == false || !(context.Items[contextItemKey] is HtmlItemStorage))
			{
				context.Items[contextItemKey] = rs = new HtmlItemStorage();
			}
			else
			{
				rs = context.Items[contextItemKey] as HtmlItemStorage;
			}
			rs.SetHtmlItem(key, scriptBlock);
		}
		public static IHtmlString RenderRegisteredScriptBlock(this WebViewPage webPage)
		{
			StringBuilder sb = new StringBuilder();
			string contextItemKey = ContextItemKeyList.Parody_REGISTER_SCRIPT_BLOCK;
			if (webPage.Context.Items.Contains(contextItemKey))
			{
				HtmlItemStorage rs = webPage.Context.Items[contextItemKey] as HtmlItemStorage;
				if (rs != null)
				{
					var blocks = rs.GetHtmlItems();
					foreach (var block in blocks)
					{
						sb.AppendLine(block.ToHtmlString());
					}
				}
			}
			return new HtmlString(sb.ToString());
		}
		#endregion

		#region CSS
		public static void RegisteredCss(this System.Web.WebPages.WebPage webPage, string key, string linkCss)
		{
			RegisteredCss(webPage.Context, key, linkCss);
		}
		public static void RegisteredCss(this WebViewPage webPage, string key, string linkCss)
		{
			RegisteredCss(webPage.Context, key, linkCss);
		}
		public static void RegisteredCss(this HttpContextBase context, string key, string linkCss)
		{
			TextItemStorage rs = null;
			string contextItemKey = ContextItemKeyList.Parody_REGISTER_CSS_LINK;
			if (context.Items.Contains(contextItemKey) == false || !(context.Items[contextItemKey] is TextItemStorage))
			{
				context.Items[contextItemKey] = rs = new TextItemStorage();
			}
			else
			{
				rs = context.Items[contextItemKey] as TextItemStorage;
			}
			rs.SetTextItem(key, linkCss);
		}
		public static IHtmlString RenderRegisteredCss(this WebViewPage webPage)
		{
			StringBuilder sb = new StringBuilder();
			string contextItemKey = ContextItemKeyList.Parody_REGISTER_CSS_LINK;
			if (webPage.Context.Items.Contains(contextItemKey))
			{
				TextItemStorage rs = webPage.Context.Items[contextItemKey] as TextItemStorage;
				if (rs != null)
				{
					var items = rs.GetTextItems();
					foreach (var item in items)
					{
						sb.AppendFormat("<link href=\"{0}\" rel=\"stylesheet\" />", webPage.Url.Content(item.Value));
					}
				}
			}
			return new HtmlString(sb.ToString());
		}
		#endregion

		#region Head Tag
		public static void RegisteredTagHead(this System.Web.WebPages.WebPage webPage, string key, IHtmlString html)
		{
			RegisteredTagHead(webPage.Context, key, html);
		}
		public static void RegisteredTagHead(this WebViewPage webPage, string key, IHtmlString html)
		{
			RegisteredTagHead(webPage.Context, key, html);
		}
		public static void RegisteredTagHead(this HttpContextBase context, string key, IHtmlString html)
		{
			HtmlItemStorage rs = null;
			string contextItemKey = ContextItemKeyList.Parody_REGISTER_HEAD_TAG;
			if (context.Items.Contains(contextItemKey) == false || !(context.Items[contextItemKey] is HtmlItemStorage))
			{
				context.Items[contextItemKey] = rs = new HtmlItemStorage();
			}
			else
			{
				rs = context.Items[contextItemKey] as HtmlItemStorage;
			}
			rs.SetHtmlItem(key, html);
		}
		public static IHtmlString RenderRegisteredTagHead(this WebViewPage webPage)
		{
			StringBuilder sb = new StringBuilder();
			string contextItemKey = ContextItemKeyList.Parody_REGISTER_HEAD_TAG;
			if (webPage.Context.Items.Contains(contextItemKey))
			{
				HtmlItemStorage rs = webPage.Context.Items[contextItemKey] as HtmlItemStorage;
				if (rs != null)
				{
					var data = rs.GetHtmlItems();
					foreach (var item in data)
					{
						sb.AppendLine(item.ToHtmlString());
					}
				}
			}
			return new HtmlString(sb.ToString());
		}
		#endregion

		#region Page Title

		public static void SetPageTitle(this System.Web.WebPages.WebPage webPage, string pageTitle)
		{
			SetPageTitle(webPage.Context, pageTitle);
		}
		public static void SetPageTitle(this WebViewPage webPage, string pageTitle)
		{
			SetPageTitle(webPage.Context, pageTitle);
		}

		public static void SetPageTitle(this HttpContextBase context, string pageTitle)
		{
			string contextItemKey = ContextItemKeyList.Parody_PAGE_TITLE;
			if (context.Items.Contains(contextItemKey))
			{
				context.Items[contextItemKey] = pageTitle;
			}
			else
			{
				context.Items.Add(contextItemKey, pageTitle);
			}
		}
		public static string GetPageTitle(this WebViewPage webPage, UmbracoTemplatePage page)
		{
			string contextItemKey = ContextItemKeyList.Parody_PAGE_TITLE;
			if (webPage.Context.Items.Contains(contextItemKey))
			{
				return webPage.Context.Items[contextItemKey].ToString();
			}
			var title = page.CurrentPage.pageTitle;
			// nếu chưa lấy trang hiện tại
			var maxLev = 100; // tránh lặp vô tận
			var lev = 0;
			var currentPage = page.CurrentPage;
			//umbraco.MacroEngines.DynamicNode
			// nếu keyword null ta sẽ ráng lấy thằng cha bỏ vào.
			while (string.IsNullOrWhiteSpace(title) && lev++ < maxLev && currentPage.Parent != null)
			{
				currentPage = currentPage.Parent;
				title = currentPage.pageTitle;
			}
			return title;
		}
		#endregion

		#region Page Description
		public static void SetPageDescription(this System.Web.WebPages.WebPage webPage, string pageDescription)
		{
			SetPageDescription(webPage.Context, pageDescription);
		}
		public static void SetPageDescription(this WebViewPage webPage, string pageDescription)
		{
			SetPageDescription(webPage.Context, pageDescription);
		}
		public static void SetPageDescription(this HttpContextBase context, string pageDescription)
		{
			string contextItemKey = ContextItemKeyList.Parody_PAGE_DESCRIPTION;
			if (context.Items.Contains(contextItemKey))
			{
				context.Items[contextItemKey] = pageDescription;
			}
			else
			{
				context.Items.Add(contextItemKey, pageDescription);
			}
		}

		public static string GetPageDescription(this WebViewPage webPage, UmbracoTemplatePage page)
		{
			// kiêm tra xem có set description chưa
			string contextItemKey = ContextItemKeyList.Parody_PAGE_DESCRIPTION;
			if (webPage.Context.Items.Contains(contextItemKey))
			{
				return webPage.Context.Items[contextItemKey].ToString().RemoveNonAlphanumericChar();
			}
			// nếu chưa lấy trang hiện tại
			string pageDescription = page.CurrentPage.pageDescription;
			var maxLev= 100; // tránh lặp vô tận
			var lev = 0;
			var currentPage = page.CurrentPage;
			//umbraco.MacroEngines.DynamicNode
			// lấy pageDescription cha nếu trang hiện tại không có
			while (string.IsNullOrWhiteSpace(pageDescription) && lev++ < maxLev && currentPage.Parent != null)
			{				
				currentPage = currentPage.Parent;
				pageDescription = currentPage.pageDescription;
			}
			return pageDescription;
		}
		#endregion

		#region Page Keywords
		public static void SetPageKeywords(this System.Web.WebPages.WebPage webPage, string pageKeywords)
		{
			SetPageKeywords(webPage.Context, pageKeywords);
		}
		public static void SetPageKeywords(this WebViewPage webPage, string pageKeywords)
		{
			SetPageKeywords(webPage.Context, pageKeywords);
		}

		public static void SetPageKeywords(this HttpContextBase context, string pageKeywords)
		{
			TextItemStorage rs = null;
			string contextItemKey = ContextItemKeyList.Parody_PAGE_KEYWORDS;
			if (context.Items.Contains(contextItemKey) == false || !(context.Items[contextItemKey] is TextItemStorage))
			{
				context.Items[contextItemKey] = rs = new TextItemStorage();
			}
			else
			{
				rs = context.Items[contextItemKey] as TextItemStorage;
			}
			foreach (string keywords in pageKeywords.Split(',').Where(s => s.Trim().Length > 0))
			{
				rs.SetTextItem(keywords, keywords);	
			}
		}
		public static string GetPageKeywords(this WebViewPage webPage, UmbracoTemplatePage page)
		{
			string contextItemKey = ContextItemKeyList.Parody_PAGE_KEYWORDS;
			string pageKeywords = page.CurrentPage.pageKeywords;
			if (webPage.Context.Items.Contains(contextItemKey))
			{
				TextItemStorage rs = webPage.Context.Items[contextItemKey] as TextItemStorage;
				if (rs != null)
				{
					if (!string.IsNullOrWhiteSpace(pageKeywords))
					{
						webPage.SetPageKeywords(pageKeywords);
					}
					pageKeywords = rs.GetTextItems().Values.ConvertListToString(", ");
				}
			}
			// nếu chưa lấy trang hiện tại
			var maxLev = 100; // tránh lặp vô tận
			var lev = 0;
			var currentPage = page.CurrentPage;
			//umbraco.MacroEngines.DynamicNode
			// nếu keyword null ta sẽ ráng lấy thằng cha bỏ vào.
			while (string.IsNullOrWhiteSpace(pageKeywords) && lev++ < maxLev && currentPage.Parent != null)
			{
				currentPage = currentPage.Parent;
				pageKeywords = currentPage.pageKeywords;
			}
			return pageKeywords;

		}
		#endregion

		#region Canonical Link

		public static void SetCanonicalLink(this System.Web.WebPages.WebPage webPage, string canonicalLink)
		{
			SetCanonicalLink(webPage.Context, canonicalLink);
		}
		public static void SetCanonicalLink(this WebViewPage webPage, string mainLink)
		{
			SetCanonicalLink(webPage.Context, mainLink);
		}

		public static void SetCanonicalLink(this HttpContextBase context, string canonicalLink)
		{
			string contextItemKey = ContextItemKeyList.Parody_PAGE_CANONICAL_LINK;
			if (context.Items.Contains(contextItemKey))
			{
				context.Items[contextItemKey] = canonicalLink;
			}
			else
			{
				context.Items.Add(contextItemKey, canonicalLink);
			}
		}
		public static IHtmlString RenderCanonicalBlock(this WebViewPage webPage, UmbracoTemplatePage page)
		{
			string contextItemKey = ContextItemKeyList.Parody_PAGE_CANONICAL_LINK;
			string canonicalLink = page.CurrentPage.Url;
			string canonicalScript = string.Empty;
			if (webPage.Context.Items.Contains(contextItemKey) && !string.IsNullOrWhiteSpace(webPage.Context.Items[contextItemKey].ToString()))
			{
				canonicalLink = webPage.Context.Items[contextItemKey].ToString();
			}
			if (canonicalLink != page.Request.Url.AbsoluteUri.ToLower())
			{
				canonicalScript = "<link rel=\"canonical\" href=\"" + canonicalLink + "\" />";
			}
			return new HtmlString(canonicalScript);
		}
		#endregion
        #region Facebook Meta 
        public static string GetFacebookTitle(this WebViewPage webPage, UmbracoTemplatePage page)
        {
            string contextItemKey = ContextItemKeyList.Parody_PAGE_TITLE;
            if (webPage.Context.Items.Contains(contextItemKey))
            {
                return webPage.Context.Items[contextItemKey].ToString();
            }
            var title = page.CurrentPage.facebookTitle;
            // nếu chưa lấy trang hiện tại
            var maxLev = 100; // tránh lặp vô tận
            var lev = 0;
            var currentPage = page.CurrentPage;
            //umbraco.MacroEngines.DynamicNode
            // nếu keyword null ta sẽ ráng lấy thằng cha bỏ vào.
            while (string.IsNullOrWhiteSpace(title) && lev++ < maxLev && currentPage.Parent != null)
            {
                currentPage = currentPage.Parent;
                title = currentPage.facebookTitle;
            }
            return title;
        }
        public static string GetFacebookDescription(this WebViewPage webPage, UmbracoTemplatePage page)
        {
            // kiêm tra xem có set description chưa
            string contextItemKey = ContextItemKeyList.Parody_PAGE_DESCRIPTION;
            if (webPage.Context.Items.Contains(contextItemKey))
            {
                return webPage.Context.Items[contextItemKey].ToString().RemoveNonAlphanumericChar();
            }
            // nếu chưa lấy trang hiện tại
            string pageDescription = page.CurrentPage.facebookDescription;
            var maxLev = 100; // tránh lặp vô tận
            var lev = 0;
            var currentPage = page.CurrentPage;
            //umbraco.MacroEngines.DynamicNode
            // lấy pageDescription cha nếu trang hiện tại không có
            while (string.IsNullOrWhiteSpace(pageDescription) && lev++ < maxLev && currentPage.Parent != null)
            {
                currentPage = currentPage.Parent;
                pageDescription = currentPage.facebookDescription;
            }
            return pageDescription;
        }
        public static string GetFacebookImage(this WebViewPage webPage, UmbracoTemplatePage page)
        {
            string contextItemKey = ContextItemKeyList.Parody_PAGE_TITLE;
            if (webPage.Context.Items.Contains(contextItemKey))
            {
                return webPage.Context.Items[contextItemKey].ToString();
            }
            var title = page.CurrentPage.facebookImage;
            // nếu chưa lấy trang hiện tại
            var maxLev = 100; // tránh lặp vô tận
            var lev = 0;
            var currentPage = page.CurrentPage;
            //umbraco.MacroEngines.DynamicNode
            // nếu keyword null ta sẽ ráng lấy thằng cha bỏ vào.
            while (string.IsNullOrWhiteSpace(title) && lev++ < maxLev && currentPage.Parent != null)
            {
                currentPage = currentPage.Parent;
                title = currentPage.facebookImage;
            }
            return title;
        }
        #endregion
    }
	public static class TempDataItemMonitor
	{ 
	
	}
}
