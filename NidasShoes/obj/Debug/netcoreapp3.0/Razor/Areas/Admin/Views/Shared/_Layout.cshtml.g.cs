#pragma checksum "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Shared\_Layout.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "efcb8e5e3bdcd9ef89ebdc3304782ceb73bb38ce"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Areas_Admin_Views_Shared__Layout), @"mvc.1.0.view", @"/Areas/Admin/Views/Shared/_Layout.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"efcb8e5e3bdcd9ef89ebdc3304782ceb73bb38ce", @"/Areas/Admin/Views/Shared/_Layout.cshtml")]
    #nullable restore
    public class Areas_Admin_Views_Shared__Layout : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    #nullable disable
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("login"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.HeadTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper;
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.BodyTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("<!DOCTYPE html>\r\n<html lang=\"en\">\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("head", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "efcb8e5e3bdcd9ef89ebdc3304782ceb73bb38ce3173", async() => {
                WriteLiteral(@"
    <meta http-equiv=""Content-Type"" content=""text/html; charset=UTF-8"">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset=""utf-8"">
    <meta http-equiv=""X-UA-Compatible"" content=""IE=edge"">
    <meta name=""viewport"" content=""width=device-width, initial-scale=1"">

    <title> | Đăng nhập </title>
    <link rel=""icon"" type=""image/png"" sizes=""32x32"" href=""/Upload/Image/logo.png"">

    <!-- Bootstrap -->
    <link href=""/Admin/Content/bootstrap.min.css"" rel=""stylesheet"">

    <!-- Font Awesome -->
    <link rel=""stylesheet"" href=""/Admin/Content/plugins/fontawesome-free/css/all.min.css"">
    <!-- Ionicons -->
    <link rel=""stylesheet"" href=""https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"">
    <!-- NProgress -->
    <!-- Animate.css -->
    <!-- Theme style -->
    <link rel=""stylesheet"" href=""/Admin/Content/dist/css/animate.min.css"">
    <link href=""/Admin/Content/pnotify/dist/pnotify.css"" rel=""stylesheet"">
    <link href=""/Admin/Content/pnotify/dist/pnotif");
                WriteLiteral(@"y.buttons.css"" rel=""stylesheet"">
    <link href=""/Admin/Content/pnotify/dist/pnotify.nonblock.css"" rel=""stylesheet"">

    <!-- Custom Theme Style -->
    <link href=""/Admin/Content/custom.min.css"" rel=""stylesheet"">
    <link href=""/Admin/Content/login-form.css"" rel=""stylesheet"" />
    <link href=""/Admin/Content/dist/css/alerts.less"" rel=""stylesheet/less"" />

    <!-- Latest compiled and minified CSS & JS -->
    <script src=""/Admin/Scripts/jquery-3.4.1.min.js""></script>
    <script src=""/Admin/Content/pnotify/dist/pnotify.js""></script>
    <script src=""/Admin/Content/pnotify/dist/pnotify.buttons.js""></script>
    <script src=""/Admin/Content/pnotify/dist/pnotify.nonblock.js""></script>
");
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.HeadTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("body", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "efcb8e5e3bdcd9ef89ebdc3304782ceb73bb38ce5976", async() => {
                WriteLiteral(@"
    <script type=""text/javascript"">
        $(document).ready(function () {
            $(""#loginform"").submit(function () {
                //debugger
                var form_data = $(""#loginform"").serialize();
                debugger
                $.ajax({
                    url: '/Admin/Authentication/Login',
                    type: 'POST',
                    dataType: 'text',
                    data: form_data,
                    beforeSend: function () {
                        new PNotify({
                            title: 'Thông báo',
                            text: 'Bắt đầu xử lý',
                            type: 'info',
                            hide: false,
                            styling: 'bootstrap3'
                        });
                    }
                })
                    .done(function (result) {
                        PNotify.removeAll();
                        if (result == ""true"") {
                            new PNotify({
   ");
                WriteLiteral(@"                             title: 'Thông báo',
                                text: ""Đăng nhập thành công!"",
                                type: 'success',
                                hide: false,
                                styling: 'bootstrap3',
                            });

                            new PNotify({
                                title: 'Thông báo',
                                text: 'Đang chuyển hướng',
                                type: 'info',
                                hide: false,
                                styling: 'bootstrap3',
                            });

                            setTimeout(function () {
                                window.location.href = '/Admin/Home/Index';
                            }, 1000);
                        } else {
                            let msg = ""Đăng nhập thất bại"";
                            new PNotify({
                                title: 'Thông báo',
                      ");
                WriteLiteral(@"          text: msg,
                                type: 'error',
                                hide: false,
                                styling: 'bootstrap3'
                            });
                        }
                    })
                    .fail(function () {
                        new PNotify({
                            title: 'Thông báo',
                            text: 'Lỗi xử lý đăng nhập',
                            type: 'error',
                            hide: false,
                            styling: 'bootstrap3'
                        });
                    })
                    .always(function () {
                        console.log(""complete"");
                    });
                return false;
            });

        });
    </script>
    ");
#nullable restore
#line 112 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Shared\_Layout.cshtml"
Write(RenderBody());

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n");
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.BodyTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n</html>\r\n");
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