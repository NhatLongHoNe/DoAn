using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Service.IService
{
    public interface IReceiptService
    {
        Task<string> GetListData(BaseParamModel baseParam);
        Task<string> AddOrUpdate(ReceiptModel receiptModel);
        Task<string> GetById(int Id);
        Task<string> DeleteById(int Id);

        Task<string> GetListDataReceiptDetail(BaseParamModel baseParam);
        Task<string> AddOrUpdateReceiptDetail(ReceiptDetailModel receiptModel);
        Task<string> GetByReceiptDetailId(int Id);
        Task<string> DeleteByReceiptDetailId(int Id);
        Task<string> GetListDataReceiptDetailByReceiptId(int ReceiptId);
    }
}
