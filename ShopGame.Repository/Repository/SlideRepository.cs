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
    public class SlideRepository : ISlideRepository
    {
        public ICommonRepository _commonRepository;
        public SlideRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        public async Task<ShopGameResultEntity<bool>> AddOrUpdate(SlideEntity slideEntity)
        {
            var param = new DynamicParameters();
            param.Add("@Id", slideEntity.Id);
            param.Add("@Image", slideEntity.Image);
            param.Add("@Link", slideEntity.Link);
            param.Add("@Description", slideEntity.Description);
            param.Add("@DisplayOrder", slideEntity.DisplayOrder);
            param.Add("@Status", slideEntity.Status);
            var result = await _commonRepository.ListProcedureAsync<bool>("shopgame_create_slide", param);
            return result;
        }

        public async Task<ShopGameResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("shopgame_delete_slide", param);
            return result;
        }

        public async Task<ShopGameResultEntity<SlideEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<SlideEntity>("shopgame_get_slide_byId", param);
            return result;
        }

        public async Task<ShopGameResultEntity<SlideEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<SlideEntity>("shopgame_get_slide", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }
    }
}
