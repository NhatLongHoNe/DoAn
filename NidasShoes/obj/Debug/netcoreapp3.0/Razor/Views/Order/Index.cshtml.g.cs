#pragma checksum "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "bb5c58cbb6b16305f770271ffd132544325451c1"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(NidasShoes.Pages.Order.Views_Order_Index), @"mvc.1.0.view", @"/Views/Order/Index.cshtml")]
namespace NidasShoes.Pages.Order
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\_ViewImports.cshtml"
using NidasShoes;

#line default
#line hidden
#nullable disable
#nullable restore
#line 1 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
using NidasShoes.Service.Model;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"bb5c58cbb6b16305f770271ffd132544325451c1", @"/Views/Order/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"3860ca22f6b586f8065495f0e32b895e4fa1ac69", @"/Views/_ViewImports.cshtml")]
    #nullable restore
    public class Views_Order_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<NidasShoes.Service.Model.NidasShoesResultModel<NidasShoes.Service.Model.OrderModel>>
    #nullable disable
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 3 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
  
    var data = Model.Results;
    var pageSize = Model.PageSize;
    var pageNumber = Model.PageNumber;
    var pageCount = Model.PageCount;


#line default
#line hidden
#nullable disable
            WriteLiteral(@"<style>
   .data-table {
    margin: 0 auto;
    padding-top:50px;
}
</style>
<div class=""controller"">
    <div class=""row"">
        <div class=""data-table"">
    <table id=""myTable"" class=""table table-striped table-bordered text-left table-hover table-order-customer pt-5"" style=""background:#fff;"">
        <thead>
            <tr>
                <th>Mã đơn hàng</th>
                <th>Tên Người nhận</th>
                <th>Số điện thoại</th>
                <th>Email</th>
                <th>Địa chỉ nhận</th>
                <th>Thời gian đặt</th>
                <th>Tình trạng đơn hàng</th>
                <th>Thanh toán</th>
                <th>Nhân viên chăm sóc</th>
                <th style=""text-align:right"">Tác vụ</th>
            </tr>
        </thead>
        <tbody>
");
#nullable restore
#line 35 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
             foreach (var item in data)
            {

#line default
#line hidden
#nullable disable
            WriteLiteral("                <tr>\r\n                    <td>");
#nullable restore
#line 38 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                   Write(item.ID);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                    <td>");
#nullable restore
#line 39 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                   Write(item.CustomerName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                    <td>");
#nullable restore
#line 40 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                   Write(item.CustomerMobile);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                    <td>");
#nullable restore
#line 41 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                   Write(item.CustomerEmail);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                    <td>");
#nullable restore
#line 42 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                   Write(item.CustomerAddress);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                    <td>");
#nullable restore
#line 43 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                   Write(item.CreatedDate.ToString("dd/MM/yyy"));

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                    <td>");
#nullable restore
#line 44 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                   Write(item.StatusName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                    <td>");
#nullable restore
#line 45 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                   Write(item.PaymentName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                    <td>");
#nullable restore
#line 46 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                   Write(item.EmployeeName);

#line default
#line hidden
#nullable disable
            WriteLiteral("</td>\r\n                    <td style=\"width:80px;text-align:right\">\r\n                        <div class=\"d-flex justify-content-end w-100\">\r\n                            <a");
            BeginWriteAttribute("href", " href=\"", 1790, "\"", 1835, 2);
            WriteAttributeValue("", 1797, "/Order/GetOrderDetail?orderId=", 1797, 30, true);
#nullable restore
#line 49 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
WriteAttributeValue("", 1827, item.ID, 1827, 8, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(" class=\"btn-green btn-event btnDetail\" data-id=\"");
#nullable restore
#line 49 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                                                                                                       Write(item.ID);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">Chi tiết </a>\r\n");
            WriteLiteral("                        </div>\r\n                    </td>\r\n                </tr>\r\n");
#nullable restore
#line 56 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("        </tbody>\r\n\r\n        <tfoot>\r\n        </tfoot>\r\n    </table>\r\n\r\n    <div class=\"pagination-container\">\r\n        <ul class=\"pagination\">\r\n");
#nullable restore
#line 65 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
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
#line 71 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                                     Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 71 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                                             Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 72 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                    }
                    else
                    {

#line default
#line hidden
#nullable disable
            WriteLiteral("                        <li><a data-index=\"");
#nullable restore
#line 75 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                      Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 75 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                              Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 76 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
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
#line 87 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                                         Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 87 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                                                 Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 88 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                        }
                        else
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <li><a data-index=\"");
#nullable restore
#line 91 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                          Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 91 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                                  Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 92 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                        }
                    }

#line default
#line hidden
#nullable disable
            WriteLiteral("                    <li><a class=\"nextPage\" data-index=\"");
#nullable restore
#line 94 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                                   Write(pageCount);

#line default
#line hidden
#nullable disable
            WriteLiteral("\"><i class=\"fas fa-chevron-right\"></i></a></li>\r\n");
#nullable restore
#line 95 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                }
                else if (pageNumber >= pageCount - 2)
                {

#line default
#line hidden
#nullable disable
            WriteLiteral("                    <li><a class=\"prevPage\" data-index=\"1\"><i class=\"fas fa-chevron-left\"></i></a></li>\r\n");
#nullable restore
#line 99 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"

                    for (int index = pageCount - 3; index <= pageCount; index++)
                    {
                        if (index == pageNumber)
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <li class=\"active\"><a data-index=\"");
#nullable restore
#line 104 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                                         Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 104 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                                                 Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 105 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                        }
                        else
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <li><a data-index=\"");
#nullable restore
#line 108 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                          Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 108 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                                  Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 109 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
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
#line 115 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                    for (int index = pageNumber - 1; index <= pageNumber + 2; index++)
                    {
                        if (index == pageNumber)
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <li class=\"active\"><a data-index=\"");
#nullable restore
#line 119 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                                         Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 119 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                                                 Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 120 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                        }
                        else
                        {

#line default
#line hidden
#nullable disable
            WriteLiteral("                            <li><a data-index=\"");
#nullable restore
#line 123 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                          Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("\">");
#nullable restore
#line 123 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                                  Write(index);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 124 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                        }
                    }

#line default
#line hidden
#nullable disable
            WriteLiteral("                    <li><a class=\"nextPage\" data-index=\"");
#nullable restore
#line 126 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                                                   Write(pageCount);

#line default
#line hidden
#nullable disable
            WriteLiteral("\"><i class=\"fas fa-chevron-right\"></i></a></li>\r\n");
#nullable restore
#line 127 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Order\Index.cshtml"
                }
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n        </ul>\r\n    </div>\r\n</div>\r\n    </div>\r\n</div>\r\n");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<NidasShoes.Service.Model.NidasShoesResultModel<NidasShoes.Service.Model.OrderModel>> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591
