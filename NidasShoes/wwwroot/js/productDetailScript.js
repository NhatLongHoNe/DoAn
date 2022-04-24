
let productID = $("#productID").val();
let sizeID = 0;
let colorID = 0;
$("#productSize").children("li").click(function () {
    $("#productSize").children("li").children("span").removeClass("active");
    $(this).children("span").addClass("active");
    sizeID = $(this).data("id");
    console.log($(this).data("id"));
    GetProductDetailBy();
    
})
$("#productColor").children("li").click(function () {
    $("#productColor").children("li").children("span").removeClass("active");
    $(this).children("span").addClass("active");
    colorID = $(this).data("id");
    console.log($(this).data("id"));
    GetProductDetailBy()
})

function GetProductDetailBy() {
    $.ajax({
        url: '/Product/AjaxDetail',
        type: 'get',
        dataType: 'html',
        data: {
            id: productID,
            sizeID: sizeID,
            colorID: colorID
        },
        beforeSend: function () {
        },
        success: function (res) {
            let data = JSON.parse(res);
            console.log(data);
            if (data != null) {
                if (data.image != null) {
                    $("#imgDetail").attr("src", data.image);
                    //console.log($(".slick-detail-product").children(".active").children(".img-fluid").attr("src"));
                    //$(".slick-detail-product").children(".active").children('img').attr("src", data.image);
                }
                if (data.exportPrice != null) {
                    $("#peoductPrice").html("" + numeral(data.exportPrice).format('0,0') + "");
                }
                console.log("data.productDetailID", data.productDetailID);
                if (data.productDetailID != null) {
                    $('#btnAddToCart').attr("data-id", data.productDetailID);
                }
                if (data.quantity != null) {
                    $('#txtQuantityProduct').text("Số lượng: " + data.quantity);
                    $('#txtQuantityProduct').attr("data-id", data.quantity);

                }
            } else {
                $('#btnAddToCart').attr("data-id", 0);
            }
        },
        error: function (error) {
            console.log(error);
        },
    })
};
//var owl = $('.owl-carousel');
//owl.owlCarousel({
//    animateOut: 'fadeOut',
//    animateIn: 'fadeIn',
//    autoplay: false,
//    autoplayHoverPause: true,
//    loop: true,
//    margin: 0,
//    nav: false,
//    dots: true,
//    autoHeight: false,
//    items: 1,
//    navText: [
//        "<i class='icon-chevron-left owl-direction'></i>",
//        "<i class='icon-chevron-right owl-direction'></i>"
//    ]
//});

