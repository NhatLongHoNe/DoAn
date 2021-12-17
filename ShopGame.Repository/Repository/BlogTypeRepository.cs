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
    public class BlogTypeRepository : IBlogTypeRepository
    {
        public ICommonRepository _commonRepository;
        public BlogTypeRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        public async Task<ShopGameResultEntity<bool>> AddOrUpdate(BlogTypeEntity blogType)
        {
            var param = new DynamicParameters();
            param.Add("@Id", blogType.Id);
            param.Add("@Name", blogType.Name);
            var result = await _commonRepository.ListProcedureAsync<bool>("shopgame_create_blogtype", param);
            return result;
        }

        public async Task<ShopGameResultEntity<bool>> AddOrUpdateBlog(BlogEntity product)
        {
            var param = new DynamicParameters();
            param.Add("@Id", product.Id);
            param.Add("@Name", product.Name);
            param.Add("@Image", product.Image);
            param.Add("@MetaTitle", product.MetaTitle);
            param.Add("@Description", product.Description);
            param.Add("@BlogTypeId", product.BlogTypeId);
            var result = await _commonRepository.ListProcedureAsync<bool>("shopgame_create_blog", param);
            return result;
        }

        public async Task<ShopGameResultEntity<bool>> DeleteBlogById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("shopgame_delete_blog", param);
            return result;
        }

        public async Task<ShopGameResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("shopgame_delete_blogtype", param);
            return result;
        }

        public async Task<ShopGameResultEntity<BlogEntity>> GetBlogById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<BlogEntity>("shopgame_get_blog_byId", param);
            return result;
        }

        public async Task<ShopGameResultEntity<BlogTypeEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<BlogTypeEntity>("shopgame_get_blogType_byId", param);
            return result;
        }

        public async Task<ShopGameResultEntity<BlogTypeEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<BlogTypeEntity>("shopgame_get_blogtype", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }

        public async Task<ShopGameResultEntity<BlogEntity>> GetListDataBlog(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<BlogEntity>("shopgame_get_blog", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }
    }
}
