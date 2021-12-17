using ShopGame.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.IRepository
{
    public interface ITransactionCardRepository
    {
        Task<ShopGameResultEntity<TheSieuReSubmitEntity>> Charge(ChagringEntity chagringEntity);
        Task<ShopGameResultEntity<int>> CallBack(TheSieuReReturnEntity theSieuReReturn);

    }
}
