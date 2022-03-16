using NidasShoes.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Repository.IRepository
{
    public interface IProductSizeRepository
    {
        Task<NidasShoesResultEntity<SizeEntity>> GetListData(BaseParamEntity baseParam);
        Task<NidasShoesResultEntity<Boolean>> AddOrUpdate(SizeEntity supplyEntity);
        Task<NidasShoesResultEntity<SizeEntity>> GetById(int Id);
        Task<NidasShoesResultEntity<Boolean>> DeleteById(int Id);
    }
}
