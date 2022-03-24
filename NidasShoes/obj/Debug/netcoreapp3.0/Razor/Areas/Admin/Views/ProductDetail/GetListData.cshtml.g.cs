#pragma checksum "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "7a2000871db236a1866c336124d82789d5d28669"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Areas_Admin_Views_ProductDetail_GetListData), @"mvc.1.0.view", @"/Areas/Admin/Views/ProductDetail/GetListData.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"7a2000871db236a1866c336124d82789d5d28669", @"/Areas/Admin/Views/ProductDetail/GetListData.cshtml")]
    public class Areas_Admin_Views_ProductDetail_GetListData : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<NidasShoes.Service.Model.NidasShoesResultModel<NidasShoes.Service.Model.ProductDetailModel>>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
  
    var data = Model.Results;
    var pageSize = Model.PageSize;
    var pageNumber = Model.PageNumber;
    var pageCount = Model.PageCount;

#line default
#line hidden
#nullable disable
            WriteLiteral(@"
<div class=""data-table"">
    <table id=""myTable"" class=""table table-striped table-bordered text-left table-hover"" style=""background:#fff;"">
        <thead>
            <tr>
                <th>Hình ảnh</th>
                <th>Tên sản phẩm</th>
                <th>Loại sản phẩm</th>
                <th>Size</th>
                <th>Màu</th>
                <th>Giá nhập</th>
                <th>Giá bán</th>
                <th>Số lượng</th>
                <th>Ngày cuối update</th>
");
            WriteLiteral("                <th style=\"text-align:right\">Tác vụ</th>\r\n            </tr>\r\n        </thead>\r\n        <tbody>\r\n");
#nullable restore
#line 27 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
             foreach (var item in data)
            {

#line default
#line hidden
#nullable disable
            WriteLiteral("            <tr>\r\n                <td><img");
            BeginWriteAttribute("src", " src=\"", 1004, "\"", 1021, 1);
#nullable restore
#line 30 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
WriteAttributeValue("", 1010, item.Image, 1010, 11, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(" style=\"width:80px;height:40px;object-fit:contain\"  alt=\"Alternate Text\" /></td>\r\n                <td>");
#nullable restore
#line 31 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
               Write(item.ProductName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 32 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
               Write(item.ProductCategoryName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 33 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
               Write(item.SizeName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 34 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
               Write(item.ColorName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 35 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
               Write(item.ImportPrice);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 36 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
               Write(item.ExportPrice);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 37 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
               Write(item.Quantity);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td>");
#nullable restore
#line 38 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
               Write(item.LastUpdated.ToString("dd/MM/yyy hh:mm:ss"));

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                <td style=\"width:80px;text-align:right\">\r\n                    <div class=\"d-flex justify-content-end w-100\">\r\n");
            WriteLiteral("                        <button class=\"btn-yellow btn-event btnEdit\" data-id=\"");
#nullable restore
#line 42 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                                                         Write(item.ID);

#line default
#line hidden
#nullable disable
            WriteLiteral("\"");
            BeginWriteAttribute("onclick", " onclick=\"", 1839, "\"", 1909, 3);
            WriteAttributeValue("", 1849, "GetFormAddOrEdit(\'/Admin/ProductDetail/_AddOrEdit\',", 1849, 51, true);
#nullable restore
#line 42 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
WriteAttributeValue("", 1900, item.ID, 1900, 8, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 1908, ")", 1908, 1, true);
            EndWriteAttribute();
            WriteLiteral("><i class=\"far fa-edit\"></i> </button>\r\n                        <button class=\"btn-red btn-event btnDelete\" role=\"button\" data-id=\"");
#nullable restore
#line 43 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                                                                      Write(item.ID);

#line default
#line hidden
#nullable disable
            WriteLiteral("\"");
            BeginWriteAttribute("onclick", " onclick=\"", 2050, "\"", 2114, 3);
            WriteAttributeValue("", 2060, "DeleteById(\'/Admin/ProductDetail/DeleteById\',", 2060, 45, true);
#nullable restore
#line 43 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
WriteAttributeValue("", 2105, item.ID, 2105, 8, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 2113, ")", 2113, 1, true);
            EndWriteAttribute();
            WriteLiteral("><i class=\"far fa-trash-alt\"></i> </button>\r\n                    </div>\r\n                </td>\r\n            </tr>\r\n");
#nullable restore
#line 47 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("        </tbody>\r\n\r\n        <tfoot>\r\n\r\n        </tfoot>\r\n    </table>\r\n\r\n    <div class=\"pagination-container\">\r\n        <ul class=\"pagination\">\r\n");
#nullable restore
#line 57 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
             if (pageCount <= 4)
            {
                for (int index = 1; index <= pageCount; index++)
                {
                    if (index == pageNumber)
                    {

#line default
#line hidden
#nullable disable
            WriteLiteral("                        <li class=\"active\"><a data-index=\"");
#nullable restore
#line 63 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                                     Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 63 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                                             Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 64 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                    }
                    else
                    {

#line default
#line hidden
#nullable disable
            WriteLiteral("                        <li><a data-index=\"");
#nullable restore
#line 67 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                      Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 67 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                              Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 68 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                    }
                }
            }
            else
            {
                if (pageNumber <= 2)
                {
                    for (int index = 1; index <= 4; index++)
                    {
                        if (index == pageNumber)
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <li class=\"active\"><a data-index=\"");
#nullable restore
#line 79 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                                         Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 79 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                                                 Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 80 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                        }
                        else
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <li><a data-index=\"");
#nullable restore
#line 83 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                          Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 83 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                                  Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 84 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                        }
                    }

#line default
#line hidden
#nullable disable
            WriteLiteral("                    <li><a class=\"nextPage\" data-index=\"");
#nullable restore
#line 86 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                                   Write(pageCount);

#line default
#line hidden
#nullable disable
            WriteLiteral("\"><i class=\"fas fa-chevron-right\"></i></a></li>\r\n");
#nullable restore
#line 87 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                }
                else if (pageNumber >= pageCount - 2)
                {

#line default
#line hidden
#nullable disable
            WriteLiteral("                    <li><a class=\"prevPage\" data-index=\"1\"><i class=\"fas fa-chevron-left\"></i></a></li>\r\n");
#nullable restore
#line 91 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"

                    for (int index = pageCount - 3; index <= pageCount; index++)
                    {
                        if (index == pageNumber)
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <li class=\"active\"><a data-index=\"");
#nullable restore
#line 96 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                                         Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 96 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                                                 Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 97 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                        }
                        else
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <li><a data-index=\"");
#nullable restore
#line 100 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                          Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 100 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                                  Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 101 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                        }
                    }
                }
                else
                {

#line default
#line hidden
#nullable disable
            WriteLiteral("                    <li><a class=\"prevPage\" data-index=\"1\"><i class=\"fas fa-chevron-left\"></i></a></li>\r\n");
#nullable restore
#line 107 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                    for (int index = pageNumber - 1; index <= pageNumber + 2; index++)
                    {
                        if (index == pageNumber)
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <li class=\"active\"><a data-index=\"");
#nullable restore
#line 111 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                                         Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 111 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                                                 Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 112 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                        }
                        else
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <li><a data-index=\"");
#nullable restore
#line 115 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                          Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 115 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                                  Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 116 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                        }
                    }

#line default
#line hidden
#nullable disable
            WriteLiteral("                    <li><a class=\"nextPage\" data-index=\"");
#nullable restore
#line 118 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                                                   Write(pageCount);

#line default
#line hidden
#nullable disable
            WriteLiteral("\"><i class=\"fas fa-chevron-right\"></i></a></li>\r\n");
#nullable restore
#line 119 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\ProductDetail\GetListData.cshtml"
                }
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n        </ul>\r\n    </div>\r\n</div>\r\n\r\n\r\n\r\n");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<NidasShoes.Service.Model.NidasShoesResultModel<NidasShoes.Service.Model.ProductDetailModel>> Html { get; private set; }
    }
}
#pragma warning restore 1591
