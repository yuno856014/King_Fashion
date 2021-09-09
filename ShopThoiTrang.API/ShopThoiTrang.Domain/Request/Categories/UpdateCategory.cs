using System;
using System.Collections.Generic;
using System.Text;

namespace ShopThoiTrang.Domain.Request.Categories
{
    public class UpdateCategory
    {
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
    }
}
