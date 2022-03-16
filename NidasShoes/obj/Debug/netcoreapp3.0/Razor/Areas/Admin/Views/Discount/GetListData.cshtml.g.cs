#pragma checksum "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "1265165a2f8cbbf4c15b0f618469406087e8d8ed"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Areas_Admin_Views_Discount_GetListData), @"mvc.1.0.view", @"/Areas/Admin/Views/Discount/GetListData.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"1265165a2f8cbbf4c15b0f618469406087e8d8ed", @"/Areas/Admin/Views/Discount/GetListData.cshtml")]
    #nullable restore
    public class Areas_Admin_Views_Discount_GetListData : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<NidasShoes.Service.Model.NidasShoesResultModel<NidasShoes.Service.Model.DiscountModel>>
    #nullable disable
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
  
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
                <th>Mã giảm giá</th>
                <th>Ngày bắt đầu</th>
                <th>Ngày kết thúc</th>
                <th>Chiết khấu(%)</th>
                <th>Mô tả</th>
                
                <th style=""text-align:right"">Tác vụ</th>
            </tr>
        </thead>
        <tbody>
");
#nullable restore
#line 23 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
             foreach (var item in data)
            {

#line default
#line hidden
#nullable disable
            WriteLiteral("                <tr>\r\n                    <td>");
#nullable restore
#line 26 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                   Write(item.Code);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                    <td>");
#nullable restore
#line 27 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                   Write(item.StartDate);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                    <td>");
#nullable restore
#line 28 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                   Write(item.EndDate);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                    <td>");
#nullable restore
#line 29 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                   Write(item.Rate);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                    <td>");
#nullable restore
#line 30 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                   Write(item.Description);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                    \r\n                    <td style=\"width:80px;text-align:right\">\r\n                        <div class=\"d-flex justify-content-end w-100\">\r\n");
            WriteLiteral("                            <button class=\"btn-yellow btn-event btnEdit\" data-id=\"");
#nullable restore
#line 35 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                                                             Write(item.ID);

#line default
#line hidden
#nullable disable
            WriteLiteral("\"");
            BeginWriteAttribute("onclick", " onclick=\"", 1433, "\"", 1498, 3);
            WriteAttributeValue("", 1443, "GetFormAddOrEdit(\'/Admin/Discount/_AddOrEdit\',", 1443, 46, true);
#nullable restore
#line 35 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
WriteAttributeValue("", 1489, item.ID, 1489, 8, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 1497, ")", 1497, 1, true);
            EndWriteAttribute();
            WriteLiteral("><i class=\"far fa-edit\"></i> </button>\r\n                            <button class=\"btn-red btn-event btnDelete\" role=\"button\" data-id=\"");
#nullable restore
#line 36 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                                                                          Write(item.ID);

#line default
#line hidden
#nullable disable
            WriteLiteral("\"");
            BeginWriteAttribute("onclick", " onclick=\"", 1643, "\"", 1702, 3);
            WriteAttributeValue("", 1653, "DeleteById(\'/Admin/Discount/DeleteById\',", 1653, 40, true);
#nullable restore
#line 36 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
WriteAttributeValue("", 1693, item.ID, 1693, 8, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 1701, ")", 1701, 1, true);
            EndWriteAttribute();
            WriteLiteral("><i class=\"far fa-trash-alt\"></i> </button>\r\n                        </div>\r\n                    </td>\r\n                </tr>\r\n");
#nullable restore
#line 40 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("        </tbody>\r\n\r\n        <tfoot>\r\n\r\n        </tfoot>\r\n    </table>\r\n\r\n    <div class=\"pagination-container\">\r\n        <ul class=\"pagination\">\r\n");
#nullable restore
#line 50 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
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
#line 56 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                                     Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 56 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                                             Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 57 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                    }
                    else
                    {

#line default
#line hidden
#nullable disable
            WriteLiteral("                        <li><a data-index=\"");
#nullable restore
#line 60 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                      Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 60 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                              Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 61 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
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
#line 72 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                                         Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 72 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                                                 Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 73 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                        }
                        else
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <li><a data-index=\"");
#nullable restore
#line 76 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                          Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 76 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                                  Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 77 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                        }
                    }

#line default
#line hidden
#nullable disable
            WriteLiteral("                    <li><a class=\"nextPage\" data-index=\"");
#nullable restore
#line 79 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                                   Write(pageCount);

#line default
#line hidden
#nullable disable
            WriteLiteral("\"><i class=\"fas fa-chevron-right\"></i></a></li>\r\n");
#nullable restore
#line 80 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                }
                else if (pageNumber >= pageCount - 2)
                {

#line default
#line hidden
#nullable disable
            WriteLiteral("                    <li><a class=\"prevPage\" data-index=\"1\"><i class=\"fas fa-chevron-left\"></i></a></li>\r\n");
#nullable restore
#line 84 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"

                    for (int index = pageCount - 3; index <= pageCount; index++)
                    {
                        if (index == pageNumber)
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <li class=\"active\"><a data-index=\"");
#nullable restore
#line 89 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                                         Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 89 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                                                 Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 90 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                        }
                        else
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <li><a data-index=\"");
#nullable restore
#line 93 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                          Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 93 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                                  Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 94 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
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
#line 100 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                    for (int index = pageNumber - 1; index <= pageNumber + 2; index++)
                    {
                        if (index == pageNumber)
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <li class=\"active\"><a data-index=\"");
#nullable restore
#line 104 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                                         Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 104 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                                                 Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 105 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                        }
                        else
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <li><a data-index=\"");
#nullable restore
#line 108 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                          Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 108 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                                  Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 109 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                        }
                    }

#line default
#line hidden
#nullable disable
            WriteLiteral("                    <li><a class=\"nextPage\" data-index=\"");
#nullable restore
#line 111 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                                                   Write(pageCount);

#line default
#line hidden
#nullable disable
            WriteLiteral("\"><i class=\"fas fa-chevron-right\"></i></a></li>\r\n");
#nullable restore
#line 112 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Discount\GetListData.cshtml"
                }
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n        </ul>\r\n    </div>\r\n</div>\r\n\r\n\r\n\r\n");
        }
        #pragma warning restore 1998
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<NidasShoes.Service.Model.NidasShoesResultModel<NidasShoes.Service.Model.DiscountModel>> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591
