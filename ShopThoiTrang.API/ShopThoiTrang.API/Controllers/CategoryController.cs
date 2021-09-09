using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ShopThoiTrang.Domain.Request.Categories;
using ShopThoiTrang.Domain.Response.Categories;
using ShopThoiTrang.Services.CategoryService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShopThoiTrang.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly ICategoryService categoryService;
        public CategoryController(ICategoryService categoryService)
        {
            this.categoryService = categoryService;
        }
        [HttpGet]
        public async Task<IEnumerable<Category>> Get()
        {
            return await categoryService.Get();
        }
        [HttpGet]
        [Route("{id:int}")]
        public async Task<Category> CategoryById(int id)
        {
            return await categoryService.CategoryById(id);
        }
        [HttpPut]
        public async Task<UpdateCategoryResult> Update(UpdateCategory model)
        {
            return await categoryService.Update(model);
        }
    }
}
