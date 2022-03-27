
//let ul1 = document.getElementById("ulist");
//let ul_items = document.querySelectorAll("#ulist li");
//let head = document.getElementById("head");


//let count = 1;
//btn.addEventListener("click", function () {
//    ul1.innerHTML += ' <div class="row"><div class="col"> <select class="form-control js-example-basic-single"><option class="" selected>Chọn sản phẩm</option><option value="AL">Alabama</option><option value="WY">Wyoming</option></select></div><div class="col"><select class="form-control js-example-basic-single"><option class="" selected>Chọn size</option><option value="AL">Alabama</option><option value="WY">Wyoming</option></select></div> <div class="col"><select class="form-control js-example-basic-single"><option class="" selected>Chọn màu</option><option value="AL">Alabama</option><option value="WY">Wyoming</option></select></div><div class="col"><input type="text" class="form-control" placeholder="số lượng"></div><div class="col"><input type="text" class="form-control" placeholder="Giá nhập"></div></div>';
//    count = count + 1;
//})

var html = $(".productdetail-item").html();
var receipt = {
    init: function () {
        receipt.registerEvent();
    },
    registerEvent: function () {
        $(".select-data-product").select2({});

        $(".select-data-size").select2({ });

        $(".select-data-color").select2();
        $(".select-data-supply").select2({});
        $("#btn-add").click(function () {
            $("#ulist").append(html);
            $(".remove-item-child").click(function () {
                $(this).parent(".pd-item-child").html('');
            })
            $(".select-data-product").select2({});

            $(".select-data-size").select2({});

            $(".select-data-color").select2 ();

        });
        $(".remove-item-child").click(function () {
            $(this).parent(".pd-item-child").html('');
            receipt.registerEvent();
        })
        $(".btnSaveReceipt").click(function () {
            $(".select-data-product").select2().find(":selected").data("productid");
            let arr = [];
            // Khởi tạo
            var item = {
                ProductId: 0,
                SizeId: 0,
                ColorId: 0,
                Quantity: 0,
                ImportPrice:0.0
            };
            var supply = {
                SupplyId : 0,
                Note : ""
            }
            $(".pd-item-child").each(function (index, iteme) {
                item.ProductId = $(iteme).find(".select-data-product").select2().find(":selected").data("productid");
                item.SizeId = $(iteme).find(".select-data-size").select2().find(":selected").data("sizeid");
                item.ColorId = $(iteme).find(".select-data-color").select2().find(":selected").data("colorid");
                item.Quantity = eval($(iteme).find(".txtQuantity").val());
                item.ImportPrice = eval($(iteme).find(".txtImportPrice").val());
                if (!item.ProductId || !item.SizeId || !item.ColorId || !item.Quantity || !item.ImportPrice) {
                    toastr["error"]("Bạn không được để trống thông tin");
                    return 0;
                }
                arr.push(item);
                item = {};
            });
            supply.SupplyId = eval($(".select-data-supply").select2().find(":selected").data("supplyid"));
            supply.Note = $("#txtNote").val();
            console.log(arr, supply);
            receipt.AddReceipt(arr,supply)
        })
    },
    AddReceipt: function (arr,supply) {
        $.ajax({
            url: '/admin/receipt/AddOrUpdate',
            type: 'POST',
            data: {
                product: JSON.stringify(arr),
                supply: JSON.stringify(supply)
            },
            dataType: 'json',
            success: function (response) {
                if (response == true) {
                    toastr["success"]("Thêm mới thành công");
                } else {
                    toastr["success"]("Thêm mới thất bại");

                }
            }
        });
    }

}
receipt.init();

//$.ajax({
//    url: '/Admin/ProductSize/GetlistSize',
//    dataType: 'json',
//    type: "GET",
//    success: function (response) {
//        console.log(response);
//        $('.select-data-size').select2();

//        var options = $('.select-data-size');

//        $.each(response, function () {
//            options.append($("<option />").val(this.id).text(this.name));
//        });
//    }
//})