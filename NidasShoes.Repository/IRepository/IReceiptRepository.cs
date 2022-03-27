using NidasShoes.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Repository.IRepository
{
    public interface IReceiptRepository
    {
        Task<NidasShoesResultEntity<ReceiptEntity>> GetListData(BaseParamEntity baseParam);
        Task<NidasShoesResultEntity<bool>> AddOrUpdate(ReceiptEntity receiptEntity);
        Task<NidasShoesResultEntity<ReceiptEntity>> GetById(int Id);
        Task<NidasShoesResultEntity<Boolean>> DeleteById(int Id);

        Task<NidasShoesResultEntity<ReceiptDetailEntity>> GetListDataReceiptDetail(BaseParamEntity baseParam);
        Task<NidasShoesResultEntity<bool>> AddOrUpdateReceiptDetail(ReceiptDetailEntity receiptEntity);
        Task<NidasShoesResultEntity<ReceiptDetailEntity>> GetReceiptDetailById(int Id);
        Task<NidasShoesResultEntity<Boolean>> DeleteByReceiptDetailId(int Id);

    }
}
