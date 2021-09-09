using System;
using System.Collections.Generic;
using System.Text;

namespace ShopThoiTrang.Domain.Response.CatDetails
{
    public class CreateCatDetailsResult
    {
        public CategoryDetails CategoryDetails { get; set; }
        public bool IsExitst { get; set; }
        public bool Success => CategoryDetails != null && CategoryDetails.CatDetailsId > 0 && !IsExitst;
        public string Message => Success ? Common.Message.CategoryDetails.Create : (!IsExitst ? Common.Message.CategoryDetails.Exits : Common.Message.Fail);
    }
}
