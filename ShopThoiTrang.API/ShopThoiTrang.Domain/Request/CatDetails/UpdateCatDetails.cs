using System;
using System.Collections.Generic;
using System.Text;

namespace ShopThoiTrang.Domain.Request.CatDetails
{
    public class UpdateCatDetails
    {
        public int CatDetailsId { get; set; }
        public string CatDetailsName { get; set; }
        public bool Status { get; set; }
    }
}
