using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;

namespace Parody.Cms
{
	public static class FileExtensions
	{
		/// <summary>
		/// Kiểm tra xem file up lên có phải là hình
		/// </summary>
		/// <param name="postedFile"></param>
		/// <returns></returns>
		public static bool IsImage(this HttpPostedFileBase postedFile)
		{
			//  Check the image mime types
			// do khi upload hình bằng flash sẽ không có content type này
			//if (postedFile.ContentType.ToLower() != "image/jpg" &&
			//			postedFile.ContentType.ToLower() != "image/jpeg" &&
			//			postedFile.ContentType.ToLower() != "image/pjpeg" &&
			//			postedFile.ContentType.ToLower() != "image/gif" &&
			//			postedFile.ContentType.ToLower() != "image/x-png" &&
			//			postedFile.ContentType.ToLower() != "image/png")
			//{
			//	return false;
			//}

			//  Check the image extension
			if (Path.GetExtension(postedFile.FileName).ToLower() != ".jpg"
				&& Path.GetExtension(postedFile.FileName).ToLower() != ".png"
				&& Path.GetExtension(postedFile.FileName).ToLower() != ".gif"
				&& Path.GetExtension(postedFile.FileName).ToLower() != ".jpeg")
			{
				return false;
			}

			//  Check các byte đầu
			try
			{
				if (!postedFile.InputStream.CanRead)
				{
					return false;
				}

				byte[] buffer = new byte[512];
				postedFile.InputStream.Read(buffer, 0, 512);
				string content = System.Text.Encoding.UTF8.GetString(buffer);
				if (Regex.IsMatch(content, @"<script|<html|<head|<title|<body|<pre|<table|<a\s+href|<img|<plaintext|<cross\-domain\-policy",
					RegexOptions.IgnoreCase | RegexOptions.CultureInvariant | RegexOptions.Multiline))
				{
					return false;
				}
			}
			catch (Exception)
			{
				return false;
			}

			//  Try tạo mới Bitmap, nếu có lổi thì chắc không phải là hình ảnh
			try
			{
				using (var bitmap = new System.Drawing.Bitmap(postedFile.InputStream))
				{
				}
			}
			catch (Exception)
			{
				return false;
			}

			return true;
		}
		/// <summary>
		/// Kiểm tra xem file up lên có phải là hình
		/// </summary>
		/// <param name="postedFile"></param>
		/// <returns></returns>
		public static bool IsImage(this HttpPostedFile postedFile)
		{
			//  Check the image mime types
			if (postedFile.ContentType.ToLower() != "image/jpg" &&
						postedFile.ContentType.ToLower() != "image/jpeg" &&
						postedFile.ContentType.ToLower() != "image/pjpeg" &&
						postedFile.ContentType.ToLower() != "image/gif" &&
						postedFile.ContentType.ToLower() != "image/x-png" &&
						postedFile.ContentType.ToLower() != "image/png")
			{
				return false;
			}

			//  Check the image extension
			if (Path.GetExtension(postedFile.FileName).ToLower() != ".jpg"
				&& Path.GetExtension(postedFile.FileName).ToLower() != ".png"
				&& Path.GetExtension(postedFile.FileName).ToLower() != ".gif"
				&& Path.GetExtension(postedFile.FileName).ToLower() != ".jpeg")
			{
				return false;
			}

			//  Check các byte đầu
			try
			{
				if (!postedFile.InputStream.CanRead)
				{
					return false;
				}

				byte[] buffer = new byte[512];
				postedFile.InputStream.Read(buffer, 0, 512);
				string content = System.Text.Encoding.UTF8.GetString(buffer);
				if (Regex.IsMatch(content, @"<script|<html|<head|<title|<body|<pre|<table|<a\s+href|<img|<plaintext|<cross\-domain\-policy",
					RegexOptions.IgnoreCase | RegexOptions.CultureInvariant | RegexOptions.Multiline))
				{
					return false;
				}
			}
			catch (Exception)
			{
				return false;
			}

			//  Try tạo mới Bitmap, nếu có lổi thì chắc không phải là hình ảnh
			try
			{
				using (var bitmap = new System.Drawing.Bitmap(postedFile.InputStream))
				{
				}
			}
			catch (Exception)
			{
				return false;
			}

			return true;
		}
	}
}
