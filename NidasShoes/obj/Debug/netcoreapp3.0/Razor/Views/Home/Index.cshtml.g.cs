#pragma checksum "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "e1b4c3868f3a861def201fd7ef9ef9f3fd66b0b8"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(NidasShoes.Pages.Home.Views_Home_Index), @"mvc.1.0.view", @"/Views/Home/Index.cshtml")]
namespace NidasShoes.Pages.Home
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
#line 1 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\_ViewImports.cshtml"
using NidasShoes;

#line default
#line hidden
#nullable disable
#nullable restore
#line 1 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
using NidasShoes.Service.Model;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"e1b4c3868f3a861def201fd7ef9ef9f3fd66b0b8", @"/Views/Home/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"3860ca22f6b586f8065495f0e32b895e4fa1ac69", @"/Views/_ViewImports.cshtml")]
    public class Views_Home_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
  
    ViewData["Title"] = "Trang chủ";

#line default
#line hidden
#nullable disable
#nullable restore
#line 5 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
  
    var slides = (NidasShoesResultModel<SlideModel>)ViewBag.Slides;
    var products = (NidasShoesResultModel<ProductModel>)ViewBag.Products;

    var dataShop = (ShopModel)ViewBag.Shop;

#line default
#line hidden
#nullable disable
            WriteLiteral("<aside id=\"colorlib-hero\">\r\n    <div class=\"flexslider\">\r\n        <ul class=\"slides\">\r\n");
#nullable restore
#line 14 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
             foreach (var item in slides.Results)
            {

#line default
#line hidden
#nullable disable
            WriteLiteral("                <li");
            BeginWriteAttribute("style", " style=\"", 448, "\"", 491, 4);
            WriteAttributeValue("", 456, "background-image:", 456, 17, true);
            WriteAttributeValue(" ", 473, "url(", 474, 5, true);
#nullable restore
#line 16 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
WriteAttributeValue("", 478, item.Image, 478, 11, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 489, ");", 489, 2, true);
            EndWriteAttribute();
            WriteLiteral(@">
                    <div class=""overlay""></div>
                    <div class=""container-fluid"">
                        <div class=""row"">
                            <div class=""col-sm-6 offset-sm-3 text-center slider-text"">
                                <div class=""slider-text-inner"">
                                    <div class=""desc"">
");
            WriteLiteral("                                        <h2 class=\"head-3\">");
#nullable restore
#line 25 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
                                                      Write(item.Title);

#line default
#line hidden
#nullable disable
            WriteLiteral("</h2>\r\n");
            WriteLiteral("                                        <p><a");
            BeginWriteAttribute("href", " href=\"", 1220, "\"", 1237, 1);
#nullable restore
#line 27 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
WriteAttributeValue("", 1227, item.Link, 1227, 10, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(" class=\"btn btn-primary\">Mua ngay</a></p>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </li>\r\n");
#nullable restore
#line 34 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("        </ul>\r\n    </div>\r\n</aside>\r\n<div class=\"colorlib-intro\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-sm-12 text-center\">\r\n                <h2 class=\"intro\">");
#nullable restore
#line 42 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
                             Write(dataShop.Slogan);

#line default
#line hidden
#nullable disable
            WriteLiteral(@"</h2>
            </div>
        </div>
    </div>
</div>
<div class=""colorlib-product"">
    <div class=""container-fluid"">
        <div class=""row"">
            <div class=""col-sm-6 text-center"">
                <div class=""featured"">
                    <a href=""#"" class=""featured-img"" style=""background-image: url(/images/men.jpg);""></a>
                    <div class=""desc"">
                        <h2><a href=""#"">Bộ sưu tập dành cho nam giới</a></h2>
                    </div>
                </div>
            </div>
            <div class=""col-sm-6 text-center"">
                <div class=""featured"">
                    <a href=""#"" class=""featured-img"" style=""background-image: url(/images/women.jpg);""></a>
                    <div class=""desc"">
                        <h2><a href=""#"">Bộ sưu tập dành cho nữ giới</a></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class=""colorlib-product"">
    <div class=""containe");
            WriteLiteral("r\">\r\n        <div class=\"row\">\r\n            <div class=\"col-sm-8 offset-sm-2 text-center colorlib-heading\">\r\n                <h2>BÁN CHẠY NHẤT</h2>\r\n            </div>\r\n        </div>\r\n");
            WriteLiteral("        <div class=\"row row-pb-md\">\r\n");
#nullable restore
#line 79 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
             foreach (var item in products.Results.Take(16))
            {

#line default
#line hidden
#nullable disable
            WriteLiteral("                <div class=\"col-lg-3 mb-4 text-center\">\r\n                    <div class=\"product-entry border\">\r\n                        <a");
            BeginWriteAttribute("href", " href=\"", 3207, "\"", 3240, 2);
            WriteAttributeValue("", 3214, "Product/Detail?id=", 3214, 18, true);
#nullable restore
#line 83 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
WriteAttributeValue("", 3232, item.ID, 3232, 8, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(" class=\"prod-img\">\r\n                            <img");
            BeginWriteAttribute("src", " src=\"", 3293, "\"", 3310, 1);
#nullable restore
#line 84 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
WriteAttributeValue("", 3299, item.Image, 3299, 11, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(" class=\"img-fluid\"");
            BeginWriteAttribute("alt", " alt=\"", 3329, "\"", 3346, 1);
#nullable restore
#line 84 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
WriteAttributeValue("", 3335, item.Title, 3335, 11, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">\r\n                        </a>\r\n                        <div class=\"desc\">\r\n                            <h2><a");
            BeginWriteAttribute("href", " href=\"", 3458, "\"", 3491, 2);
            WriteAttributeValue("", 3465, "Product/Detail?id=", 3465, 18, true);
#nullable restore
#line 87 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
WriteAttributeValue("", 3483, item.ID, 3483, 8, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 87 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
                                                                Write(item.Name);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></h2>\r\n                            <span class=\"price\">");
#nullable restore
#line 88 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
                                           Write(item.ExportPrice.ToString(" 000,0"));

#line default
#line hidden
#nullable disable
            WriteLiteral(" <sup>đ</sup></span>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n");
#nullable restore
#line 92 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Views\Home\Index.cshtml"
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("        </div>\r\n        <div class=\"row\">\r\n            <div class=\"col-md-12 text-center\">\r\n                <p><a href=\"/product\" class=\"btn btn-primary btn-lg\">Xem toàn bộ sản phẩm</a></p>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n\r\n");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; }
    }
}
#pragma warning restore 1591
