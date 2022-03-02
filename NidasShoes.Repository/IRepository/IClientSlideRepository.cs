using NidasShoes.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Repository.IRepository
{
    public interface IClientSlideRepository
    {
        Task<NidasShoesResultEntity<SlideEntity>> GetListDataSlide(BaseParamEntity baseParam);
    }
}
