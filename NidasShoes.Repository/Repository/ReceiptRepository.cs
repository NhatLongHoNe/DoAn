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
    public class ReceiptRepository : IReceiptRepository
    {
        public ICommonRepository _commonRepository;
        public ReceiptRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        public async Task<NidasShoesResultEntity<bool>> AddOrUpdate(ReceiptEntity receiptEntity)
        {
            var param = new DynamicParameters();
            param.Add("@Id", receiptEntity.ID);
            param.Add("@UserID", receiptEntity.UserID);
            param.Add("@Note", receiptEntity.Note);
            param.Add("@SupplyID", receiptEntity.SupplyID);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_create_or_update_Receipt", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_delete_Receipt", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<ReceiptEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<ReceiptEntity>("NidasShoes_get_Receipt_byId", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<ReceiptEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<ReceiptEntity>("NidasShoes_get_Receipt", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }


        public async Task<NidasShoesResultEntity<bool>> AddOrUpdateReceiptDetail(ReceiptDetailEntity receiptDetailEntity)
        {
            var param = new DynamicParameters();
            param.Add("@Id", receiptDetailEntity.ID);
            param.Add("@ProductDetailID", receiptDetailEntity.ProductDetailID);
            param.Add("@ImportQuantity", receiptDetailEntity.ImportQuantity);
            param.Add("@ImportPrice", receiptDetailEntity.ImportPrice);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_create_or_update_ReceiptDetail", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<bool>> DeleteByReceiptDetailId(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_delete_ReceiptDetail", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<ReceiptDetailEntity>> GetReceiptDetailById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<ReceiptDetailEntity>("NidasShoes_get_ReceiptDetail_byId", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<ReceiptDetailEntity>> GetListDataReceiptDetail(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<ReceiptDetailEntity>("NidasShoes_get_ReceiptDetail", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }

        public async Task<NidasShoesResultEntity<ReceiptDetailEntity>> GetListDataReceiptDetailByReceiptId(int receiptId)
        {
            var param = new DynamicParameters();
            param.Add("@Id", receiptId);
            var result = await _commonRepository.ListProcedureAsync<ReceiptDetailEntity>("NidasShoes_get_ReceiptDetail_by_ReceiptId", param);
            return result;
        }
    }
}
