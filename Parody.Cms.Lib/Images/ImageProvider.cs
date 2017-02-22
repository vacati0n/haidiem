using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace Parody.Cms.Images
{
	public class ImageProvider :IDisposable
	{
		public Image image;
		public ImageFormat imageFormat;
		public string ext = ".jpg";
		public ImageProvider(string imagePath)
		{
			image = Image.FromFile(imagePath);
			imageFormat = ImageFormat.Jpeg;
			if (image.RawFormat == ImageFormat.Gif)
			{
				ext = ".gif";
				imageFormat = ImageFormat.Gif;
			}
			else if (image.RawFormat == ImageFormat.Png)
			{
				ext = ".png";
				imageFormat = ImageFormat.Png;
			}
		}
        public ImageProvider(Image img)
        {
            this.image = img;
            imageFormat = ImageFormat.Jpeg;
            if (image.RawFormat == ImageFormat.Gif)
            {
                ext = ".gif";
                imageFormat = ImageFormat.Gif;
            }
            else if (image.RawFormat == ImageFormat.Png)
            {
                ext = ".png";
                imageFormat = ImageFormat.Png;
            }
        }
		public void Corp(int w, int h, int x, int y)
		{
			Rectangle cropRect = new Rectangle(x,y, w,h);
			Bitmap target = new Bitmap(cropRect.Width, cropRect.Height);
			using(Graphics g = Graphics.FromImage(target))
			{				
			   g.DrawImage(image, new Rectangle(0, 0, target.Width, target.Height), cropRect, GraphicsUnit.Pixel);
			}			
			image.Dispose();
			image = target;
		}

		public void Resize(int w, int h)
		{
			Bitmap target = new Bitmap(w, h);
			using (Graphics g = Graphics.FromImage(target))
			{
				g.SmoothingMode = SmoothingMode.HighQuality;
				g.InterpolationMode = InterpolationMode.HighQualityBicubic;
				g.PixelOffsetMode = PixelOffsetMode.HighQuality;
				g.DrawImage(image, new Rectangle(0, 0, w, h));
			}
			image.Dispose();
			image = target;
		}
		/// <summary>
		/// Resize image - giữ nguyên tỷ lệ hình - phần dư tự động fill màu color
		/// </summary>
		/// <param name="w"></param>
		/// <param name="h"></param>
		/// <param name="color">Màu sẽ fill vào phần dư</param>
		public void ResizeFill(int w, int h, Color color)
		{
			// kích thước hình sẽ đổi đến
			int cw, ch = 0;
			#region Tính toán size của image sẽ được đổi đến
			/*cách cũ*/
			/*
			var ow = image.Width;
			var oh = image.Height;
			//tỷ lệ Width/Height 
			var of = (ow * 1.0) / (oh * 1.0);
			//tỷ lệ Width/Height cần đổi
			var f = (w * 1.0) / (h * 1.0);
			if (of == f)
			{
				cw = w;
				ch = h;
			}
			else if (of > f)
			{
				ch = h;
				cw = (int) Math.Round(h * of);
			}
			else
			{
				cw = w;
				ch = (int)Math.Round(w / of);
			}*/
			/*cách khac*/
			var fx = (w * 1.0) / (image.Width * 1.0);
			var fy = (h * 1.0) / (image.Height * 1.0);
			var f = Math.Min(fx, fy);
			cw = (int)Math.Round(f * image.Width);
			ch = (int)Math.Round(f * image.Height);

			// đề phòng cw, ch = 0;
			cw = Math.Max(cw, 1);
			ch = Math.Max(ch, 1);
			#endregion
			// tọa dộ của image
			int x, y = 0;
			x = (w - cw) / 2;
			y = (h - ch) / 2;
			Bitmap target = new Bitmap(w, h);
			using (Graphics g = Graphics.FromImage(target))
			{
				Brush brush = new SolidBrush(color);
				g.FillRectangle(brush, 0, 0, w, h);
				g.SmoothingMode = SmoothingMode.HighQuality;
				g.InterpolationMode = InterpolationMode.HighQualityBicubic;
				g.PixelOffsetMode = PixelOffsetMode.HighQuality;
				g.CompositingQuality = CompositingQuality.HighQuality;

				// Copy the old image to the new and resized
				g.DrawImage(image, new Rectangle(x, y, cw, ch));
			}
			image.Dispose();
			image = target;
		}
		/// <summary>
		/// Resize image - giữ nguyên tỷ lệ hình - phần dư tự động để trắng (hoặc Transparent)
		/// </summary>
		/// <param name="w"></param>
		/// <param name="h"></param>
		public void ResizeFill(int w, int h)
		{
			if (imageFormat == ImageFormat.Gif || imageFormat == ImageFormat.Png)
			{
				ResizeFill(w, h, Color.Transparent);
			}
			else
			{
				ResizeFill(w, h, Color.White);
			}
		}

		/// <summary>
		/// Resize image - giữ nguyên tỷ lệ hình - phần dư tự động để trắng (hoặc Transparent)
		/// </summary>
		/// <param name="w"></param>
		/// <param name="h"></param>
		public void ResizeCrop(int w, int h)
		{
			// kích thước hình sẽ đổi đến
			int cw, ch = 0;
			#region Tính toán size của image sẽ được đổi đến
			var fx = (image.Width * 1.0) / (w * 1.0);
			var fy = (image.Height * 1.0)/ (h * 1.0);
			var f = Math.Min(fx, fy);
			cw = (int)Math.Round(f * w);
			ch = (int)Math.Round(f * h);

			// đề phòng cw, ch = 0;
			cw = Math.Max(cw, 1);
			ch = Math.Max(ch, 1);
			#endregion
			// tọa dộ của image
			int x, y = 0;
			x = (image.Width - cw) / 2;
			y = (image.Height - ch) / 2;
			Rectangle cropRect = new Rectangle(x, y, cw, ch);
			Bitmap target = new Bitmap(w, h);
			using (Graphics g = Graphics.FromImage(target))
			{
				g.SmoothingMode = SmoothingMode.HighQuality;
				g.InterpolationMode = InterpolationMode.HighQualityBicubic;
				g.PixelOffsetMode = PixelOffsetMode.HighQuality;
				g.CompositingQuality = CompositingQuality.HighQuality;

				// Copy the old image to the new and resized
				g.DrawImage(image, new Rectangle(0, 0, w, h), cropRect, GraphicsUnit.Pixel);
			}
			image.Dispose();
			image = target;
		}

		public void SaveAs(string pathFull)
		{
			if (System.IO.File.Exists(pathFull))
			{
				System.IO.File.Delete(pathFull);
			}
			image.Save(pathFull, imageFormat);
		}
	
		public string SaveAs(string path, string imageName)
		{
			// Copy metadata
			//var imageEncoders = ImageCodecInfo.GetImageEncoders();
			//var codec = imageFormat == ImageFormat.Png || imageFormat == ImageFormat.Gif
			//	? imageEncoders.Single(t => t.MimeType.Equals("image/png"))
			//	: imageEncoders.Single(t => t.MimeType.Equals("image/jpeg"));

			//// Set compresion ratio to 90%
			//var ep = new EncoderParameters();
			//ep.Param[0] = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 90L);

			string name = imageName + ext;
			if(System.IO.Directory.Exists(path) ==false)
			{
				System.IO.Directory.CreateDirectory(path);
			}
			string pathFull = System.IO.Path.Combine(path, name);
			if(System.IO.File.Exists(pathFull))
			{
				System.IO.File.Delete(pathFull);
			}
			image.Save(pathFull, imageFormat);
			
			return name;
		}

		public void Dispose()
		{
			this.image.Dispose();
		}
	}
}
