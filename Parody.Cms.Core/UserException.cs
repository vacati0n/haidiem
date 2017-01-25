using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Parody.Cms.Core
{
	/// <summary>
	/// Ném lỗi do người dùng gây ra (nhập trùng, sai logic ...)
	/// </summary>
	public class UserException : Exception
	{
		public string Code { get; set; }
		public string Field { get; set; }
		public UserException(string message)
			: base(message)
		{
			this.Code = "501";
			this.Field = "";
		}
		public UserException(string field, string message)
			: this(message)
		{
			this.Field = field;
		}
	}
	/// <summary>
	/// Lỗi khi chưa đăng nhập
	/// </summary>
	public class LoginException : UserException
	{
		public LoginException() : this("Login") { }
		public LoginException(string message)
			: base("message")
		{
			this.Code = "100";
			this.Field = "";
		}

	}
	/// <summary>
	/// Lỗi khi không có quyền
	/// </summary>
	public class AuthException : UserException
	{
		public AuthException() : this("Auth") { }
		public AuthException(string message)
			: base(message)
		{
			this.Code = "101";
			this.Field = "";
		}

	}
}