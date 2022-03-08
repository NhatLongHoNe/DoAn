using Dapper;
using NidasShoes.Repository.Common;
using NidasShoes.Repository.Entity;
using NidasShoes.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Repository.Repository
{
    public class ShopRepository : IShopRepository
    {
        public ICommonRepository _commonRepository;
        public ShopRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        public async Task<NidasShoesResultEntity<bool>> AddOrUpdate(ShopEntity shopEntity)
        {
            var param = new DynamicParameters();
            param.Add("@Id", shopEntity.ID);
            param.Add("@Name", shopEntity.Name);
            param.Add("@Logo", shopEntity.Logo);
            param.Add("@Slogan", shopEntity.Slogan);
            param.Add("@Address", shopEntity.Address);
            param.Add("@PhoneNumber", shopEntity.PhoneNumber);
            param.Add("@Email)", shopEntity.Email);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_create_or_update_Shop", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_delete_Shop", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<ShopEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<ShopEntity>("NidasShoes_get_Shop_byId", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<ShopEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<ShopEntity>("NidasShoes_get_Shop", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }
    }
}
