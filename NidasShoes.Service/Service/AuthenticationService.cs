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
    public class AuthenticationService : IAuthenticationService
    {
        IAuthenticationRepository _authenticationRepository;
        public AuthenticationService(IAuthenticationRepository authenticationRepository)
        {
            _authenticationRepository = authenticationRepository;
        }

        public async Task<string> Login(AccountModel account)
        {
            var accountEntity = JsonConvert.DeserializeObject<UserEntity>(JsonConvert.SerializeObject(account));
            var res = await _authenticationRepository.Login(accountEntity);
            return JsonConvert.SerializeObject(res);
        }
        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseParamEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _authenticationRepository.GetListData(baseParamEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> AddOrUpdate(AccountModel account)
        {
            var accountEntity = JsonConvert.DeserializeObject<UserEntity>(JsonConvert.SerializeObject(account));
            var res = await _authenticationRepository.AddOrUpdate(accountEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _authenticationRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _authenticationRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }
    }
}
