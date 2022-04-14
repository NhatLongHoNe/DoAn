
var productSearching = {
    init: function () {
        productSearching.loadData();
        productSearching.registerEvent();
    },
    registerEvent: function () {
        let productCategoryID = $("#productID").val() == null ? $("#productID").val() : 0;
        let sizeID = 0;
        let colorID = 0;
        $("#productSize").children("li").click(function () {
            if ($(this).children("span").hasClass("active")) {
                $(this).children("span").removeClass("active");
                sizeID = 0;
            } else {
                $("#productSize").children("li").children("span").removeClass("active");
                $(this).children("span").addClass("active");
                sizeID = $(this).data("id");
            }
            console.log($(this).data("id"));
            productSearching.loadData(sizeID, colorID, productCategoryID);

        })
        $("#productColor").children("li").click(function () {

            if ($(this).children("span").hasClass("active")) {
                $(this).children("span").removeClass("active");
                colorID = 0;
            } else {
                $("#productColor").children("li").children("span").removeClass("active");
                $(this).children("span").addClass("active");
                colorID = $(this).data("id");
            }
            console.log($(this).data("id"));
            productSearching.loadData(sizeID, colorID, productCategoryID);
        })
        $("#productCategory").children("li").click(function (e) {
            e.preventDefault();
            if ($(this).children("span").hasClass("active")) {
                $(this).children("span").removeClass("active");
                productCategoryID = 0;
            } else {
                $("#productCategory").children("li").children("span").removeClass("active");
                $(this).children("span").addClass("active");
                productCategoryID = $(this).data("id");
            }
            console.log($(this).data("id"));
            productSearching.loadData(sizeID, colorID, productCategoryID);
        })
      
    },
    loadData: function (sizeID, colorID, productCategoryID) {
        $.ajax({
            url: '/Product/ProductSearch',
            type: 'Get',
            dataType: 'json',
            data: {
                productCategoryID: productCategoryID,
                sizeID: sizeID,
                colorID: colorID
            },
            success: function (res) {
                if (res.status) {
                    var template = $('#tplProductSearch').html();
                    var html = '';
                    var data = res.data.results;
                    console.log(data);
                    $.each(data, function (i, item) {
                        if (item.exportPrice!=0) {
                            html += Mustache.render(template, {
                                Id: item.id,
                                Name: item.name,
                                Price: numeral(item.exportPrice).format('0,0'),
                                Image: item.image
                            });
                        }
                        
                    });

                    $('#productSearchBody').html(html);

                }
            }
        })
    },
   
}
productSearching.init();
