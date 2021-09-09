using System;
using System.Collections.Generic;
using System.Text;

namespace ShopThoiTrang.Domain.Response.CatDetails
{
    public class CategoryDetails
    {
        public int CatDetailsId { get; set; }
        public string CatDetailsName { get; set; }
        public bool Status { get; set; }
        public bool IsDeleted { get; set; }
        public string CategoryName { get; set; }
    }
}
