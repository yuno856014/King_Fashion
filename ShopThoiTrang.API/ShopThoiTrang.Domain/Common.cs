using System;
using System.Collections.Generic;
using System.Text;

namespace ShopThoiTrang.Domain
{
    public static class Common
    {
        public static class Message
        {
            public static string Fail = "Something went wrong, please try again.";
            public static class Category
            {
                public static string Create = "Category has been created successful!";
                public static string Update = "Category has been updated successful!";
                public static string Delete = "Category has been deleted successful!";
                public static string Exits = "Category has been existed";
                public static string NotFound = "Category has been not found!";
                public static string ChangeStatus = "Category has been change status successful!";
            }
            public static class CategoryDetails
            {
                public static string Create = "CategoryDetails has been created successful";
                public static string Update = "CategoryDetails has been updated successful";
                public static string Delete = "CategoryDetails has been deleted successful";
                public static string Exits = "CategoryDetails has been existed";
                public static string NotFound = "CategoryDetails has been not found";
                public static string Restore = "CategoryDetails has been restore successful";
                public static string ChangeStatus = "CategoryDetails has been change status successful";
            }
        }
    }
}
