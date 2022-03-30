using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NidasShoes.Common;
using NidasShoes.Service.IService;
using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Controllers
{
    public class CartController : Controller
    {
        private readonly IProductService _productService;
        private readonly IOrderService _orderService;
        private readonly IDiscountService _discountService;
        public CartController(IProductService productService
           , IOrderService orderService
            , IDiscountService discountService)
        {
            _productService = productService;
            _orderService = orderService;
            _discountService = discountService;
        }

        public IActionResult Index()
        {
          
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Add(int productDetailID)
        {
            byte[] arrCart = new byte[0];
            var productDetail = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductDetailClientModel>>(await _productService.GetProductDetailClientByProductDetailId(productDetailID)).Results.FirstOrDefault();
            var cart = new List<CartViewModel>();
            if (productDetail.Quantity == 0)
            {
                return Json(new
                {
                    status = false,
                    message = "Sản phẩm này hiện đang hết hàng"
                });
            }
            if (HttpContext.Session.TryGetValue("SessionCart", out arrCart))
            {
                cart = JsonConvert.DeserializeObject<List<CartViewModel>>(Encoding.UTF8.GetString(arrCart));
                //var productDetail = _productService
                if (cart.Any(x => x.ProductDetailID == productDetailID))
                {
                    foreach (var item in cart)
                    {
                        if (item.ProductDetailID == productDetailID)
                        {
                            item.Quantity += 1;
                        }
                    }
                }
                else
                {
                    CartViewModel newItem = new CartViewModel();
                    newItem.ProductDetailID = productDetailID;
                    newItem.Product = productDetail;
                    newItem.Quantity = 1;
                    cart.Add(newItem);
                }
            }
            else
            {
                CartViewModel newItem = new CartViewModel();
                newItem.ProductDetailID = productDetailID;
                newItem.Product = productDetail;
                newItem.Quantity = 1;
                cart.Add(newItem);
            }
            HttpContext.Session.Set("SessionCart", Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(cart)));
            return Json(new
            {
                status = true
            }); ;
        }
        public IActionResult GetAll()
        {
            byte[] arrCart = new byte[0];
            var cart = new List<CartViewModel>();
            if (HttpContext.Session.TryGetValue("SessionCart", out arrCart))
            {
                cart = JsonConvert.DeserializeObject<List<CartViewModel>>(Encoding.UTF8.GetString(arrCart));
            }
            return Json(new
            {
                data = cart,
                status = true
            });
        }
        [HttpPost]
        public IActionResult Update(string cartData)
        {
            var cartViewModel = JsonConvert.DeserializeObject<List<CartViewModel>>(cartData);

            byte[] arrCart = new byte[0];
            var cartSession = new List<CartViewModel>();
            if (HttpContext.Session.TryGetValue("SessionCart", out arrCart))
            {
                cartSession = JsonConvert.DeserializeObject<List<CartViewModel>>(Encoding.UTF8.GetString(arrCart));
                foreach (var item in cartSession)
                {
                    foreach (var jitem in cartViewModel)
                    {
                        if (item.ProductDetailID == jitem.ProductDetailID)
                        {
                            item.Quantity = jitem.Quantity;
                        }
                    }
                }
            }
            HttpContext.Session.Set("SessionCart", Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(cartSession)));

            return Json(new
            {
                status = true
            });
        }

        [HttpPost]
        public IActionResult DeleteItem(int productDetailID)
        {

            byte[] arrCart = new byte[0];
            var cartSession = new List<CartViewModel>();
            if (HttpContext.Session.TryGetValue("SessionCart", out arrCart))
            {
                cartSession = JsonConvert.DeserializeObject<List<CartViewModel>>(Encoding.UTF8.GetString(arrCart));
                cartSession.RemoveAll(x => x.ProductDetailID == productDetailID);
                HttpContext.Session.Set("SessionCart", Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(cartSession)));
                return Json(new
                {
                    status = true
                });
            }
            return Json(new
            {
                status = false
            });
        }

        public IActionResult CheckOut()
        {
            byte[] arrUser = new byte[0];
            byte[] arrCart = new byte[0];
            byte[] arrDiscount = new byte[0];
            var checkUser = false;
            if (HttpContext.Session.TryGetValue("User_Client", out arrUser))
            {
                var userSession = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(arrUser));
                checkUser = true;
            }
            ViewBag.CheckUser = checkUser;
            var cartSession = new List<CartViewModel>();
            if (HttpContext.Session.TryGetValue("SessionCart", out arrCart))
            {
                cartSession = JsonConvert.DeserializeObject<List<CartViewModel>>(Encoding.UTF8.GetString(arrCart));
                if (HttpContext.Session.TryGetValue("SessionDiscout", out arrDiscount))
                {
                    var discoutSession = JsonConvert.DeserializeObject<DiscountModel>(Encoding.UTF8.GetString(arrDiscount));
                    ViewBag.discoutSession = discoutSession;
                }
                return View(cartSession);
            }
            else
            {
                return Redirect("/Cart");
            }
            
        }
        [HttpPost]
        public async Task<IActionResult> SaveDiscoutSession(int discountId)
        {
            var discountSession = JsonConvert.DeserializeObject<NidasShoesResultModel<DiscountModel>>(await _discountService.GetById(discountId)).Results.FirstOrDefault();
            
            HttpContext.Session.Set("SessionDiscout", Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(discountSession)));

            return Json(new
            {
                status = true
            });
        }
        [HttpPost]
        public IActionResult DeleteAll()
        {
            var cartSession = new List<CartViewModel>();
            HttpContext.Session.Set("SessionCart", Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(cartSession)));

            return Json(new
            {
                status = true
            });
        }
        public IActionResult OrderComplete()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> CreateOrder(string orderViewModel)
        {
            var order = JsonConvert.DeserializeObject<OrderModel>(orderViewModel);

            if (string.IsNullOrEmpty(order.CustomerName))
            {
                return Json(new
                {
                    status = false
                });
            }
            //user session
            byte[] arrUser = new byte[0];
            if (HttpContext.Session.TryGetValue("User_Client", out arrUser))
            {
                var userSession = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(arrUser));
                order.CustomerID = userSession.Id;
            }
            //discount session
            byte[] arrDiscount = new byte[0];
            if (HttpContext.Session.TryGetValue("SessionDiscout", out arrDiscount))
            {
                var discountSession = JsonConvert.DeserializeObject<DiscountModel>(Encoding.UTF8.GetString(arrDiscount));
                order.DiscountID = discountSession.ID;
            }
            //cart session
            byte[] arrCart = new byte[0];
            var cartSession = new List<CartViewModel>();
            if (HttpContext.Session.TryGetValue("SessionCart", out arrCart))
            {
                cartSession = JsonConvert.DeserializeObject<List<CartViewModel>>(Encoding.UTF8.GetString(arrCart));
                List<OrderDetailModel> orderDetails = new List<OrderDetailModel>();
                foreach (var item in cartSession)
                {
                    var detail = new OrderDetailModel();
                    detail.ProductDetailID = item.ProductDetailID;
                    detail.Quantity = item.Quantity;
                    detail.Price = item.Product.ExportPrice;
                    orderDetails.Add(detail);
                }
                order.OrderDetails = orderDetails;
            }
            
            var res = JsonConvert.DeserializeObject<NidasShoesResultModel<OrderModel>>(await _orderService.AddOrUpdate(order));
            if (res.Results.Count() == 0)
            {
                //reset discout
                var discountSession = new DiscountModel();
                HttpContext.Session.Set("SessionDiscout", Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(discountSession)));

                return Json(new
                {
                    status = true
                });
            }
            return Json(new
            {
                status = false
            });
        }
        [HttpPost]
        public async Task<IActionResult> CheckDiscount(string code)
        {
            BaseParamModel model = new BaseParamModel()
            {
                PageNumber = 1,
                PageSize =  1000000000,
                Search = ""
            };
            byte[] arrCart = new byte[0];
            var cartSession = new List<CartViewModel>();
            if (HttpContext.Session.TryGetValue("SessionCart", out arrCart))
            {
                //cartSession = JsonConvert.DeserializeObject<List<CartViewModel>>(Encoding.UTF8.GetString(arrCart));

                var listDiscount = JsonConvert.DeserializeObject<NidasShoesResultModel<DiscountModel>>(await _discountService.GetListData(model)).Results;

                var isDataDiscout = listDiscount.Find(x=>x.Code == code);
                if(isDataDiscout != null)
                {
                    if (isDataDiscout.StartDate <= DateTime.Now && isDataDiscout.EndDate >= DateTime.Now)
                    {
                        //foreach (var jitem in cartSession)
                        //{
                        //    jitem.DiscoutID = isDataDiscout.ID;
                        //    jitem.Rate = isDataDiscout.Rate;
                        //}
                        //HttpContext.Session.Set("SessionCart", Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(cartSession)));
                        return Json(new
                        {
                            status = 1,
                            id = isDataDiscout.ID,
                            rate = isDataDiscout.Rate
                        });
                    }
                    return Json(new
                    {
                        status = 2
                    });
                }
              
                return Json(new
                {
                    status = 0
                });
            }
            return Json(new
            {
                status = -1
            });
        }
    }
}
