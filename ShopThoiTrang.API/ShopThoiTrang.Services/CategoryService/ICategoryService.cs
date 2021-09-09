using ShopThoiTrang.Domain.Request.Categories;
using ShopThoiTrang.Domain.Response.Categories;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopThoiTrang.Services.CategoryService
{
    public interface ICategoryService
    {
        Task<IEnumerable<Category>> Get();
        Task<Category> CategoryById(int categoryId);
        Task<Category> GetCategoryByName(string categoryName,int categoryId);
        Task<UpdateCategoryResult> Update(UpdateCategory update);
    }
}
