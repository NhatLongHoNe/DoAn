using ShopGame.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Service.IService
{
    public interface ISkinService
    {
        Task<string> GetListData(BaseParamModel baseParam);
        Task<string> AddOrUpdate(SkinModel skinCategory);
        Task<string> GetById(int Id);
        Task<string> DeleteById(int Id);

        Task<string> GetListDataSkinBySkinCategoryId(int skinCategoryId, BaseParamModel baseParam);


    }
}
