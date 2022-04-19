using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NidasShoes.Service.IService;
using NidasShoes.Service.Model;
using NidasShoes.Service.Model.ViewModel;
using Rotativa.AspNetCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApp.Common;

namespace NidasShoes.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ReceiptController : BaseController
    {
        IReceiptService _ReceiptService;
        IProductService _ProductService;
        IProductSizeService _ProductSizeService;
        IProductColorService _ProductColorService;
        ISupplyService _SupplyService;
        public ReceiptController(IReceiptService ReceiptService
            , IProductService productService
            , IProductSizeService productSizeService
            , ISupplyService supplyService
            , IProductColorService productColorService)
        {
            _ReceiptService = ReceiptService;
            _ProductService = productService;
            _ProductSizeService = productSizeService;
            _SupplyService = supplyService;
            _ProductColorService = productColorService;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _ReceiptService.GetListData(baseParam);
            
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<ReceiptModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _ReceiptService.GetById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<ReceiptModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new ReceiptModel()
                {
                    ID = 0,
                });
            }
            else
            {
                return PartialView(result.Results.FirstOrDefault());
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate(string product, string supply)
        {

            byte[] arr = new byte[0];

            if (HttpContext.Session.TryGetValue("User", out arr))
            {
                var json = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(arr));

                var dataProduct = JsonConvert.DeserializeObject<List<ProductDetailModel>>(product);
                var dataSupply = JsonConvert.DeserializeObject<ReceiptModel>(supply);
                // lấy thằng customerid
                dataSupply.UserID = json.Id;
    
                var resReceipt = await _ReceiptService.AddOrUpdate(dataSupply);
                var resultReceipt = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(resReceipt);
                if (resultReceipt.Results.FirstOrDefault())
                {
                    foreach (var item in dataProduct)
                    {
                        var receiptDetailModel = new ReceiptDetailModel()
                        {
                            ID = 0,
                            ProductDetailID = 0,
                            ImportPrice = item.ImportPrice,
                            ImportQuantity = item.Quantity,
                        };
                        var resProductDetail = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductDetailClientModel>>(await _ProductService.GetProductDetailClient(item.ProductID, item.SizeID, item.ColorID)).Results.FirstOrDefault();
                        if(resProductDetail != null)
                        {
                            receiptDetailModel.ProductDetailID = resProductDetail.ProductDetailID;
                            await _ReceiptService.AddOrUpdateReceiptDetail(receiptDetailModel);

                        }
                        else
                        {
                            //nếu k có sản phẩm detail thì thêm mới ở đây
                            var productDetail = new ProductDetailModel()
                            {
                                ID = 0,
                                ProductID = item.ProductID,
                                ColorID = item.ColorID,
                                SizeID = item.SizeID,
                                Quantity = 0,
                                Image = "",
                                LastUpdated = DateTime.Now
                            };
                            var resAddProductDetail = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(await _ProductService.AddOrUpdateProductDetail(productDetail)).Results.FirstOrDefault();
                            if(resAddProductDetail == true)
                            {
                                await _ReceiptService.AddOrUpdateReceiptDetail(receiptDetailModel);
                            }
                        }
                    }
                return Json(true);
                }
            }
            return Json(false);
        }
        public async Task<IActionResult> Create(ReceiptModel obj)
        {
            BaseParamModel baseParam = new BaseParamModel()
            {
                PageNumber = 1,
                PageSize = 100000000,
                Search = ""
            };
            var response = await _ReceiptService.AddOrUpdate(obj);

            ViewBag.product = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductModel>>(await _ProductService.GetListDataProduct(baseParam));
            ViewBag.productSize = JsonConvert.DeserializeObject<NidasShoesResultModel<SizeModel>>(await _ProductSizeService.GetListData(baseParam));
            ViewBag.productColor = JsonConvert.DeserializeObject<NidasShoesResultModel<ColorModel>>(await _ProductColorService.GetListData(baseParam));
            ViewBag.supply = JsonConvert.DeserializeObject<NidasShoesResultModel<SupplyModel>>(await _SupplyService.GetListData(baseParam));

            return View();
        }




        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _ReceiptService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.First());
        }
        
        public async Task<IActionResult> Detail(int Id)
        {
            ViewBag.dataReceipt = JsonConvert.DeserializeObject<NidasShoesResultModel<ReceiptModel>>(await _ReceiptService.GetById(Id)).Results.FirstOrDefault();
            ViewBag.dataReceiptDetail = JsonConvert.DeserializeObject<NidasShoesResultModel<ReceiptDetailModel>>(await _ReceiptService.GetListDataReceiptDetailByReceiptId(Id));

            return View();
        }
        
        public async Task<IActionResult> DetailPrint(int Id)
        {
             var dataReceipt = JsonConvert.DeserializeObject<NidasShoesResultModel<ReceiptModel>>(await _ReceiptService.GetById(Id)).Results.FirstOrDefault();
            var dataReceiptDetail = JsonConvert.DeserializeObject<NidasShoesResultModel<ReceiptDetailModel>>(await _ReceiptService.GetListDataReceiptDetailByReceiptId(Id)).Results;
            
            
            var data = new ReceiptDetailPrintToPfdViewModel()
            {
                receiptModel = dataReceipt,
                lstReceiptDetailModel = dataReceiptDetail
            };


            return new ViewAsPdf(data);
        }
     
    }
}
