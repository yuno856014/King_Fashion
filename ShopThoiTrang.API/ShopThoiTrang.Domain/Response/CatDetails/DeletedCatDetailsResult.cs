using System;
using System.Collections.Generic;
using System.Text;

namespace ShopThoiTrang.Domain.Response.CatDetails
{
    public class DeletedCatDetailsResult
    {
        public bool Success { get; set; }
        public bool NotFound { get; set; }
        public string Message => Success ? Common.Message.CategoryDetails.Delete : (NotFound ? Common.Message.CategoryDetails.NotFound : Common.Message.Fail);
    }
}
