using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.Text;

namespace ShopGame.Repository.Common
{
    /// <summary>
    /// Lớp xử lý dữ liệu kiểu DataTable
    /// </summary>
    public static class DataTableHelper
    {
        /// <summary>
        /// Kiểm tra type của object có phải là List không
        /// </summary>
        /// <param name="o">Object đầu vào</param>
        public static bool IsGenericList(this object o)
        {
            var oType = o.GetType();
            return (oType.IsGenericType && (oType.GetGenericTypeDefinition() == typeof(List<>)));
        }

        /// <summary>
        /// Chuyển đổi List<T> sang DataTable
        /// </summary>
        /// <typeparam name="T">Class</typeparam>
        /// <param name="values">Dữ liệu List<T> đầu vào</param>
        /// <returns>DataTable</returns>
        public static DataTable ConvertListToDataTable<T>(this IEnumerable<T> values) where T : class
        {
            var table = new DataTable();
            var properties = typeof(T).GetProperties();
            foreach (var prop in properties)
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);

            if (values != null)
            {
                foreach (var value in values)
                {
                    if (value != null)
                    {
                        var newRow = table.NewRow();
                        foreach (var prop in properties)
                        {
                            if (table.Columns.Contains(prop.Name))
                                newRow[prop.Name] = prop.GetValue(value, null) ?? DBNull.Value;
                        }
                        table.Rows.Add(newRow);
                    }
                }
            }
            return table;
        }

        /// <summary>
        /// Chuyển đổi T sang DataTable
        /// </summary>
        /// <typeparam name="T">Class</typeparam>
        /// <param name="val">Dữ liệu T đầu vào</param>
        /// <returns>DataTable</returns>
        public static DataTable ConvertObjectToDataTable<T>(this T val) where T : class
        {
            var table = new DataTable();
            var values = new List<T>();
            values.Add(val);
            var properties = typeof(T).GetProperties();
            foreach (var prop in properties)
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);

            if (values != null)
            {
                foreach (var value in values)
                {
                    if (value != null)
                    {
                        var newRow = table.NewRow();
                        foreach (var prop in properties)
                        {
                            if (table.Columns.Contains(prop.Name))
                                newRow[prop.Name] = prop.GetValue(value, null) ?? DBNull.Value;
                        }
                        table.Rows.Add(newRow);
                    }
                }
            }
            return table;
        }
    }
}
