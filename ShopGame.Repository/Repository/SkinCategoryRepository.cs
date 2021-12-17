using Dapper;
using ShopGame.Repository.Common;
using ShopGame.Repository.Entity;
using ShopGame.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.Repository
{
    public class SkinCategoryRepository : ISkinCategoryRepository
    {
        public ICommonRepository _commonRepository;
        public SkinCategoryRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        public async Task<ShopGameResultEntity<bool>> AddOrUpdate(SkinCategoryEntity skinCategory)
        {
            var param = new DynamicParameters();
            param.Add("@Id", skinCategory.Id);
            param.Add("@Name", skinCategory.Name);
            param.Add("@Description", skinCategory.Description);
            param.Add("@Image", skinCategory.Image);
            var result = await _commonRepository.ListProcedureAsync<bool>("shopgame_create_skincategory", param);
            return result;
        }

        public async Task<ShopGameResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("shopgame_delete_skincategory", param);
            return result;
        }

        public async Task<ShopGameResultEntity<SkinCategoryEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<SkinCategoryEntity>("shopgame_get_skincategory_byId", param);
            return result;
        }

        public async Task<ShopGameResultEntity<SkinCategoryEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<SkinCategoryEntity>("shopgame_get_skincategory", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }
    }
}
