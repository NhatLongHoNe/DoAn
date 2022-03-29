toastr.options = {
    "closeButton": false,
    "debug": false,
    "newestOnTop": false,
    "progressBar": false,
    "rtl": false,
    "positionClass": "toast-top-right",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": 300,
    "hideDuration": 1000,
    "timeOut": 5000,
    "extendedTimeOut": 1000,
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
}
const numberFormat = new Intl.NumberFormat('vi-VN', {
    style: 'currency',
    currency: 'VND',
});
var submitData = {
    Search: "",
    PageSize: 20,
    PageNumber: 1,
}
function showAtmModal() {
    //debugger;
    $.ajax({
        url: '/Atm/_AtmView',
        type: 'post',
        dataType: 'html',
        data: {
            baseParam: submitData
        },
        beforeSend: function () {
        },
        success: function (res) {
            $('.demo-html').html('');
            $('.demo-html').append(res);
            $("#atmModal").modal('show');
        },
        error: function (error) {
            //console.log(error);
        },

    })
}

function LoginClient() {
    var data = {
        username: $("#username").val(),
        password: $("#password").val()
    }
    $.ajax({
        url: '/Login/LoginClient',
        type: 'POST',
        dataType: 'text',
        data: data,
        beforeSend: function () {
            toastr["info"]("Bắt đầu xử lý!");
        }
    })
        .done(function (result) {
            loadpage();
            if (result == "true") {
                toastr["success"]("Đăng nhập thành công!")
                setTimeout(function () {
                    window.location.href = '/';
                }, 1000);
                toastr["info"]("Đang chuyển hướng!");
            }
            else
                Command: toastr["error"]("Đăng nhập thất bại");
        })
        .fail(function () {
            Command: toastr["error"]("Lỗi xử lý đăng nhập");
        })
        .always(function () {
            //console.log("complete");
        });
    return false;
};
$('.submit-login-client').keypress(function (e) {
    if (e.which == 13) {
        LoginClient();
    }
});
$('.btn-client-login').click(function () {
    LoginClient();
})


function LogoutClient() {
    //debugger;
    $.ajax({
        url: '/Login/LogOut',
        type: 'post',
        dataType: 'html',
        data: {
        },
        beforeSend: function () {
        },
        success: function (res) {
            if (res == "true") {
                toastr["success"]("Đăng xuất thành công!");
                setTimeout(function () {
                    window.location.href = '/';
                }, 1000);
            }
            else {
                toastr["error"]("Đăng xuất thất bại!");
            }
        },
        error: function (error) {
        },

    })
}

function loadpage() {

    $.ajax({
        url: '/Login/CheckSession',
        type: 'POST',
        dataType: 'text',
        //data: data,
        beforeSend: function () {
        }
    })
        .done(function (result) {

            if (result == "false") {
                $(".check-user-true").addClass("d-none").removeClass("d-block");
                $(".check-user-false").addClass("d-block").removeClass("d-none");
            }
            else {
                var objUser = JSON.parse(result);
                $(".check-user-true").addClass("d-block").removeClass("d-none");
                $(".check-user-false").addClass("d-none").removeClass("d-block");
                $(".sa-userName").text(objUser.userName)
            }
        })

}
loadpage();



function SearchProduct() {
    let search = $("#search-product").val();
    //debugger
    let val = $(this).attr('data-index') ?? "";
    location.href = "/product?pageNumber=" + val + "&search=" + search;
}
$("#search-product").on('keypress', function (e) {
    if (e.which == 13) {
        Search();
    }
});