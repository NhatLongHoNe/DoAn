#pragma checksum "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\Home\Login.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "23e85d2e01e7cf2e0c8b67c477b5c9512d07895d"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Areas_Admin_Views_Home_Login), @"mvc.1.0.view", @"/Areas/Admin/Views/Home/Login.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"23e85d2e01e7cf2e0c8b67c477b5c9512d07895d", @"/Areas/Admin/Views/Home/Login.cshtml")]
    public class Areas_Admin_Views_Home_Login : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 1 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\Home\Login.cshtml"
  
    Layout = "~/Areas/Admin/Views/Shared/_Layout.cshtml";

#line default
#line hidden
#nullable disable
            WriteLiteral(@"<div class=""login_wrapper"">
    <div class=""logo-login""><img src=""/Upload/Image/logo.png"" class=""img-responsive"" alt=""DEVCRM""></div>
    <div class=""animate form login_form"">
        <section class=""login_content"">
            <h1>Đăng nhập hệ thống</h1>
            <form id=""loginform"" method=""post"">
                <div class=""form-group"">
                    <input type=""text"" id=""username"" name=""username"" class=""form-control"" placeholder=""Tài khoản"" />
                </div>
                <div>
                    <input type=""password"" id=""password"" name=""password"" class=""form-control"" placeholder=""Mật khẩu"" />
                </div>
                <div class=""form-group"" style=""margin-top:10px"">
                    <button type=""submit"" class=""btn btn-default submit"">Đăng nhập</button>
                </div>
                <div class=""separator"">
                    <div class=""clearfix""></div>
                </div>
                <div class=""clearfix""></div>
                <br");
            WriteLiteral(" />\r\n            </form>\r\n        </section>\r\n    </div>\r\n</div>\r\n");
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
