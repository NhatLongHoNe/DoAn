
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
            if (data.image != null) {
                $("#imgDetail").attr("src", data.image);
            }
            if (data.exportPrice != null) {
                $("#peoductPrice").html("" + data.exportPrice.toLocaleString('it-IT', { style: 'currency', currency: 'VND' }) +"");
            }
            

            //var owl = $('.owl-carousel');
            //owl.owlCarousel({
               
            //});
            //var $owl = $('.owl-carousel').owlCarousel({
            //    items: 1,
            //    loop: true
            //});
            $(".owl-item:nth-child(4)").addClass("active ");
            $('.owl-carousel').trigger('to.owl.carousel', 4);
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

