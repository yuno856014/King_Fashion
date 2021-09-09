using Dapper;
using Microsoft.Extensions.Configuration;
using ShopThoiTrang.Domain.Request.CatDetails;
using ShopThoiTrang.Domain.Response.CatDetails;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace ShopThoiTrang.Services.CatDetailsService
{
    public class CategoryDetailsService : BaseService,ICategoryDetailsService
    {
        public CategoryDetailsService(IConfiguration configuration) : base(configuration)
        {
        }

        public async Task<CreateCatDetailsResult> Create(CreateCatDetails create)
        {
            try
            {
                var foundCatDetails = await GetCatDetailsByName(create.CatDetailsName);
                if (foundCatDetails == null)
                {
                    DynamicParameters parameters = new DynamicParameters();
                    parameters.Add("@catDetailsName", create.CatDetailsName);
                    parameters.Add("@status", create.Status);
                    parameters.Add("@categoryId", create.CategoryId);
                    var categoryDetails = await SqlMapper.QueryFirstOrDefaultAsync<CategoryDetails>(cnn: connection, sql: "sp_CreateCategoryDetails", param: parameters, commandType: CommandType.StoredProcedure);
                    return new CreateCatDetailsResult()
                    {
                        IsExitst = false,
                        CategoryDetails = categoryDetails
                    };
                }
                return new CreateCatDetailsResult()
                {
                    CategoryDetails = foundCatDetails,
                    IsExitst = true
                };

            }
            catch (Exception ex)
            {
                return new CreateCatDetailsResult()
                {
                    CategoryDetails = new CategoryDetails()
                };
            }
        }

        public async Task<DeletedCatDetailsResult> Deleted(int catDetailsId)
        {
            try
            {
                var foundCatDetails = await GetCatDetailsById(catDetailsId);
                if (foundCatDetails != null)
                {
                    DynamicParameters parameters = new DynamicParameters();
                    parameters.Add("@catDetailsId", catDetailsId);

                    var catDetails = await SqlMapper.QueryFirstOrDefaultAsync<CategoryDetails>(cnn: connection, sql: "sp_DeletedCategoryDetails", param: parameters, commandType: CommandType.StoredProcedure);
                    return new DeletedCatDetailsResult()
                    {
                        Success = true,
                        NotFound = false
                    };
                }
                return new DeletedCatDetailsResult()
                {
                    Success = false,
                    NotFound = true
                };

            }
            catch (Exception ex)
            {
                return new DeletedCatDetailsResult()
                {
                    Success = false,
                    NotFound = false
                };
            }
        }

        public async Task<IEnumerable<CategoryDetails>> Get()
        {
            var categoryDetails = await SqlMapper.QueryAsync<CategoryDetails>(cnn: connection, sql: "sp_GetCategoryDetails", commandType: CommandType.StoredProcedure);
            return categoryDetails;
        }

        public async Task<CategoryDetails> GetCatDetailsById(int catDetailsId)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@cateDetailsId", catDetailsId);
            var categoryDetails = await SqlMapper.QueryFirstOrDefaultAsync<CategoryDetails>(cnn: connection, sql: "sp_GetCategoryDetailsById", param: parameters, commandType: CommandType.StoredProcedure);
            return categoryDetails;
        }

        public async Task<CategoryDetails> GetCatDetailsByName(string catDetailsName, int catDetailsId = 0)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@catDetailsName", catDetailsName);
            parameters.Add("@catDetailsId", catDetailsId);
            var categoryDetails = await SqlMapper.QueryFirstOrDefaultAsync<CategoryDetails>(cnn: connection, sql: "sp_GetCategoryDetailsByName", param: parameters, commandType: CommandType.StoredProcedure);
            return categoryDetails;
        }

        public async Task<RestroreCatDetailsResult> Restore(int catDetailsId)
        {
            try
            {
                var foundCatDetails = await GetCatDetailsById(catDetailsId);
                if (foundCatDetails != null)
                {
                    DynamicParameters parameters = new DynamicParameters();
                    parameters.Add("@catDetailsId", catDetailsId);

                    var categoryDetails = await SqlMapper.QueryFirstOrDefaultAsync<CategoryDetails>(cnn: connection, sql: "sp_RestoreCategoryDetails", param: parameters, commandType: CommandType.StoredProcedure);
                    return new RestroreCatDetailsResult()
                    {
                        Success = true,
                        NotFound = false
                    };
                }
                return new RestroreCatDetailsResult()
                {
                    Success = false,
                    NotFound = true
                };
            }
            catch (Exception ex)
            {
                return new RestroreCatDetailsResult()
                {
                    Success = false,
                    NotFound = false
                };
            }
        }

        public async Task<UpdateCatDetailsResult> Update(UpdateCatDetails update)
        {
            try
            {
                var foundCatDetails = await GetCatDetailsByName(update.CatDetailsName, update.CatDetailsId);
                if (foundCatDetails == null)
                {
                    DynamicParameters parameters = new DynamicParameters();
                    parameters.Add("@catDetailsId", update.CatDetailsId);
                    parameters.Add("@catDetailsName", update.CatDetailsName);
                    parameters.Add("@status", update.Status);
                    var categoryDetails = await SqlMapper.QueryFirstOrDefaultAsync<CategoryDetails>(cnn: connection, sql: "sp_UpdateCategoryDetails", param: parameters, commandType: CommandType.StoredProcedure);
                    return new UpdateCatDetailsResult()
                    {
                        IsExitst = false,
                        CategoryDetails = categoryDetails
                    };
                }
                else
                {
                    return new UpdateCatDetailsResult()
                    {
                        CategoryDetails = foundCatDetails,
                        IsExitst = true
                    };
                }
            }
            catch (Exception ex)
            {
                return new UpdateCatDetailsResult();
            };
        }
    }
}
