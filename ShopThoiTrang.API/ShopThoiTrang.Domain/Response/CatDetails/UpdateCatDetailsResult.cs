using System;
using System.Collections.Generic;
using System.Text;

namespace ShopThoiTrang.Domain.Response.CatDetails
{
    public class UpdateCatDetailsResult
    {
        public CategoryDetails CategoryDetails { get; set; }
        public bool IsExitst { get; set; }
        public bool Success => CategoryDetails != null && CategoryDetails.CatDetailsId > 0 && !IsExitst;
        public string Messega => Success ? Common.Message.CategoryDetails.Update : (IsExitst ? Common.Message.CategoryDetails.Exits : Common.Message.Fail);
    }
}
