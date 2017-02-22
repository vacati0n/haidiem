using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;

public static class StringExtensions
{
	/// <summary>
	/// Truncate s string with specific character length
	/// </summary>
	/// <param name="s"></param>
	/// <param name="length"></param>
	/// <param name="atWord"></param>
	/// <param name="addEllipsis"></param>
	/// <returns></returns>
	public static string Truncate(this string s, int length, bool atWord, bool addEllipsis)
	{
		// Return if the string is less than or equal to the truncation length
		if (s == null || s.Length <= length)
			return s;

		// Do a simple tuncation at the desired length
		string s2 = s.Substring(0, length);

		// Truncate the string at the word
		if (atWord)
		{
			// List of characters that denote the start or a new word (add to or remove more as necessary)
			List<char> alternativeCutOffs = new List<char>() { ' ', ',', '.', '?', '/', ':', ';', '\'', '\"', '\'', '-' };

			// Get the index of the last space in the truncated string
			int lastSpace = s2.LastIndexOf(' ');

			// If the last space index isn't -1 and also the next character in the original
			// string isn't contained in the alternativeCutOffs List (which means the previous
			// truncation actually truncated at the end of a word),then shorten string to the last space
			if (lastSpace != -1 && (s.Length >= length + 1 && !alternativeCutOffs.Contains(s.ToCharArray()[length])))
				s2 = s2.Remove(lastSpace);
		}

		// Add Ellipsis if desired
		if (addEllipsis)
			s2 += "...";

		return s2;
	}

	/// <summary>
	/// Cắt chuỗi dài vượt quá giới hạn
	/// </summary>
	/// <param name="text">Chuỗi cần cắt</param>
	/// <param name="maxLength">Độ dài nếu chuỗi vượt qua sẽ bị cắt</param>
	/// <param name="bCutEndString">Cắt chuỗi hiển thị: 
	///		- true: cắt hiển thị ... ở giữa
	///		- false: cắt hiển thị ... ở cuối
	/// </param>
	/// <param name="maxLengthShow">Độ dài chuỗi hiển thị sau khi cắt</param>
	/// <returns></returns>
	public static string CutStringOff(this string text, int maxLength, Boolean bCutEndString, int maxLengthShow)
	{
		if (text == null) return null;
		if (maxLength == 0) maxLength = 80;
		if (maxLengthShow == 0) maxLengthShow = 30;

		if (text.Length > maxLength)
		{
			if (bCutEndString)
			{ return string.Format("{0} ... {1}", text.Substring(0, maxLengthShow), text.Substring(text.Length - maxLengthShow, maxLengthShow)); }
			else
			{ return string.Format("{0} ...", text.Substring(0, maxLengthShow)); }
		}
		else
		{ return text; }
	}

	/// <summary>
	/// Strips HTML tags from provided text.
	/// </summary>
	/// <param name="txt">Input text</param>
	/// <returns>Stripped text</returns>
	public static string StripHtmlTags(this string txt)
	{
		if (txt == null)
		{
			return txt;
		}
		bool search = true;
		while (search)
		{
			int start = txt.IndexOf("<!--");
			int end = txt.IndexOf("-->");
			if (start != -1 && end > start)
			{
				txt = txt.Substring(0, start) + txt.Substring((end + 3), txt.Length - (end + 3));
			}
			else
			{
				search = false;
			}
		}
		return Regex.Replace(txt, "<[^>]+>", string.Empty, RegexOptions.Compiled);
	}

	/// <summary>
	/// Converts all accent characters to ASCII characters.
	/// </summary>
	/// <param name="txt">Text that might have accent characters</param>
	/// <returns>Filtered text with replaced "nice" characters</returns>
	public static string NonAccent(this string txt)
	{
		if (!string.IsNullOrWhiteSpace(txt))
		{
			string[] unicode = new string[15] {
"aAeEoOuUiIdDyY", "áàảãạăắằẳẵặâấầẩẫậ", "ÁÀẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬ", "éèẻẽẹêếềểễệ", "ÉÈẺẼẸÊẾỀỂỄỆ",
"óòỏõọôốồổỗộơớờởỡợ", "ÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢ", "úùủũụưứừửữự", "ÚÙỦŨỤƯỨỪỬỮỰ", "íìỉĩị", "ÍÌỈĨỊ", "đ", "Đ", "ýỳỷỹỵ", "ÝỲỶỸỴ"
			};
			string[] utf8 = new string[15] {
"aAeEoOuUiIdDyY", "áàảãạăắằẳẵặâấầẩẫậ", "ÁÀẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬ", "éèẻẽẹêếềểễệ", "ÉÈẺẼẸÊẾỀỂỄỆ",
"óòỏõọôốồổỗộơớờởỡợ", "ÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢ", "úùủũụưứừửữự", "ÚÙỦŨỤƯỨỪỬỮỰ", "íìỉĩị", "ÍÌỈĨỊ", "đ", "Đ", "ýỳỷỹỵ", "ÝỲỶỸỴ"
			};
			for (int i = 1; i < unicode.Length; i++)
			{
				for (int j = 0; j < unicode[i].Length; j++)
				{
					txt = txt.Replace(utf8[i][j], utf8[0][i - 1]).Replace(unicode[i][j], unicode[0][i - 1]);
				}
			}
			txt = Regex.Replace(Regex.Replace(txt, "[^a-zA-Z0-9_-]", "-", RegexOptions.Compiled), "-+", "-", RegexOptions.Compiled).Trim('-');
		}
		else
		{
			txt = string.Empty;
		}
		return txt;
	}

	public static string TrimVietNamMark(this string txt)
	{
		if (!string.IsNullOrWhiteSpace(txt))
		{
			string[] unicode = new string[15] {
"aAeEoOuUiIdDyY", "áàảãạăắằẳẵặâấầẩẫậ", "ÁÀẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬ", "éèẻẽẹêếềểễệ", "ÉÈẺẼẸÊẾỀỂỄỆ",
"óòỏõọôốồổỗộơớờởỡợ", "ÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢ", "úùủũụưứừửữự", "ÚÙỦŨỤƯỨỪỬỮỰ", "íìỉĩị", "ÍÌỈĨỊ", "đ", "Đ", "ýỳỷỹỵ", "ÝỲỶỸỴ"
			};
			string[] utf8 = new string[15] {
"aAeEoOuUiIdDyY", "áàảãạăắằẳẵặâấầẩẫậ", "ÁÀẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬ", "éèẻẽẹêếềểễệ", "ÉÈẺẼẸÊẾỀỂỄỆ",
"óòỏõọôốồổỗộơớờởỡợ", "ÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢ", "úùủũụưứừửữự", "ÚÙỦŨỤƯỨỪỬỮỰ", "íìỉĩị", "ÍÌỈĨỊ", "đ", "Đ", "ýỳỷỹỵ", "ÝỲỶỸỴ"
			};
			for (int i = 1; i < unicode.Length; i++)
			{
				for (int j = 0; j < unicode[i].Length; j++)
				{
					txt = txt.Replace(utf8[i][j], utf8[0][i - 1]).Replace(unicode[i][j], unicode[0][i - 1]);
				}
			}
			//txt = Regex.Replace(Regex.Replace(txt, "[^a-zA-Z0-9_-]", "-", RegexOptions.Compiled), "-+", "-", RegexOptions.Compiled).Trim('-');
		}
		else
		{
			txt = string.Empty;
		}
		return txt;
	}

	/// <summary>
	/// Viết thường ký tự đầu tiên
	/// </summary>
	/// <param name="text"></param>
	/// <returns></returns>
	public static string ToLowerFirstChar(this string text)
	{
		if (text.Length == 0) return "";
		string re = text[0].ToString().ToLower();
		re += text.Substring(1);
		return re;
	}

	public static string[] AnalyzeText(this string text)
	{
		List<string> kq = new List<string>();
		bool passSpace = false;
		string item = "";
		for (int i = 0; i < text.Length; i++)
		{
			if (text[i] == '"')
			{
				item = item.Trim();
				if (!string.IsNullOrEmpty(item))
				{
					kq.Add(item.Trim());
					item = "";
				}
				passSpace = !passSpace;
				continue;
			}
			else if (text[i] == ' ')
			{
				if (passSpace)
				{
					item += " ";
					continue;
				}
				else
				{
					item = item.Trim();
					if (string.IsNullOrEmpty(item)) continue;
					kq.Add(item);
					item = "";
				}
			}
			else
			{
				item += text[i];
			}
		}
		item = item.Trim();
		if (!string.IsNullOrEmpty(item)) kq.Add(item);
		return kq.ToArray();
	}


	/// <summary>
	/// Analyse FullText Search 
	/// </summary>
	/// <param name="text">Text analyse</param>
	/// <returns></returns>
	public static string AnalyzeFullTextSearch(this string text)
	{
		string[] lst = AnalyzeText(text);
		string kq = "";
		bool notAddAND = false;
		for (int i = 0; i < lst.Length; i++)
		{
			string item = lst[i].Trim();
			if (item.Equals("or", StringComparison.OrdinalIgnoreCase)
				|| item.Equals("and", StringComparison.OrdinalIgnoreCase))
			{
				kq += " " + item.ToUpper() + " ";
				notAddAND = true;
				continue;
			}
			else
			{
				if ((kq != "") && !notAddAND)
				{
					kq += " AND ";
				}
				notAddAND = false;
				kq += "\"" + item + "\"";
			}
		}
		return kq;
	}

	/// <summary>
	/// Cut string by number char.
	/// </summary>
	/// <param name="content">String need cut.</param>
	/// <param name="numberChar">Number char need cut.</param>
	/// <returns>New string</returns>
	public static string CutStringByNum(this string content, int numberChar)
	{
		if (string.IsNullOrEmpty(content))
		{
			return content;
		}
		content = content.StripHtmlTags();
		int len = content.Length;
		if (String.IsNullOrEmpty(content) || len <= numberChar) return content.Trim();

		for (int i = 0; i < 10; i++)
		{
			numberChar = numberChar + 1;
			if ((numberChar >= content.Length)
				|| (numberChar < content.Length && content[numberChar] == ' ')) break;
		}
		content = content.Substring(0, numberChar);
		return content + (numberChar < len ? "..." : "");
	}

	public static List<T> ConvertStringToList<T>(this string stringInput, string separate)
	{
		List<T> result = new List<T>();
		string[] arr = stringInput.Split(new string[] { separate }, StringSplitOptions.RemoveEmptyEntries);
		for (var i = 0; i < arr.Length; i++)
		{
			result.Add((T)Convert.ChangeType(arr[i].Trim(), typeof(T)));
		}
		return result;
	}

	/// <summary>
	/// Encode HTML.
	/// Chuyển đổi các ký tự xuống hàng thành &lt;br /&gt;
	/// </summary>
	/// <param name="plainText"></param>
	/// <returns></returns>
	public static string Br2nl(this string plainText)
	{
		plainText = HttpUtility.HtmlEncode(plainText);
		return plainText.Replace(Environment.NewLine, "<br/>");
	}

	/// <summary>
	/// Decode HTML.
	/// Chuyển đổi &lt;br /&gt; thành ký tự xuống hàng
	/// </summary>
	/// <param name="richText"></param>
	/// <returns></returns>
	public static string Nl2br(this string richText)
	{
		richText = HttpUtility.HtmlDecode(richText);
		return richText.Replace("<br/>", Environment.NewLine);
	}

	/// <summary>
	/// Đảo ngược một chuỗi
	/// </summary>
	/// <param name="target"></param>
	/// <returns></returns>
	public static string Inverse(this string target)
	{
		char[] kq = new char[target.Length];
		int index = 0;
		for (int i = target.Length - 1; i >= 0; i--)
		{
			kq[index] = target[i];
			index++;
		}
		return new string(kq);
	}

	/// <summary>
	/// Ứng với kiểu ngày tháng khi encode json sẽ thành "\/Date(1350457433697)\/" (điều này làm javascript không hiểu). 	
	/// </summary>
	/// <param name="jsonText"></param>
	/// <returns>trả về các kiểu ngày tháng thành new Date(1350457433697) </returns>
	public static string FixJsonDate(this string jsonText)
	{
		Regex regex = new Regex("\"\\\\/(Date\\(\\d+\\))\\\\/\"");
		return regex.Replace(jsonText, new MatchEvaluator(delegate(Match match)
		{
			if (match.Groups.Count > 1)
			{
				return "new " + match.Groups[1].Value;
			}
			return match.Value;
		}));
	}

	/// <summary>
	/// Filter input string from metacharacters and other malcious characters knows for XSS exploits
	/// </summary>
	/// <param name="strInput"></param>
	/// <returns></returns>
    //public static string AntiXSSFilter(this string strInput)
    //{
    //    if (!string.IsNullOrEmpty(strInput))
    //    {
    //        strInput = HttpUtility.HtmlEncode(Sanitizer.GetSafeHtmlFragment(strInput));
    //    }
    //    return strInput;
    //}

	public static string RemoveNonAlphanumericChar(this string strInput)
	{
		Regex regEx = new Regex("[^a-zA-Z0-9 -]");
		return regEx.Replace(strInput, "");
	}

	public static string[] SplitNewLine(this string Values)
	{
		if (string.IsNullOrWhiteSpace(Values))
		{
			return new string[1] { Values };
		}
		else
		{
			return Values.Split(new string[] { "\r\n", "\n" }, StringSplitOptions.None);
		}
	}
}
