using ShopGame.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.IRepository
{
    public interface ICommonRepository
    {
        ShopGameResultEntity<T> ListProcedure<T>(string procedure, object oParams = null);

        /// <summary>
        /// Hàm gọi Stored bất đồng bộ
        /// </summary>
        /// <typeparam name="T">Kiểu dữ liệu muốn lấy</typeparam>
        /// <param name="procedure">Tên stored</param>
        /// <param name="oParams">Obj params</param>
        /// <returns></returns>
        Task<ShopGameResultEntity<T>> ListProcedureAsync<T>(string procedure, object oParams = null);
    }
}
