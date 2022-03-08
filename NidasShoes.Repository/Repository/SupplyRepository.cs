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
    public class SupplyRepository : ISupplyRepository
    {
        public ICommonRepository _commonRepository;
        public SupplyRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        public async Task<NidasShoesResultEntity<bool>> AddOrUpdate(SupplyEntity supplyEntity)
        {
            var param = new DynamicParameters();
            param.Add("@Id", supplyEntity.ID);
            param.Add("@Name", supplyEntity.Name);
            param.Add("@Phone", supplyEntity.Phone);
            param.Add("@Address", supplyEntity.Address);
            param.Add("@Description", supplyEntity.Description);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_create_or_update_Supply", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_delete_Supply", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<SupplyEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<SupplyEntity>("NidasShoes_get_Supply_byId", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<SupplyEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<SupplyEntity>("NidasShoes_get_Supply", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }
    }
}
