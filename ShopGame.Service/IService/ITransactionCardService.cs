using ShopGame.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Service.IService
{
    public interface ITransactionCardService
    {
        Task<string> Charge(ChagringModel chagringModel);
        Task<string> Callback(TheSieuReReturnModel theSieuReReturn);
    }
}
