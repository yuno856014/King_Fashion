using Dapper;
using Microsoft.Extensions.Configuration;
using ShopThoiTrang.Domain.Request.Categories;
using ShopThoiTrang.Domain.Response.Categories;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace ShopThoiTrang.Services.CategoryService
{
    public class CategoryService : BaseService, ICategoryService
    {
        public CategoryService(IConfiguration configuration) : base(configuration)
        {

        }
        public async Task<Category> CategoryById(int categoryId)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@categoryId", categoryId);
            var category = await SqlMapper.QueryFirstOrDefaultAsync<Category>(
                                cnn: connection,
                                sql: "sp_GetCategoryById",
                                param: parameters,
                                commandType: CommandType.StoredProcedure);
            return category;
        }

        public async Task<IEnumerable<Category>> Get()
        {
            var categories = await SqlMapper.QueryAsync<Category>(
                                 cnn: connection,
                                 sql: "sp_GetCategory",
                                 commandType: CommandType.StoredProcedure);
            return categories;
        }

        public async Task<Category> GetCategoryByName(string categoryName, int categoryId = 0)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@categoryName", categoryName);
            parameters.Add("@categoryId", categoryId);
            var category = await SqlMapper.QueryFirstOrDefaultAsync<Category>(
                                cnn: connection,
                                sql: "sp_GetCategoryByName",
                                param: parameters,
                                commandType: CommandType.StoredProcedure);
            return category;
        }

        public async Task<UpdateCategoryResult> Update(UpdateCategory update)
        {
            try
            {
                var foundCategory = await GetCategoryByName(update.CategoryName, update.CategoryId);

                if (foundCategory == null)
                {
                    DynamicParameters parameters = new DynamicParameters();
                    parameters.Add("@categoryId", update.CategoryId);
                    parameters.Add("@categoryName", update.CategoryName);

                    var category = await SqlMapper.QueryFirstOrDefaultAsync<Category>(
                                            cnn: connection,
                                            sql: "sp_UpdateCategory",
                                            param: parameters,
                                            commandType: CommandType.StoredProcedure
                                        );
                    return new UpdateCategoryResult()
                    {
                        IsExist = false,
                        Category = category
                    };
                }
                return new UpdateCategoryResult()
                {
                    Category = foundCategory,
                    IsExist = true
                };
            }
            catch (Exception ex)
            {
                return new UpdateCategoryResult()
                {
                    Category = new Category()
                };
            }
        }
    }
}
