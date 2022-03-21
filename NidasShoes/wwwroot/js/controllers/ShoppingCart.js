
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
            console.log("aaaaaaaaa",productDetailID);
            if (productDetailID == 0) {
                alert('sản phẩm này đã hết hàng');
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
            $('#lblTotalOrder').text(numeral(cart.getTotalOrder()).format('0,0'));
        });
        $('#btnContinue').off('click').on('click', function (e) {
            e.preventDefault();
            window.location.href = "/product";
        });
        $('#btnDeleteAll').off('click').on('click', function (e) {
            e.preventDefault();
            cart.deleteAll();
        });
        $('#btnCheckout').off('click').on('click', function (e) {
            e.preventDefault();
            $('#divCheckout').show();
        });
    },
    getTotalOrder: function () {
        var listTextBox = $('.txtQuantity');
        var total = 0;
        $.each(listTextBox, function (i, item) {
            total += parseInt($(item).val()) * parseFloat($(item).data('price'));
        });
        return total;
    },
    addItem: function (Id) {
        $.ajax({
            url: '/Cart/Add',
            type: 'POST',
            data: {
                productDetailID : Id
            },
            dataType: 'json',
            success: function (res) {
                if (res.status) {
                    cart.registerEvent();
                    alert('thanh cong');
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
                    $('#lblTotalOrder').text(numeral(cart.getTotalOrder()).format('0,0'));
                    cart.registerEvent();
                }
            }
        })
    }
}
cart.init();
