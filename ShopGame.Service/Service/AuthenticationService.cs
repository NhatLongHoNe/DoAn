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
    public class AuthenticationService : IAuthenticationService
    {
        IAuthenticationRepository _authenticationRepository;
        public AuthenticationService(IAuthenticationRepository authenticationRepository)
        {
            _authenticationRepository = authenticationRepository;
        }

        public async Task<string> Login(AccountModel account)
        {
            var accountEntity = JsonConvert.DeserializeObject<AccountEntity>(JsonConvert.SerializeObject(account));
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
            var accountEntity = JsonConvert.DeserializeObject<AccountEntity>(JsonConvert.SerializeObject(account));
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
