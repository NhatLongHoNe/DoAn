

$(".btn-register").click(function () {
    var data = $('form').serialize()
    var checkData = objectifyForm($('form').serializeArray());
    console.log(checkData);
    if (!checkData.username || !checkData.email || !checkData.password || !checkData.rePassword) {
        toastr["warning"]("Không được để trống thông tin");
        return false;
    } if (checkData.password.length < 6) {
        toastr["warning"]("Mật khẩu phải dài hơn 6 ký tự");
        return false;
    }
    if (checkData.password != checkData.rePassword) {
        toastr["warning"]("Mật khẩu không khớp");
        return false;
    }
    if (!isemail.test(checkData.email)) {
        toastr["warning"]("Không phải email");
        return false;
    }
    $.ajax({
        url: '/Login/Register',
        type: 'POST',
        dataType: 'text',
        data: data,
        beforeSend: function () {
            console.log("xử lý")
            console.log(data)
        }
    })
        .done(function (res) {
            if (res == "true") {
                toastr["success"]("Đăng ký thành công!")

                setTimeout(function () {
                    var datalogin = {
                        username: checkData.username,
                        password: checkData.password
                    }
                    $.ajax({
                        url: '/Login/LoginClient',
                        type: 'POST',
                        dataType: 'text',
                        data: datalogin,
                        beforeSend: function () {
                        }
                    }).done(function (result) {
                        if (result == "true")
                            window.location.href = '/Home/Index';
                    })
                }, 1000);

                toastr["info"]("Đang chuyển hướng!");
            }
            else
                toastr["error"]("Tài khoản hoặc email đã tồn tại");
        })
        .fail(function () {
            toastr["error"]("Đăng ký thất bại");
        })
        .always(function () {
            console.log("complete");

        });
    return false;
});



$(".btn-forgot-password").click(function () {
    var data = $('form').serialize()
    var checkData = objectifyForm($('form').serializeArray());
    console.log(checkData);
    if (!checkData.email) {
        toastr["warning"]("Không được để trống thông tin");
        return false;
    }
    if (!isemail.test(checkData.email)) {
        toastr["warning"]("Không phải email");
        return false;
    }
    $.ajax({
        url: '/Login/ForgotPassword',
        type: 'POST',
        dataType: 'text',
        data: data,
        beforeSend: function () {
            console.log("xử lý")
            console.log(data)
        }
    })
        .done(function (res) {
            if (res == "true") {
                toastr["success"]("Gửi email thành công, vui lòng kiểm tra email")
            }
            else
                toastr["error"]("Email không tồn tại");
        })
        .fail(function () {
            toastr["error"]("Gửi email thất bại");
        })
        .always(function () {
            console.log("complete");

        });
    return false;
});
