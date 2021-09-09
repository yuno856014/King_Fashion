using System;
using System.Collections.Generic;
using System.Text;

namespace ShopThoiTrang.Domain.Response.Categories
{
    public class UpdateCategoryResult
    {
        public Category Category { get; set; }
        public bool IsExist { get; set; }
        public bool Success => Category != null && Category.CategoryId > 0 && !IsExist;
        public string Message => Success ? Common.Message.Category.Update :
                                (IsExist ? Common.Message.Category.Exits : Common.Message.Fail);
    }

}
