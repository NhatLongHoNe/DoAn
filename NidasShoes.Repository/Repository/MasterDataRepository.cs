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
    public class MasterDataRepository : IMasterDataRepository
    {
        public ICommonRepository _commonRepository;
        public MasterDataRepository(ICommonRepository commonRepository)
        {

            _commonRepository = commonRepository;
        }
        public async Task<NidasShoesResultEntity<bool>> AddOrUpdate(MasterDataEntity masterDataEntity)
        {
            var param = new DynamicParameters();
            param.Add("@Id", masterDataEntity.Id);
            param.Add("@Code", masterDataEntity.Code);
            param.Add("@Name", masterDataEntity.Name);
            param.Add("@Value", masterDataEntity.Value);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_create_masterdata", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_delete_masterdata", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<MasterDataEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<MasterDataEntity>("NidasShoes_get_masterdata_byId", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<MasterDataEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<MasterDataEntity>("NidasShoes_get_masterdata", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }
    }
}
