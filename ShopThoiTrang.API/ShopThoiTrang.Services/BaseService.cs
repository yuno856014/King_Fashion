using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace ShopThoiTrang.Services
{
    public class BaseService
    {
        private readonly IConfiguration configuration;
        protected IDbConnection connection;
        public BaseService(IConfiguration configuration)
        {
            this.configuration = configuration;
            connection = new SqlConnection(this.configuration.GetConnectionString("ShopThoiTrangConnection"));
        }    
    }
}
