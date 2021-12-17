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
    public class BlogTypeService : IBlogTypeService
    {
        IBlogTypeRepository _blogTypeRepository;
        public BlogTypeService(IBlogTypeRepository blogTypeRepository)
        {
            _blogTypeRepository = blogTypeRepository;
        }
        public async Task<string> AddOrUpdate(BlogTypeModel blogType)
        {
            var blogTypeEntity = JsonConvert.DeserializeObject<BlogTypeEntity>(JsonConvert.SerializeObject(blogType));
            var res = await _blogTypeRepository.AddOrUpdate(blogTypeEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> AddOrUpdateBlog(BlogModel product)
        {
            var blogEntity = JsonConvert.DeserializeObject<BlogEntity>(JsonConvert.SerializeObject(product));
            var res = await _blogTypeRepository.AddOrUpdateBlog(blogEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteBlogById(int Id)
        {
            var res = await _blogTypeRepository.DeleteBlogById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _blogTypeRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetBlogById(int Id)
        {
            var res = await _blogTypeRepository.GetBlogById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _blogTypeRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _blogTypeRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListDataBlog(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _blogTypeRepository.GetListDataBlog(baseEntity);
            return JsonConvert.SerializeObject(res);
        }
    }
}
