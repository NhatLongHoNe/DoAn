#pragma checksum "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "6b7e818c5feed8a5cbbeca67b5e3a1a9f0e324f2"
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
#line 1 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\_ViewImports.cshtml"
using NidasShoes;

#line default
#line hidden
#nullable disable
#nullable restore
#line 1 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
using NidasShoes.Service.Model;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"6b7e818c5feed8a5cbbeca67b5e3a1a9f0e324f2", @"/Views/Home/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"3860ca22f6b586f8065495f0e32b895e4fa1ac69", @"/Views/_ViewImports.cshtml")]
    #nullable restore
    public class Views_Home_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    #nullable disable
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/images/brand-1.jpg"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("img-fluid"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("alt", new global::Microsoft.AspNetCore.Html.HtmlString("Free html4 bootstrap 4 template"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_3 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/images/brand-2.jpg"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_4 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/images/brand-3.jpg"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_5 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/images/brand-4.jpg"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_6 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/images/brand-5.jpg"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
  
    ViewData["Title"] = "Trang chủ";

#line default
#line hidden
#nullable disable
#nullable restore
#line 5 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
  
    var slides = (NidasShoesResultModel<SlideModel>)ViewBag.Slides;
    var products = (NidasShoesResultModel<ProductModel>)ViewBag.Products;

    var dataShop = (ShopModel)ViewBag.Shop;

#line default
#line hidden
#nullable disable
            WriteLiteral("<aside id=\"colorlib-hero\">\r\n    <div class=\"flexslider\">\r\n        <ul class=\"slides\">\r\n");
#nullable restore
#line 14 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
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
#line 16 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
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
#line 25 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
                                                      Write(item.Title);

#line default
#line hidden
#nullable disable
            WriteLiteral("</h2>\r\n");
            WriteLiteral("                                        <p><a");
            BeginWriteAttribute("href", " href=\"", 1220, "\"", 1237, 1);
#nullable restore
#line 27 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
WriteAttributeValue("", 1227, item.Link, 1227, 10, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(" class=\"btn btn-primary\">Mua ngay</a></p>\r\n                                    </div>\r\n                                </div>\r\n                            </div>\r\n                        </div>\r\n                    </div>\r\n                </li>\r\n");
#nullable restore
#line 34 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("        </ul>\r\n    </div>\r\n</aside>\r\n<div class=\"colorlib-intro\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-sm-12 text-center\">\r\n                <h2 class=\"intro\">");
#nullable restore
#line 42 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
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
                        <h2><a href=""#"">Shop Men's Collection</a></h2>
                    </div>
                </div>
            </div>
            <div class=""col-sm-6 text-center"">
                <div class=""featured"">
                    <a href=""#"" class=""featured-img"" style=""background-image: url(/images/women.jpg);""></a>
                    <div class=""desc"">
                        <h2><a href=""#"">Shop Women's Collection</a></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class=""colorlib-product"">
    <div class=""container"">
      ");
            WriteLiteral("  <div class=\"row\">\r\n            <div class=\"col-sm-8 offset-sm-2 text-center colorlib-heading\">\r\n                <h2>Best Sellers</h2>\r\n            </div>\r\n        </div>\r\n");
            WriteLiteral("        <div class=\"row row-pb-md\">\r\n");
#nullable restore
#line 79 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
             foreach (var item in products.Results.Take(16))
            {

#line default
#line hidden
#nullable disable
            WriteLiteral("                <div class=\"col-lg-3 mb-4 text-center\">\r\n                    <div class=\"product-entry border\">\r\n                        <a");
            BeginWriteAttribute("href", " href=\"", 3195, "\"", 3228, 2);
            WriteAttributeValue("", 3202, "Product/Detail?id=", 3202, 18, true);
#nullable restore
#line 83 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
WriteAttributeValue("", 3220, item.ID, 3220, 8, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(" class=\"prod-img\">\r\n                            <img");
            BeginWriteAttribute("src", " src=\"", 3281, "\"", 3298, 1);
#nullable restore
#line 84 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
WriteAttributeValue("", 3287, item.Image, 3287, 11, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(" class=\"img-fluid\"");
            BeginWriteAttribute("alt", " alt=\"", 3317, "\"", 3334, 1);
#nullable restore
#line 84 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
WriteAttributeValue("", 3323, item.Title, 3323, 11, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">\r\n                        </a>\r\n                        <div class=\"desc\">\r\n                            <h2><a");
            BeginWriteAttribute("href", " href=\"", 3446, "\"", 3479, 2);
            WriteAttributeValue("", 3453, "Product/Detail?id=", 3453, 18, true);
#nullable restore
#line 87 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
WriteAttributeValue("", 3471, item.ID, 3471, 8, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 87 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
                                                                Write(item.Name);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></h2>\r\n                            <span class=\"price\">");
#nullable restore
#line 88 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
                                           Write(item.ExportPrice.ToString(" 000,0"));

#line default
#line hidden
#nullable disable
            WriteLiteral(" <sup>đ</sup></span>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n");
#nullable restore
#line 92 "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Home\Index.cshtml"
            }

#line default
#line hidden
#nullable disable
            WriteLiteral(@"        </div>
        <div class=""row"">
            <div class=""col-md-12 text-center"">
                <p><a href=""#"" class=""btn btn-primary btn-lg"">Shop All Products</a></p>
            </div>
        </div>
    </div>
</div>

<div class=""colorlib-partner"">
    <div class=""container"">
        <div class=""row"">
            <div class=""col-sm-8 offset-sm-2 text-center colorlib-heading colorlib-heading-sm"">
                <h2>Trusted Partners</h2>
            </div>
        </div>
        <div class=""row"">
            <div class=""col partner-col text-center"">
                ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("img", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagOnly, "6b7e818c5feed8a5cbbeca67b5e3a1a9f0e324f214091", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n            </div>\r\n            <div class=\"col partner-col text-center\">\r\n                ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("img", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagOnly, "6b7e818c5feed8a5cbbeca67b5e3a1a9f0e324f215386", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_3);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n            </div>\r\n            <div class=\"col partner-col text-center\">\r\n                ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("img", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagOnly, "6b7e818c5feed8a5cbbeca67b5e3a1a9f0e324f216681", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_4);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n            </div>\r\n            <div class=\"col partner-col text-center\">\r\n                ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("img", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagOnly, "6b7e818c5feed8a5cbbeca67b5e3a1a9f0e324f217976", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_5);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n            </div>\r\n            <div class=\"col partner-col text-center\">\r\n                ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("img", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagOnly, "6b7e818c5feed8a5cbbeca67b5e3a1a9f0e324f219271", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_6);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591
