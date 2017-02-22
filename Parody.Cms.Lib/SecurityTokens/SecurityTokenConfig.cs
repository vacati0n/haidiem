using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;

namespace Dsquare.Core.SecurityTokens
{
	public class SecurityTokenConfig
	{
		private static string SectionName = "SecurityToken";
		private static SecurityTokenSection _config;
		public static ISecurityTokenConfig Current
		{
			get
			{
				if (_config == null)
				{
					object obj = ConfigurationManager.GetSection(SectionName);
					if (obj is SecurityTokenSection)
					{
						_config = (SecurityTokenSection)obj;
					}
					else
					{
						_config = new SecurityTokenSection();
					}
				}
				return _config;

			}
		}
	}
	public interface ISecurityTokenConfig
	{
	}
	public class SecurityTokenSection : ConfigurationSection, ISecurityTokenConfig
	{
	}
}
