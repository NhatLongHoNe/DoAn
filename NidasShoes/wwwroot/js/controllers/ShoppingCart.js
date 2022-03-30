
var cart = {
    init: function () {
        cart.loadData();
        cart.registerEvent();
    },
    registerEvent: function () {
        $('#btnAddToCart').off('click').on('click', function (e) {
            //xoa dieu huong mac dinh cua the a
            e.preventDefault();

            var productDetailID = eval($(this).attr("data-id"));
            console.log("aaaaaaaaa", productDetailID);
            if (productDetailID == 0) {
                toastr["warning"]("sản phẩm này đã hết hàng");
                return 0;
            }
            if (productDetailID) {
                cart.addItem(productDetailID);
            }
        });
        $('.btnDeleteItem').off('click').on('click', function (e) {
            //xoa dieu huong mac dinh cua the a
            e.preventDefault();

            var productDetailID = eval($(this).data('id'));
            if (productDetailID) {
                cart.deleteItem(productDetailID);
            }
        });
        $('.txtQuantity').change(function () {
            var quantity = eval($(this).val());
            var productDetailID = eval($(this).attr("data-id"));
            var price = eval($(this).attr("data-price"));

            if (isNaN(quantity) == false) {

                var amount = quantity * price;

                $('#amount_' + productDetailID).text(numeral(amount).format('0,0'));
            }
            else {
                $('#amount_' + productDetailID).text(0);
            }
            $('.lblPriceOrder').text(numeral(cart.getTotalOrder()).format('0,0'));
            var rateDiscount = eval($('.lblDiscount').attr("data-discount"));
            if (rateDiscount > 0);
            $('.lblTotalOrder').text(numeral(cart.getTotalOrder() * ((100 - rateDiscount) / 100)).format('0,0'));
            cart.updateAll();

        });
        $('#btnContinue').off('click').on('click', function (e) {
            e.preventDefault();
            window.location.href = "/product";
        });
        $('#btnDeleteAll').off('click').on('click', function (e) {
            e.preventDefault();
            cart.deleteAll();
            toastr["success"]("Xóa giỏ hàng thành công")
        });
        $('#btnCheckout').off('click').on('click', function (e) {
            e.preventDefault();
            var discountId = eval($('.lblDiscount').attr("data-discountId"));
            cart.gotoCheckOut(discountId);
            
        });
        $('#chkUserLogInfo').off('click').on('click', function (e) {
            if ($(this).prop('checked')) {
                cart.getLoginUser();
            } else {
                $('#txtName').val('');
                $('#txtAddress').val('');
                $('#txtEmail').val('');
                $('#txtPhone').val('');
            }
        });
        $('#btnCreateOrder').off('click').on('click', function (e) {
            e.preventDefault();
            if (cart.ValidationInput()) {
                cart.createOrder();
            }
        });
        $('#btnDiscount').off('click').on('click', function (e) {
            e.preventDefault();
            var txtDiscount = $('#txtDiscount').val();
            if (txtDiscount) {
                cart.addCodeDiscount(txtDiscount);
            } else {
                toastr["warning"]("bạn cần nhập mã giảm giá");
                return 0;
            }
        });
    },
    gotoCheckOut: function (discountId) {
        $.ajax({
            url: '/Cart/SaveDiscoutSession',
            type: 'post',
            data: {
                discountId: discountId
            },
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                  
                    window.location.href = "/cart/checkout";
                }
            }
        })
        window.location.href = "/cart/checkout";
    },
    getTotalOrder: function () {
        var listTextBox = $('.txtQuantity');
        var total = 0;
        $.each(listTextBox, function (i, item) {
            total += parseInt($(item).val()) * parseFloat($(item).data('price'));
        });
        return total;
    },
    getLoginUser: function () {
        $.ajax({
            url: '/Login/GetUser',
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var user = response.data;
                    $('#txtName').val(user.name);
                    $('#txtAddress').val(user.address);
                    $('#txtEmail').val(user.email);
                    $('#txtPhone').val(user.phoneNumber);
                }
            }
        })
    },
    addCodeDiscount: function (code) {
        $.ajax({
            url: '/Cart/CheckDiscount',
            type: 'POST',
            dataType: 'json',
            data: {
                code : code
            },
            success: function (response) {
                console.log(response);
                if (response.status == 0) {
                    toastr["warning"]("mã này không tồn tại");
                }
                if (response.status == 1) {
                    toastr["success"]("áp dụng mã thành công");
                    $('.lblDiscount').text(response.rate + "%");
                    $('.lblDiscount').attr('data-discount', response.rate);
                    $('.lblDiscount').attr('data-discountId', response.id);

                    $('.lblPriceOrder').text(numeral(cart.getTotalOrder()).format('0,0'));
                    var rateDiscount = eval($('.lblDiscount').attr("data-discount"));
                    if (rateDiscount > 0);
                    $('.lblTotalOrder').text(numeral(cart.getTotalOrder() * ((100 - rateDiscount) / 100)).format('0,0'));
                }
                if (response.status == 2) {
                    toastr["warning"]("mã này đã hết hạn sử dụng");
                }
                if (response.status == -1)  {
                    toastr["error"]("Lỗi");
                }
            }
        })
    },
    createOrder: function () {
        var order = {
            CustomerName: $('#txtName').val(),
            CustomerAddress: $('#txtAddress').val(),
            CustomerEmail: $('#txtEmail').val(),
            CustomerMobile: $('#txtPhone').val(),
            Note: $('#txtMessage').val(),
            PaymentID: $('input[name="paymentMethod"]:checked').val(),
            OrderStatusID: 1
            //BankCode: $('input[groupname="bankcode"]:checked').prop('id'),
        }
        // điều kiện nếu thanh toán kiểu khác

        // check null or empty
        //for (const [key, value] of Object.entries(order)) {
        //    console.log(key, value);
            
        //}
        //return 0;
        $.ajax({
            url: '/Cart/CreateOrder',
            type: 'POST',
            dataType: 'json',
            data: {
                orderViewModel: JSON.stringify(order)
            },
            success: function (response) {
                console.log(response);
                if (response.status) {
                    toastr["info"]("Chờ xử lý");
                    cart.deleteAll();
                    setTimeout(function () {
                        window.location.href = "/cart/ordercomplete";
                    }, 2000);
                    //if (response.urlCheckout != undefined && response.urlCheckout != '') {

                    //    window.location.href = response.urlCheckout;
                    //}
                    //else {
                    //    console.log('create order ok');
                    //    $('#divCheckout').hide();
                    //    cart.deleteAll();
                    //    setTimeout(function () {
                    //        $('#cartContent').html('Cảm ơn bạn đã đặt hàng thành công. Chúng tôi sẽ liên hệ sớm nhất.');
                    //    }, 2000);
                    //}
                }
                else {
                    toastr["error"]("Thanh toán thất bại");

                    //$('#divMessage').show();
                    //$('#divMessage').text(response.message);
                }
            }
        })
    },
    addItem: function (Id) {
        $.ajax({
            url: '/Cart/Add',
            type: 'POST',
            data: {
                productDetailID: Id
            },
            dataType: 'json',
            success: function (res) {
                if (res.status) {
                    cart.registerEvent();
                    cart.loadData();
                    toastr["success"]("Thêm sản phẩm vào giỏ hàng thành công")
                }
            }
        })
    },
    deleteItem: function (Id) {
        $.ajax({
            url: '/Cart/DeleteItem',
            type: 'POST',
            data: {
                productDetailID: Id
            },
            dataType: 'json',
            success: function (res) {
                if (res.status) {
                    cart.loadData();
                    toastr["success"]("Xóa sản phẩm thành công")
                }
            }
        })
    },
    deleteAll: function () {
        $.ajax({
            url: '/Cart/DeleteAll',
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    cart.loadData();
                }
            }
        });
    },
    updateAll: function () {
        var cartList = [];
        $.each($('.txtQuantity'), function (i, item) {
            cartList.push({
                ProductDetailId: $(item).data('id'),
                Quantity: $(item).val()
            });
        });
        $.ajax({
            url: '/Cart/Update',
            type: 'POST',
            data: {
                cartData: JSON.stringify(cartList)
            },
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    cart.loadData();
                    console.log('Update ok');
                }
            }
        });
    },
    loadData: function () {
        $.ajax({
            url: '/Cart/GetAll',
            type: 'Get',
            dataType: 'json',
            success: function (res) {
                console.log(res);
                if (res.status) {
                    var template = $('#tplCart').html();
                    var html = '';
                    var data = res.data;
                    var CountCard = res.data.length;
                    $('.countCard').text(CountCard);
                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            ProductDetailId: item.productDetailID,
                            ProductName: item.product.name,
                            Color: item.product.nameColor,
                            Size: item.product.nameSize,
                            Image: item.product.image,
                            Quantity: item.quantity,
                            Price: item.product.exportPrice,
                            PriceF: numeral(item.product.exportPrice).format('0,0'),
                            Amount: numeral(item.quantity * item.product.exportPrice).format('0,0')
                        });
                    });

                    $('#cartBody').html(html);
                    if (html == '') {
                        $('#cartContent').html('<h3 class="text-center">Không có sản phẩm nào trong giỏ hàng.</h3>');
                    }
                    $('.lblPriceOrder').text(numeral(cart.getTotalOrder()).format('0,0'));
                    var rateDiscount = eval($('.lblDiscount').attr("data-discount"));
                    if (rateDiscount>0);
                    $('.lblTotalOrder').text(numeral(cart.getTotalOrder() * ((100-rateDiscount)/100)).format('0,0'));
                    cart.registerEvent();
                }
            }
        })
    },
    ValidationInput: function () {
        let check = true;
        $('.text-danger').html('');
        $('.text-danger').css('display', 'none')
        $('.form-input input').each(function () {
            if ($(this).hasClass('validation')) {
                let val = $(this).val();
                if (val == '') {
                    let label = $(this).parent().siblings('label').text();
                    $(this).siblings('.text-danger').append(label + ' không được để trống');
                    check = false;
                }
                else if ($(this).prop('type') == 'email') {
                    if (!validateEmail(val)) {
                        let label = $(this).parent().siblings('label').text();
                        $(this).siblings('.text-danger').append(label + ' không đúng định dạng');
                        check = false;
                    }
                }
                else if ($(this).attr('name').includes('Phone')) {
                    if (val.length < 10 || val.length > 11) {
                        let label = $(this).parent().siblings('label').text();
                        $(this).siblings('.text-danger').append(label + ' không đúng định dạng');
                        check = false;
                    }
                }
            }
        })
        $('.form-input select').each(function () {
            if ($(this).hasClass('validation')) {
                let val = $(this).val();
                if (val == 0) {
                    let label = $(this).parent().siblings('label').text();
                    $(this).siblings('.text-danger').append(label + ' không được để trống');
                    check = false;
                }
            }
        })

        $('.form-input textarea').each(function () {
            if ($(this).hasClass('validation')) {
                let val = $(this).val();
                if ($(this).hasClass('ckeditor') || $(this).hasClass('p-ckeditor')) {
                    val = CKEDITOR.instances[$(this).attr('id')].getData();
                }
                if (val == '') {
                    let label = $(this).parent().siblings('label').text();
                    $(this).siblings('.text-danger').append(label + ' không được để trống');
                    check = false;
                }
            }
        })
        if (!check)
            $('.text-danger').css('display', 'inline-block')
        return check;
    }
}
cart.init();
