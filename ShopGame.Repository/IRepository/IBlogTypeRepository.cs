using ShopGame.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.IRepository
{
    public interface IBlogTypeRepository
    {
        Task<ShopGameResultEntity<BlogTypeEntity>> GetListData(BaseParamEntity baseParam);
        Task<ShopGameResultEntity<Boolean>> AddOrUpdate(BlogTypeEntity blogType);
        Task<ShopGameResultEntity<BlogTypeEntity>> GetById(int Id);
        Task<ShopGameResultEntity<Boolean>> DeleteById(int Id);



        Task<ShopGameResultEntity<BlogEntity>> GetListDataBlog(BaseParamEntity baseParam);
        Task<ShopGameResultEntity<Boolean>> AddOrUpdateBlog(BlogEntity product);
        Task<ShopGameResultEntity<BlogEntity>> GetBlogById(int Id);
        Task<ShopGameResultEntity<Boolean>> DeleteBlogById(int Id);
    }
}
