using Newtonsoft.Json;
using ShopGame.Repository.Entity;
using ShopGame.Repository.IRepository;
using ShopGame.Service.IService;
using ShopGame.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Service.Service
{
    public class SkinService : ISkinService
    {
        ISkinRepository _skinCategoryRepository;
        public SkinService(ISkinRepository skinCategoryRepository)
        {
            _skinCategoryRepository = skinCategoryRepository;
        }
        public async Task<string> AddOrUpdate(SkinModel skinCategory)
        {
            var blogTypeEntity = JsonConvert.DeserializeObject<SkinEntity>(JsonConvert.SerializeObject(skinCategory));
            var res = await _skinCategoryRepository.AddOrUpdate(blogTypeEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _skinCategoryRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _skinCategoryRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseParamEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _skinCategoryRepository.GetListData(baseParamEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListDataSkinBySkinCategoryId(int skinCategoryId, BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var response = await _skinCategoryRepository.GetListDataSkinBySkinCategoryId(skinCategoryId, baseEntity);
            return JsonConvert.SerializeObject(response);
        }
    }
}
