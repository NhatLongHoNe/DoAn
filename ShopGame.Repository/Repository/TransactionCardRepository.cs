using Dapper;
using ShopGame.Repository.Entity;
using ShopGame.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.Repository
{
    public class TransactionCardRepository : ITransactionCardRepository
    {
        public ICommonRepository _commonRepository;
        public TransactionCardRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }

        public async Task<ShopGameResultEntity<int>> CallBack(TheSieuReReturnEntity theSieuReReturn)
        {
            var param = new DynamicParameters();
            param.Add("@requestId", theSieuReReturn.request_id);
            param.Add("@status", theSieuReReturn.status);
            param.Add("@amount", theSieuReReturn.value??theSieuReReturn.declared_value);
            var result = await _commonRepository.ListProcedureAsync<int>("callback_transaction", param);
            return result;
        }

        public async Task<ShopGameResultEntity<TheSieuReSubmitEntity>> Charge(ChagringEntity chagringEntity)
        {
            var param = new DynamicParameters();
            param.Add("@Id", chagringEntity.Id);
            param.Add("@NCCId", chagringEntity.NCCId);
            param.Add("@ValueId", chagringEntity.ValueId);
            param.Add("@Code", chagringEntity.Code);
            param.Add("@Seri", chagringEntity.Seri);
            param.Add("@UserId", chagringEntity.UserId);
            var result = await _commonRepository.ListProcedureAsync<TheSieuReSubmitEntity>("shopgame_charge", param);
            return result;
        }
    }
}
