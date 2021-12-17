
var submitData = {
    Search: "",
    PageSize: 20,
    PageNumber: 1,
}

//debugger;
$.ajax({
    url: '/Slider/GetNCC',
    type: 'post',
    dataType: 'html',
    data: {
        baseParam: submitData
    },
    beforeSend: function () {
    },
    success: function (res) {
        let data = JSON.parse(res).results.map(x => x)
        let items = [];
        $.each(data, function (key, val) {
            items.push(`<option value="${val.id}">${val.name}</option>`);
        });
        $("#NCC").html(items)
    },
    error: function (error) {
        console.log(error);
    },
})
$.ajax({
    url: '/Slider/GetGiaTriThe',
    type: 'post',
    dataType: 'html',
    data: {
        baseParam: submitData
    },
    beforeSend: function () {
    },
    success: function (res) {
        let data = JSON.parse(res).results.map(x => x)
        let items = [];
        items.push(`<option value="">-- Chọn đúng mệnh giá, sai mất thẻ --</option>`);
        $.each(data, function (key, val) {
            items.push(`<option value="${val.id}">${val.value} VNĐ (nhận ${val.percent} %)  </option>`);
        });
        $("#GiaTriThe").html(items)
    },
    error: function (error) {
        console.log(error);
    },
})
// master data


let objCheck = {};

$('.btn-charge').click(function () {
    let formArray = $('form.form-input').serializeArray();
    console.log(formArray)
    var object = {};
    jQuery.map(formArray, function (n, i) {
        object[n.name] = n.value;
    });
    if (object.NCCId == 0 || object.ValueId == 0 || object.Code == "" || object.Seri == "") {
        toastr["warning"]("bạn cần nhập đầy đủ thông tin");
        return 0;
    }
    if (object.Code.length < 9 || object.Code.length > 16 ) {
        toastr["warning"]("Nạp thẻ thất bại! Mã thẻ phải từ 9 - 16 ký tự");
        return 0;
    }
    if (object.Seri.length < 9 || object.Seri.length > 16) {
        toastr["warning"]("Nạp thẻ thất bại! Số serial phải từ 9 - 16 ký tự");
        return 0;
    }
    //viettel
    if (object.NCCId == 1) {
        if (object.Code.length < 13 || object.Code.length > 15) {
            toastr["warning"]("Nạp thẻ thất bại! Mã thẻ cào Viettel phải là 13 hoặc 15 ký tự");
            return 0;
        }
    }
    //VINAPHONE
    if (object.NCCId ==2) {
        if (object.Code.length!=14) {
            toastr["warning"]("Nạp thẻ thất bại! Mã thẻ cào Vinaphone phải là 14 ký tự");
            return 0;
        }
    }
    //MOBIFONE
    if (object.NCCId == 3) {
        if (object.Code.length != 12) {
            toastr["warning"]("Nạp thẻ thất bại! Mã thẻ cào Mobiphone phải là 12 ký tự");
            return 0;
        }
    }
    if (object.NCCId == 5 || object.NCCId == 6 || object.NCCId == 7){
        toastr["warning"]("Thẻ chờ xử lý");

    }
    if (object.NCCId == 8) {

    }
    else {
        console.log(objCheck == object);
        if (objCheck.Code == object.Code || objCheck.Seri == object.Seri) {
            toastr["warning"]("Thẻ đã được gửi trước đó");
            return 0;
        }
        
        $.ajax({
            url: '/Napthe/Charge',
            type: 'post',
            dataType: 'json',
            data: {
                chagring: object
            },
            beforeSend: function () {
            },
            success: function (res) {
                if (res == 1) {
                    toastr["success"]("Nạp thẻ thành công đúng mệnh giá");
                }
                if (res == 2) {
                    toastr["warning"]("Thẻ thành công sai mệnh giá");
                }
                if (res == 3) {
                    toastr["warning"]("Thẻ lỗi");
                }
                if (res == 4) {
                    toastr["warning"]("Hệ thống bảo trì");
                }
                if (res == 99) {
                    toastr["warning"]("Thẻ chờ xử lý");
                }
                if (res == 100) {
                    toastr["error"]("Gửi thẻ thất bại");
                }
                setTimeout(function () {
                    location.reload();
                }, 1000);
                
            },
            error: function (error) {
                console.log(error)
                toastr["error"]("Bạn cần đăng nhập để nạp thẻ");

            },
            complete: function () {
            }
        })
    }
})