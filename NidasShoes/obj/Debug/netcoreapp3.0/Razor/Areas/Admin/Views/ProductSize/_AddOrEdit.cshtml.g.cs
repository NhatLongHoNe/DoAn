#pragma checksum "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\ProductSize\_AddOrEdit.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "723a35981f7374a1354e24844e935026349767e2"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Areas_Admin_Views_ProductSize__AddOrEdit), @"mvc.1.0.view", @"/Areas/Admin/Views/ProductSize/_AddOrEdit.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"723a35981f7374a1354e24844e935026349767e2", @"/Areas/Admin/Views/ProductSize/_AddOrEdit.cshtml")]
    #nullable restore
    public class Areas_Admin_Views_ProductSize__AddOrEdit : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<NidasShoes.Service.Model.SizeModel>
    #nullable disable
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral(@"<div class=""collapse border show objInfor"">
    <form class=""form-input"">
        <div class=""alert-danger mb-3 admins-h2 btn-red"">
            THÔNG TIN SIZE
        </div>
        <div class=""form-group mb-3"" hidden>
            <input type=""number"" name=""Id"" class=""form-control"" id=""Id""");
            BeginWriteAttribute("value", " value=\"", 339, "\"", 356, 1);
#nullable restore
#line 8 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\ProductSize\_AddOrEdit.cshtml"
WriteAttributeValue("", 347, Model.ID, 347, 9, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">\r\n        </div>\r\n\r\n        <div class=\"form-group mb-3\">\r\n            <label class=\"font-weight-bold mb-1\">Size</label>\r\n            <input type=\"text\" name=\"Name\" class=\"form-control validation\" id=\"Name\"");
            BeginWriteAttribute("value", " value=\"", 564, "\"", 583, 1);
#nullable restore
#line 13 "C:\Users\Admin\Desktop\doan\NidasShoes\Areas\Admin\Views\ProductSize\_AddOrEdit.cshtml"
WriteAttributeValue("", 572, Model.Name, 572, 11, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(@">
            <div class=""text-danger""></div>
        </div>
        <div class=""row"">
            <div class=""col-md-12 text-right mr-0 pr-0 mt-1 mb-0 modal-footer"">
                <button type=""button"" class=""btn btn btn-red btnCancel"" onclick=""RefreshForm()""><i class=""fas fa-reply-all""></i> Nhập lại</button>
                <button type=""button"" class=""btn btn-green btnSave"" data-id=""0"" onclick=""AddOrUpdate('/Admin/ProductSize/AddOrUpdate')""> <i class=""far fa-save""></i> Ghi lại</button>
            </div>
        </div>
    </form>
</div>
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<NidasShoes.Service.Model.SizeModel> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591
