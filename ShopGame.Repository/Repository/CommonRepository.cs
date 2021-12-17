using Dapper;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using ShopGame.Repository.Entity;
using ShopGame.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.Repository
{
    public class CommonRepository : ICommonRepository
    {
        private IConfiguration _configuration;
        private IDbConnection _db;
        private string _connectionString = "";

        public CommonRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public ShopGameResultEntity<T> ListProcedure<T>(string procedure, object oParams = null)
        {
            try
            {
                var message = string.Empty;
                var cacheParam = string.Empty;
                if (oParams != null)
                {
                    var listParam = JsonConvert.DeserializeObject<dynamic>(JsonConvert.SerializeObject(oParams)).ListParameters;
                    if (listParam != null)
                    {
                        message = JsonConvert.SerializeObject(listParam);
                        cacheParam = message;
                    }
                    else
                    {
                        message = JsonConvert.SerializeObject(JsonConvert.DeserializeObject<dynamic>(JsonConvert.SerializeObject(oParams)));
                    }
                }

                //SqlConnection
                //MySqlConnection
                if (oParams == null) oParams = new DynamicParameters();
                _connectionString = _configuration.GetConnectionString("Key");
                _db = new SqlConnection(_connectionString);
                using (_db)
                {
                    if (_db.State == ConnectionState.Closed)
                    {
                        _db.ConnectionString = _connectionString;
                        _db.Open();
                    }
                    IEnumerable<T> result = null;

                    result = _db.Query<T>(procedure, oParams, commandTimeout: 600000, commandType: System.Data.CommandType.StoredProcedure);
                    return new ShopGameResultEntity<T>
                    {
                        StatusCode = 200,
                        Success = true,
                        Results = result.ToList()
                    };
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<ShopGameResultEntity<T>> ListProcedureAsync<T>(string procedure, object oParams = null)
        {
            try
            {
                var message = string.Empty;
                var cacheParam = string.Empty;
                if (oParams != null)
                {
                    var listParam = JsonConvert.DeserializeObject<dynamic>(JsonConvert.SerializeObject(oParams)).ListParameters;
                    if (listParam != null)
                    {
                        message = JsonConvert.SerializeObject(listParam);
                        cacheParam = message;
                    }
                    else
                    {
                        message = JsonConvert.SerializeObject(JsonConvert.DeserializeObject<dynamic>(JsonConvert.SerializeObject(oParams)));
                    }
                }

                //SqlConnection
                //MySqlConnection
                if (oParams == null) oParams = new DynamicParameters();
                _connectionString = _configuration.GetConnectionString("Key");
                _db = new SqlConnection(_connectionString);
                using (_db)
                {
                    if (_db.State == ConnectionState.Closed)
                    {
                        _db.ConnectionString = _connectionString;
                        _db.Open();
                    }
                    IEnumerable<T> result = null;

                    result = await _db.QueryAsync<T>(procedure, oParams, commandTimeout: 600000, commandType: System.Data.CommandType.StoredProcedure);
                    return new ShopGameResultEntity<T>
                    {
                        StatusCode = 200,
                        Success = true,
                        Results = result.ToList()
                    };
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
