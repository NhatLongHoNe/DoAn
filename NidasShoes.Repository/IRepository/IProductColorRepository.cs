using NidasShoes.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Repository.IRepository
{
    public interface IProductColorRepository
    {
        Task<NidasShoesResultEntity<ColorEntity>> GetListData(BaseParamEntity baseParam);
        Task<NidasShoesResultEntity<Boolean>> AddOrUpdate(ColorEntity supplyEntity);
        Task<NidasShoesResultEntity<ColorEntity>> GetById(int Id);
        Task<NidasShoesResultEntity<Boolean>> DeleteById(int Id);
    }
}
