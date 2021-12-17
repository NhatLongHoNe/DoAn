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
    public class CardAdminRepository : ICardAdminRepository
    {
        public ICommonRepository _commonRepository;
        public CardAdminRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        public async Task<ShopGameResultEntity<bool>> AddOrUpdate(CardAdminEntity cardAdmin)
        {
            var param = new DynamicParameters();
            param.Add("@Id", cardAdmin.Id);
            param.Add("@CardNumber", cardAdmin.CardNumber);
            param.Add("@CardType", cardAdmin.CardType);
            param.Add("@CardHolder", cardAdmin.CardHolder);
            param.Add("@CardBranch", cardAdmin.CardBranch);
            param.Add("@BankName", cardAdmin.BankName);
            var result = await _commonRepository.ListProcedureAsync<bool>("shopgame_create_cardadmin", param);
            return result;
        }

        public async Task<ShopGameResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("shopgame_delete_cardadmin", param);
            return result;
        }

        public async Task<ShopGameResultEntity<CardAdminEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<CardAdminEntity>("shopgame_get_cardadmin_byId", param);
            return result;
        }

        public async Task<ShopGameResultEntity<CardAdminEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<CardAdminEntity>("shopgame_get_cardadmin", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }
    }
}
