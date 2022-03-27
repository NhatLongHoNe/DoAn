using Newtonsoft.Json;
using NidasShoes.Repository.Entity;
using NidasShoes.Repository.IRepository;
using NidasShoes.Service.IService;
using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Service.Service
{
    public class ReceiptService : IReceiptService
    {
        IReceiptRepository _receiptRepository;
        public ReceiptService(IReceiptRepository receiptRepository)
        {
            _receiptRepository = receiptRepository;
        }
        public async Task<string> AddOrUpdate(ReceiptModel receiptModel)
        {
            var receiptEntity = JsonConvert.DeserializeObject<ReceiptEntity>(JsonConvert.SerializeObject(receiptModel));
            var res = await _receiptRepository.AddOrUpdate(receiptEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _receiptRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _receiptRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _receiptRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> AddOrUpdateReceiptDetail(ReceiptDetailModel receiptModel)
        {
            var receiptEntity = JsonConvert.DeserializeObject<ReceiptDetailEntity>(JsonConvert.SerializeObject(receiptModel));
            var res = await _receiptRepository.AddOrUpdateReceiptDetail(receiptEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteByReceiptDetailId(int Id)
        {
            var res = await _receiptRepository.DeleteByReceiptDetailId(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetByReceiptDetailId(int Id)
        {
            var res = await _receiptRepository.GetReceiptDetailById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListDataReceiptDetail(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _receiptRepository.GetListDataReceiptDetail(baseEntity);
            return JsonConvert.SerializeObject(res);
        }
    }
}
