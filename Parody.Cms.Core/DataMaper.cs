using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using umbraco.DataLayer;

namespace Parody.Cms.Core
{
	/// <summary>
	/// Map data from a source into a target object
	/// by copying public property values.
	/// </summary>
	/// <remarks></remarks>
	public static class DataMapper
	{
		/// <summary>
		/// Map data reader to objectMap
		/// </summary>
		/// <typeparam name="T"></typeparam>
		/// <param name="reader"></param>
		/// <param name="objectMap"></param>
		public static void Mapper<T>(IRecordsReader reader, T objectMap)
		{
			var type = typeof(T);
			var propreties = type.GetProperties();
			foreach (var proprety in propreties)
			{

				if (proprety.CanWrite && reader.ContainsField(proprety.Name))
				{
					DataMapper.SetPropertyValue(objectMap, proprety, reader.GetObject(proprety.Name));
				}
			}
		}
		/// <summary>
		/// Sets an object's property with the specified value,
		/// coercing that value to the appropriate type if possible.
		/// </summary>
		/// <param name="target">Object containing the property to set.</param>
		/// <param name="propertyInfo">The property to set.</param>
		/// <param name="value">Value to set into the property.</param>
		public static void SetPropertyValue(
			object target, PropertyInfo propertyInfo, object value)
		{
			if (propertyInfo.CanWrite == false)
				return;
			if (value == null)
				propertyInfo.SetValue(target, value, null);
			else
			{
				Type pType =
					GetPropertyType(propertyInfo.PropertyType);
				Type vType =
					GetPropertyType(value.GetType());
				if (pType.Equals(vType))
				{
					// types match, just copy value
					propertyInfo.SetValue(target, value, null);
				}
				else
				{
					// types don't match, try to convert
					if (pType.Equals(typeof(Guid)))
						propertyInfo.SetValue(
							target, new Guid(value.ToString()), null);
					else if (pType.IsEnum)
					{
						propertyInfo.SetValue(target, Enum.Parse(pType, value.ToString()), null);
					}
					else if (pType.Equals(typeof(string)))
						propertyInfo.SetValue(target, Convert.ToString(value), null);
					else
						propertyInfo.SetValue(
							target, Convert.ChangeType(value, pType), null);
				}
			}
		}

		/// <summary>
		/// Returns a property's type, dealing with
		/// Nullable(Of T) if necessary.
		/// </summary>
		/// <param name="propertyType">Type of the
		/// property as returned by reflection.</param>
		private static Type GetPropertyType(Type propertyType)
		{
			Type type = propertyType;
			if (type.IsGenericType &&
				(type.GetGenericTypeDefinition() == typeof(Nullable<>)))
				return Nullable.GetUnderlyingType(type);
			return type;
		}


	}
}
