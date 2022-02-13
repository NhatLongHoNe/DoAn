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
    public class UserService : IUserService
    {
        IUserRepository _userRepository;
        public UserService(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task<string> Login(UserModel user)
        {
            var userEntity = JsonConvert.DeserializeObject<UserEntity>(JsonConvert.SerializeObject(user));
            var res = await _userRepository.Login(userEntity);
            return JsonConvert.SerializeObject(res);
        }
        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseParamEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _userRepository.GetListData(baseParamEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> AddOrUpdate(UserModel user)
        {
            var userEntity = JsonConvert.DeserializeObject<UserEntity>(JsonConvert.SerializeObject(user));
            var res = await _userRepository.AddOrUpdate(userEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _userRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _userRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> ForgotPassword(string Email, string Hashed)
        {
            var res = await _userRepository.ForgotPass(Email,Hashed);
            return JsonConvert.SerializeObject(res);
        }
    }
}
