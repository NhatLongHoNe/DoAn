#pragma checksum "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Shared\_LayoutAdmins.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "266dfbf7aac3070ecd962721891f73d45077b091"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Areas_Admin_Views_Shared__LayoutAdmins), @"mvc.1.0.view", @"/Areas/Admin/Views/Shared/_LayoutAdmins.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"266dfbf7aac3070ecd962721891f73d45077b091", @"/Areas/Admin/Views/Shared/_LayoutAdmins.cshtml")]
    #nullable restore
    public class Areas_Admin_Views_Shared__LayoutAdmins : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    #nullable disable
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/Admin/Content/chart.min.js"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("class", new global::Microsoft.AspNetCore.Html.HtmlString("hold-transition sidebar-mini"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.BodyTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("<!DOCTYPE html>\r\n<!--\r\nThis is a starter template page. Use this page to start your new project from\r\nscratch. This page gets rid of all links and provides the needed markup only.\r\n-->\r\n<html lang=\"en\">\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("head", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "266dfbf7aac3070ecd962721891f73d45077b0913927", async() => {
                WriteLiteral(@"
    <meta charset=""utf-8"">
    <meta name=""viewport"" content=""width=device-width, initial-scale=1"">
    <meta http-equiv=""x-ua-compatible"" content=""ie=edge"">
    <title>NIDAS SHOES</title>
    <!--<link rel=""icon"" href=""/Admin/favicon.ico"" type=""image/x-icon"">--> <!-- Favicon-->
    <!-- Font Awesome Icons -->
    <link rel=""stylesheet"" href=""/Admin/Content/plugins/fontawesome-free/css/all.min.css"">
    <!-- Theme style -->
    <link rel=""stylesheet"" href=""/Admin/Content/dist/css/adminlte.min.css"">
    <link href=""/Admin/Content/toastr.min.css"" rel=""stylesheet"" />
    <!-- Google Font: Source Sans Pro -->
");
                WriteLiteral(@"    <link href=""/Admin/Content/admins-style.css"" rel=""stylesheet"" />
    <link href=""/Admin/Content/admins-pagination.css"" rel=""stylesheet"" />
    <script src=""/Admin/Content/plugins/jquery/jquery.min.js""></script>
    <script src=""/Admin/Content/ckeditor/ckeditor.js""></script>
");
                WriteLiteral("    ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("script", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "266dfbf7aac3070ecd962721891f73d45077b0915206", async() => {
                }
                );
                __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                WriteLiteral("\r\n");
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
            WriteLiteral("\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("body", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "266dfbf7aac3070ecd962721891f73d45077b0917009", async() => {
                WriteLiteral("\r\n\r\n");
                WriteLiteral("    <div class=\"wrapper\">\r\n\r\n        <!-- Navbar -->\r\n        <partial name=\"_navBar\" />\r\n        <!-- /.navbar -->\r\n        <!-- Main Sidebar Container -->\r\n        ");
#nullable restore
#line 47 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Shared\_LayoutAdmins.cshtml"
   Write(await Html.PartialAsync("_asideBar"));

#line default
#line hidden
#nullable disable
                WriteLiteral(@"

        <!-- Content Wrapper. Contains page content -->
        <div class=""content-wrapper"">
            <!-- Content Header (Page header) -->
            <div class=""content-header"">
                <div class=""container-fluid pt-2 pb-2 pl-3 pr-3"">
                    <div class=""row mb-2"">
                        <div class=""col-sm-6"">
                            <h1 class=""m-0 text-dark"">");
#nullable restore
#line 56 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Shared\_LayoutAdmins.cshtml"
                                                 Write(ViewBag.Title);

#line default
#line hidden
#nullable disable
                WriteLiteral(@"</h1>
                        </div><!-- /.col -->
                        <div class=""col-sm-6"">
                            <ol class=""breadcrumb float-sm-right"">
                                <li class=""breadcrumb-item"">
                                    <a href=""/Admin""><i class=""fas fa-home""></i></a>
                                </li>
                                <li class=""breadcrumb-item active"">
                                    <a");
                BeginWriteAttribute("href", " href=\"", 2826, "\"", 2850, 1);
#nullable restore
#line 64 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Shared\_LayoutAdmins.cshtml"
WriteAttributeValue("", 2833, ViewBag.url_back, 2833, 17, false);

#line default
#line hidden
#nullable disable
                EndWriteAttribute();
                WriteLiteral(">");
#nullable restore
#line 64 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Shared\_LayoutAdmins.cshtml"
                                                           Write(ViewBag.Title_back);

#line default
#line hidden
#nullable disable
                WriteLiteral(@"</a>
                                </li>
                            </ol>
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->
            <!-- Main content -->
            <div class=""content"">
                ");
#nullable restore
#line 74 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Shared\_LayoutAdmins.cshtml"
           Write(RenderBody());

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n            </div>\r\n            <!-- /.content -->\r\n        </div>\r\n        <!-- /.content-wrapper -->\r\n        <!-- Control Sidebar -->\r\n        ");
#nullable restore
#line 80 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Shared\_LayoutAdmins.cshtml"
   Write(await Html.PartialAsync("_asideBarUser"));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n        <!-- /.control-sidebar -->\r\n        <!-- Main Footer -->\r\n        ");
#nullable restore
#line 83 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Shared\_LayoutAdmins.cshtml"
   Write(await Html.PartialAsync("_mainFooter"));

#line default
#line hidden
#nullable disable
                WriteLiteral(@"
    </div>
    <!-- ./wrapper -->
    <!-- REQUIRED SCRIPTS -->
    <!-- jQuery -->
    <script src=""/Admin/Content/plugins/jquery/jquery.min.js""></script>
    <!-- Bootstrap 4 -->
    <script src=""/Admin/Content/plugins/bootstrap/js/bootstrap.bundle.min.js""></script>
    <!-- AdminLTE App -->
    <script src=""/Admin/Content/dist/js/adminlte.min.js""></script>
    <script src=""/Admin/Scripts/sweetalert.min.js""></script>
    <script src=""/Admin/Scripts/toastr.js""></script>
    <script src=""/Admin/Content/js/AdminCommon.js""></script>

    <script src=""/Admin/Content/js/Controller/OrderScript.js""></script>

    <script>
        $(document).ready(function () {
            $('nav .nav-item a').each(function () {
                $(this).removeClass('active');
                if (this.href.trim() == window.location) {
                    $(this).parent().parent().parent('li').addClass('menu-open');
                    $(this).parent('li').addClass('menu-open');
                    $(this).addC");
                WriteLiteral("lass(\'active\');\r\n                } else {\r\n                    $(this).parent(\'li\').removeClass(\'menu-open\');\r\n                }\r\n            });\r\n        });\r\n    </script>\r\n    ");
#nullable restore
#line 113 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\Shared\_LayoutAdmins.cshtml"
Write(RenderSection("scripts", required: false));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n");
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.BodyTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
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
