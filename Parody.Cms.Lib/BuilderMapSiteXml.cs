using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Xml;
using System.IO;


namespace Parody.Cms
{
	/// <summary>
	/// Class hỗ trợ cho việc Build file site map
	/// </summary>
	public class BuilderMapSiteXml
	{
		private List<ItemObject> items;
		private List<string> listUrl;
		private const string xmlSitemap = "http://www.sitemaps.org/schemas/sitemap/0.9";
		public const string ResponseContentTypeXml = "text/xml";

		public BuilderMapSiteXml()
		{
			items = new List<ItemObject>();
			listUrl = new List<string>();
		}

		private XmlDocument BuildXmlDocument()
		{
			System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
			doc.AppendChild(doc.CreateXmlDeclaration("1.0", "UTF-8", String.Empty));
			XmlNode Root = doc.CreateElement("urlset");
			XmlAttribute xmlAttribute = doc.CreateAttribute("xmlns");
			xmlAttribute.InnerText = xmlSitemap;
			Root.Attributes.Append(xmlAttribute);
			doc.AppendChild(Root);

			for (int i = 0; i < items.Count; i++)
			{
				BuilderItem(doc, Root, items[i]);
			}
			for (int i = 0; i < listUrl.Count; i++)
			{
				FillValue(doc, Root, listUrl[i], DateTime.Now);
			}
			return doc;
		}

		/// <summary>
		/// Lưu tạo ra file mapsite
		/// </summary>
		/// <param name="path"></param>
		public void SaveMapSite(string path)
		{
			var doc = BuildXmlDocument();
			doc.Save(path);
		}

		public void SaveMapSite(Stream outputStream)
		{
			var doc = BuildXmlDocument();
			doc.Save(outputStream);
		}

		/// <summary>
		/// Trả về mapsite XML
		/// </summary>
		public string GenerateMapSiteXml()
		{
			return BuildXmlDocument().InnerXml;
		}

		private void BuilderItem(System.Xml.XmlDocument doc, XmlNode Root, ItemObject item)
		{
			foreach (string url in item.ListUrl)
			{
				FillValue(doc, Root, string.Format(item.FormatUrl, url), DateTime.Now);
			}
		}

		public void AddItem(IEnumerable<string> listUrl, string formatUrl)
		{
			items.Add(new ItemObject()
			{
				ListUrl = listUrl,
				FormatUrl = formatUrl
			});
		}

		public void AddItem(string url)
		{
			listUrl.Add(url);
		}

		private class ItemObject
		{
			public IEnumerable<string> ListUrl { get; set; }
			public string FormatUrl { get; set; }
		}

		private void FillValue(XmlDocument doc, XmlNode root, string loc, DateTime lastmod)
		{
			XmlElement el = doc.CreateElement("url");
			XmlElement elLoc = doc.CreateElement("loc");
			XmlElement elLastMod = doc.CreateElement("lastmod");
			XmlElement elChangefreq = doc.CreateElement("changefreq");
			XmlElement elPriority = doc.CreateElement("priority");

			el.AppendChild(elLoc);
			el.AppendChild(elLastMod);
			el.AppendChild(elChangefreq);
			el.AppendChild(elPriority);

			elLoc.InnerText = loc;
			elLastMod.InnerText = lastmod.ToString("yyyy-MM-dd");
			elChangefreq.InnerText = "weekly";
			elPriority.InnerText = "0.5";

			root.AppendChild(el);
		}
	}
}
