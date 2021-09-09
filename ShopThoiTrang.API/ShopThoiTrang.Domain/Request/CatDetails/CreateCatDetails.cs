using System;
using System.Collections.Generic;
using System.Text;

namespace ShopThoiTrang.Domain.Request.CatDetails
{
    public class CreateCatDetails
    {
        public string CatDetailsName { get; set; }
        public bool Status { get; set; }
        public int CategoryId { get; set; }
    }
}
