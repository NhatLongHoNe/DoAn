#pragma checksum "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\Order\_AddOrEdit.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "f108a2290b06a0a05db62ce7abfc449b7f638491"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Areas_Admin_Views_Order__AddOrEdit), @"mvc.1.0.view", @"/Areas/Admin/Views/Order/_AddOrEdit.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"f108a2290b06a0a05db62ce7abfc449b7f638491", @"/Areas/Admin/Views/Order/_AddOrEdit.cshtml")]
    public class Areas_Admin_Views_Order__AddOrEdit : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<NidasShoes.Service.Model.OrderModel>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral(@"<div class=""collapse border show objInfor"">
    <form class=""form-input"">
        <div class=""alert-danger mb-3 admins-h2 btn-red"">
            THÔNG TIN DANH MỤC NHÀ CUNG CÁP
        </div>
        <div class=""form-group mb-3"" hidden>
            <input type=""number"" name=""Id"" class=""form-control"" id=""Id""");
            BeginWriteAttribute("value", " value=\"", 357, "\"", 374, 1);
#nullable restore
#line 8 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\Order\_AddOrEdit.cshtml"
WriteAttributeValue("", 365, Model.ID, 365, 9, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">\r\n        </div>\r\n\r\n        <div class=\"form-group mb-3\">\r\n            <label class=\"font-weight-bold mb-1\">Nhà Cung Cấp</label>\r\n            <input type=\"text\" name=\"Name\" class=\"form-control validation\" id=\"Name\"");
            BeginWriteAttribute("value", " value=\"", 590, "\"", 598, 0);
            EndWriteAttribute();
            WriteLiteral(@">
            <div class=""text-danger""></div>
        </div>
          
          <div class=""form-group mb-3"">
            <label class=""font-weight-bold mb-1"">Mô tả</label>
            <input type=""text"" name=""Description"" class=""form-control "" id=""Description""");
            BeginWriteAttribute("value", " value=\"", 868, "\"", 894, 1);
#nullable restore
#line 19 "C:\Users\NHAT-PC\Desktop\DoAn\NidasShoes\Areas\Admin\Views\Order\_AddOrEdit.cshtml"
WriteAttributeValue("", 876, Model.Description, 876, 18, false);

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
                <button type=""button"" class=""btn btn-green btnSave"" data-id=""0"" onclick=""AddOrUpdate('/')""> <i class=""far fa-save""></i> Ghi lại</button>
            </div>
        </div>
    </form>
</div>
");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<NidasShoes.Service.Model.OrderModel> Html { get; private set; }
    }
}
#pragma warning restore 1591
