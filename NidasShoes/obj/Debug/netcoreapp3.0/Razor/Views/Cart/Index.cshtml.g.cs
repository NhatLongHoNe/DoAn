#pragma checksum "C:\Users\Admin\Desktop\doan\NidasShoes\Views\Cart\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "6b3438e21caa6fe4144e3a37b1ddb6060434ae4c"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(NidasShoes.Pages.Cart.Views_Cart_Index), @"mvc.1.0.view", @"/Views/Cart/Index.cshtml")]
namespace NidasShoes.Pages.Cart
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"6b3438e21caa6fe4144e3a37b1ddb6060434ae4c", @"/Views/Cart/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"3860ca22f6b586f8065495f0e32b895e4fa1ac69", @"/Views/_ViewImports.cshtml")]
    #nullable restore
    public class Views_Cart_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    #nullable disable
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("action", new global::Microsoft.AspNetCore.Html.HtmlString("#"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            DefineSection("Scripts", async() => {
                WriteLiteral("\r\n\r\n");
            }
            );
            WriteLiteral(@"<div class=""breadcrumbs"">
    <div class=""container"">
        <div class=""row"">
            <div class=""col"">
                <p class=""bread""><span><a href=""index.html"">Home</a></span> / <span>Shopping Cart</span></p>
            </div>
        </div>
    </div>
</div>


<div id=""cartContent"" class=""colorlib-product"">
    <div class=""container"">
        <div class=""row row-pb-lg"">
            <div class=""col-md-10 offset-md-1"">
                <div class=""process-wrap"">
                    <div class=""process text-center active"">
                        <p><span>01</span></p>
                        <h3>Shopping Cart</h3>
                    </div>
                    <div class=""process text-center"">
                        <p><span>02</span></p>
                        <h3>Checkout</h3>
                    </div>
                    <div class=""process text-center"">
                        <p><span>03</span></p>
                        <h3>Order Complete</h3>
                    ");
            WriteLiteral(@"</div>
                </div>
            </div>
        </div>
        <div class=""row row-pb-lg"">
            <div class=""col-md-12"">
                <div class=""product-name d-flex"">
                    <div class=""one-forth text-left px-4"">
                        <span>Product Details</span>
                    </div>
                    <div class=""one-eight text-center"">
                        <span>Color</span>
                    </div>
                    <div class=""one-eight text-center"">
                        <span>Size</span>
                    </div>
                    <div class=""one-eight text-center"">
                        <span>Price</span>
                    </div>
                    <div class=""one-eight text-center"">
                        <span>Quantity</span>
                    </div>
                    <div class=""one-eight text-center"">
                        <span>Total</span>
                    </div>
                    <div class=""one-eight ");
            WriteLiteral(@"text-center px-4"">
                        <span>Remove</span>
                    </div>
                </div>
                <div id=""cartContent"">
                </div>
                <div id=""cartBody"">
                </div>

            </div>
        </div>
        <div class=""row row-pb-lg"">
            <div class=""col-md-12"">
                <div class=""total-wrap"">
                    <div class=""row"">
                        <div class=""col-sm-8"">
                            ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("form", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "6b3438e21caa6fe4144e3a37b1ddb6060434ae4c6214", async() => {
                WriteLiteral(@"
                                <div class=""row form-group"">
                                    <div class=""col-sm-9"">
                                        <input type=""text"" name=""quantity"" class=""form-control input-number"" placeholder=""Your Coupon Number..."">
                                    </div>
                                    <div class=""col-sm-3"">
                                        <input type=""submit"" value=""Apply Coupon"" class=""btn btn-primary"">
                                    </div>
                                </div>
                            ");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral(@"
                        </div>
                        <div class=""col-sm-4 text-center"">
                            <div class=""total"">
                                <div class=""sub"">
                                    <p><span>Subtotal:</span> <span id=""lblTotalOrder""></span></p>
                                    <p><span>Delivery:</span> <span>$0.00</span></p>
                                    <p><span>Discount:</span> <span>$0.00</span></p>
                                </div>
                                <div class=""grand-total"">
                                    <p><span><strong>Total:</strong></span> <span>0.00</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class=""row row-pb-lg"">
            <div class=""col-md-12"">
                <div class=""total-wrap"">
                    <div class=""row"">
         ");
            WriteLiteral(@"               <div class=""col-sm-8"">
                            <button class=""btn btn-success"" id=""btnContinue"">tiếp tục mua hàng</button>
                            <button class=""btn btn-danger"" id=""btnDeleteAll"">xoá giỏ hàng</button>
                            <button class=""btn btn-info"" id=""btnCheckout"">Thanh toán</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class=""row"">
            <div class=""col-sm-8 offset-sm-2 text-center colorlib-heading colorlib-heading-sm"">
                <h2>Related Products</h2>
            </div>
        </div>
        <div class=""row"">
            <div class=""col-md-3 col-lg-3 mb-4 text-center"">
                <div class=""product-entry border"">
                    <a href=""#"" class=""prod-img"">
                        <img src=""images/item-1.jpg"" class=""img-fluid"" alt=""Free html5 bootstrap 4 template"">
                    </a>
                    <div class=");
            WriteLiteral(@"""desc"">
                        <h2><a href=""#"">Women's Boots Shoes Maca</a></h2>
                        <span class=""price"">$139.00</span>
                    </div>
                </div>
            </div>
            <div class=""col-md-3 col-lg-3 mb-4 text-center"">
                <div class=""product-entry border"">
                    <a href=""#"" class=""prod-img"">
                        <img src=""images/item-2.jpg"" class=""img-fluid"" alt=""Free html5 bootstrap 4 template"">
                    </a>
                    <div class=""desc"">
                        <h2><a href=""#"">Women's Minam Meaghan</a></h2>
                        <span class=""price"">$139.00</span>
                    </div>
                </div>
            </div>
            <div class=""col-md-3 col-lg-3 mb-4 text-center"">
                <div class=""product-entry border"">
                    <a href=""#"" class=""prod-img"">
                        <img src=""images/item-3.jpg"" class=""img-fluid"" alt=""Free html5 bootstrap ");
            WriteLiteral(@"4 template"">
                    </a>
                    <div class=""desc"">
                        <h2><a href=""#"">Men's Taja Commissioner</a></h2>
                        <span class=""price"">$139.00</span>
                    </div>
                </div>
            </div>
            <div class=""col-md-3 col-lg-3 mb-4 text-center"">
                <div class=""product-entry border"">
                    <a href=""#"" class=""prod-img"">
                        <img src=""images/item-4.jpg"" class=""img-fluid"" alt=""Free html5 bootstrap 4 template"">
                    </a>
                    <div class=""desc"">
                        <h2><a href=""#"">Russ Men's Sneakers</a></h2>
                        <span class=""price"">$139.00</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script id=""tplCart"" type=""x-tmpl-mustache"">
    <div class=""product-cart d-flex"">
        <div class=""one-forth"">
            <div class=""product-img"" s");
            WriteLiteral(@"tyle=""background-image: url({{Image}});"">
            </div>
            <div class=""display-tc"">
                <h3>{{ProductName}}</h3>
            </div>
        </div>
        <div class=""one-eight text-center"">
            <div class=""display-tc"">
                <span class=""color"">{{Color}}</span>
            </div>
        </div>
        <div class=""one-eight text-center"">
            <div class=""display-tc"">
                <span class=""size"">{{Size}}</span>
            </div>
        </div>
        <div class=""one-eight text-center"">
            <div class=""display-tc"">
                <span class=""price"">{{PriceF}}</span>
            </div>
        </div>
        <div class=""one-eight text-center"">
            <div class=""display-tc"">
                <input type=""number"" data-id=""{{ProductDetailId}}"" data-price=""{{Price}}"" id=""Quantity"" name=""quantity"" class=""txtQuantity form-control input-number text-center"" value=""{{Quantity}}"">
            </div>
        </div>
       ");
            WriteLiteral(@" <div class=""one-eight text-center"">
            <div class=""display-tc"">
                <span id=""amount_{{ProductDetailId}}"" class=""Amount"">{{Amount}}</span>
            </div>
        </div>
        <div class=""one-eight text-center"">
            <div class=""display-tc"">
                <a href=""#"" class=""closed btnDeleteItem"" data-id=""{{ProductDetailId}}""></a>
            </div>
        </div>
    </div>
</script>


");
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
