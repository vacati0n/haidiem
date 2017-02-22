using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public static class DatetimeExtensions
{
	/// <summary>
	/// Is the passed datetime a work day?
	/// </summary>
	/// <param name="dt">Input datetime</param>
	/// <returns>True if the passed datetime is Satuarday or Sunday otherwise return false</returns>
	public static bool IsWeekend(this DateTime dt)
	{
		return dt.DayOfWeek == DayOfWeek.Saturday || dt.DayOfWeek == DayOfWeek.Sunday;
	}

	/// <summary>
	/// Finds the first day of year of the specified day.
	/// </summary>
	/// <param name="year">Input year</param>
	/// <returns></returns>
	public static DateTime FirstDayOfYear(this int year)
	{
		return new DateTime(year, 1, 1);
	}

	/// <summary>
	/// Finds the first day of year of the specified day.
	/// </summary>
	/// <param name="dt">Input datetime</param>
	/// <returns></returns>
	public static DateTime FirstDayOfYear(this DateTime dt)
	{
		return dt.Year.FirstDayOfYear();
	}

	/// <summary>
	/// Finds the carry day of year of the specified day.
	/// </summary>
	/// <param name="year">Input year</param>
	/// <returns></returns>
	public static DateTime CarryDayOfYear(this int year)
	{
		return new DateTime(year, 3, 31, 23, 59, 0);
	}

	/// <summary>
	/// Finds the carry day of year of the specified day.
	/// </summary>
	/// <param name="dt">Input datetime</param>
	/// <returns></returns>
	public static DateTime CarryDayOfYear(this DateTime dt)
	{
		return dt.Year.CarryDayOfYear();
	}

	public static DateTime EndDate(this DateTime date)
	{
		return date.Date.Add(new TimeSpan(23, 59, 0));
	}
	public static DateTime? EndDate(this DateTime? date)
	{
		if (date.HasValue)
		{
			return date.Value.Date.Add(new TimeSpan(23, 59, 0));
		}
		return null;
	}

	public static DateTime AddVnTimeZone(this DateTime dateTime)
	{
		return dateTime.AddHours(7);
	}

	public static DateTime GetDateVnNow()
	{
		return DateTime.UtcNow.AddHours(7);
	}

}
