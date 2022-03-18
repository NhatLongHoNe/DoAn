// khai báo cho các biến dùng chung
// các url
var urlGetData = '';

// các biến để getData
var submitData = {
    Search: "",
    PageSize: 15,
    PageNumber: 1,
}
// định nghĩa các function hiển thị dữ liệu

var files = [];
ChangePageSize();

function Search(el) {
    submitData.Search = $(el).val();
    GetDataToTable(urlGetData)
}

function CancelSearch() {
    $('#FormSearch input').each(function () {
        $(this).val('');
    })
    submitData.listFilter = [];
    GetDataToTable(urlGetData)
    $('#FormSearch').collapse('hide');
}

function ChangePageSize() {
    //debugger;
    $('.pageSize').on('change', function () {
        let val = $(this).val();
        submitData.PageSize = val;
        GetDataToTable(urlGetData)
    })
}

function ChangePageNumber() {
    $('.pagination li a').on('click', function (e) {
        let val = $(this).attr('data-index');
        submitData.PageNumber = val;
        GetDataToTable(urlGetData)
    })
}

function SortByKey() {
    $('thead tr th').click(function () {
        let key = $(this).attr('data-name');
        let orderBy = $(this).attr('data-order');
        if (key == orderBy) {
            let sort = $(this).attr('data-sort');
            if (sort == "True") { // sắp xếp giảm
                sort = false;
                $(this).attr('data-sort', "False")
            }
            else if (sort == "False") {  // reset
                key = "";
            }
            submitData.orderBy = key;
            submitData.isAsc = sort;
            GetDataToTable(urlGetData);
        }
        else {  // sắp xếp tăng
            let sort = true;
            submitData.orderBy = key;
            submitData.isAsc = sort;
            GetDataToTable(urlGetData);
        }

    });
}
// get data from server 
function GetDataToTable(url) {
    $.ajax({
        url: url,
        type: 'post',
        dataType: 'html',
        data: {
            baseParam: submitData
        },
        beforeSend: function () {
        },
        success: function (res) {
            console.log(submitData);
            $('.table-responsive').html('');
            $('.table-responsive').append(res);
        },
        error: function (error) {
            console.log(error);
        },
        complete: function () {
            ChangePageNumber();
        }
    })
}

function GetFormAddOrEdit(url, Id) {
    //debugger;
    $.ajax({
        url: url,
        type: 'post',
        dataType: 'html',
        data: {
            Id: Id
        },
        beforeSend: function () {
        },
        success: function (res) {
            $('.add-form').html('');
            $('.add-form').append(res);
        },
        error: function (error) {
            console.log(error);
        },
        complete: function () {
            ChangePageNumber();
            SortByKey();
            ConvertToSlug();
        }
    })
}

// post record
function AddOrUpdate(url) {
    if (ValidationInput()) {  // kiểm tra dữ liệu đầu vào
        // read data in form
        let formArray = $('form.form-input').serializeArray();
        var object = {};
        jQuery.map(formArray, function (n, i) {
            object[n.name] = n.value;
        });
        $('.form-input textarea').each(function (index, item) {
            if ($(this).hasClass('ckeditor') || $(this).hasClass('ckeditor')) {
                let id = $(this).attr('id');
                object[$(this).attr('name')] = CKEDITOR.instances[id].getData();
            }
        })
        swal({
            title: $('#Id').val() == 0 ? "Bạn có chắc chắn muốn thêm" : "Bạn có chắc muốn sửa dữ liệu này?",
            text: $('#Id').val() == 0 ? "" : "Sau khi sửa thì không thể quay lại!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                // submit data
                $.ajax({
                    url: url,
                    type: 'post',
                    dataType: 'json',
                    data: {
                        obj: object
                    },
                    beforeSend: function () {
                    },
                    success: function (res) {
                        if (res) {
                            swal("Thành công!", "Cập nhật dữ liệu thành công!", "success");
                            GetDataToTable(urlGetData);
                            RefreshForm();
                        }
                        else {
                            swal("Không thành công!", "Cập nhật dữ liệu không thành công!", "warning");
                        }
                    },
                    error: function (error) {

                    },
                    complete: function () {
                    }
                })
            }
        })
    }
}

function AddOrUpdateWithFile(url) {
    if (ValidationInput()) {  // kiểm tra dữ liệu đầu vào
        // read data in form
        debugger
        let formArray = $('form.form-input').serializeArray();
        var object = {};
        jQuery.map(formArray, function (n, i) {
            object[n.name] = n.value;
        });
        $('.form-input textarea').each(function (index, item) {
            if ($(this).hasClass('ckeditor') || $(this).hasClass('ckeditor')) {
                let id = $(this).attr('id');
                object[$(this).attr('name')] = CKEDITOR.instances[id].getData();
            }
        })
        object.ProductImage = [];
        $('.list-image img').each(function (i, e) {
            if ($(e).attr('data-server') == "true") {
                object.ProductImage.push({
                    Id: 0,
                    Image: $(e).attr('src'),
                    ProductId: 0
                })
            }
        })
        console.log(object);
        var formData = new FormData();
        if ($('#fileImage')[0] != null) {
            var file = $('#fileImage')[0].files[0];
           
            if (file != undefined)
                    formData.append('avatar', file);
        }
        $(files).each(function (i, e) {
            formData.append(e.name, e);
        })
        formData.append('data', JSON.stringify(object));

        swal({
            title: $('#Id').val() == 0 ? "Bạn có chắc chắn muốn thêm" : "Bạn có chắc muốn sửa dữ liệu này?",
            text: $('#Id').val() == 0 ? "" : "Sau khi sửa thì không thể quay lại!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                // submit data
                $.ajax({
                    url: url,
                    type: 'post',
                    dataType: 'json',
                    data: formData,
                    contentType: false,
                    processData: false,
                    async: false,
                    beforeSend: function () {
                    },
                    success: function (res) {
                        if (res) {
                            swal("Thành công!", "Cập nhật dữ liệu thành công!", "success");
                            RefreshForm();
                            GetDataToTable(urlGetData);
                        }
                        else {
                            swal("Không thành công!", "Cập nhật dữ liệu không thành công!", "warning");
                        }
                    },
                    error: function (error) {

                    },
                    complete: function () {
                    }
                })
            }
        })
    }
}

//get record
function GetObjectById(url, id) {
    $.ajax({
        url: url,
        type: 'post',
        dataType: 'json',
        data: {
            id: id
        },
        success: function (res) {
            $.each(res, function (key, value) {
                key = key[0].toUpperCase() + key.slice(1, key.length);   // lấy ra key object
                let elName = ".form-input " + "#" + key   // lấy ra string el
                let el = $(elName); // get element by key
                if (el != null && el != undefined && el.length > 0) {
                    let tagName = el.prop('tagName').toLowerCase();  // get tag name element
                    if (tagName == 'input') {
                        let type = el.prop('type');  // type of input
                        if (type == 'text' || type == 'number' || type == 'hidden' || type == 'email') {
                            el.val(value);
                            if (key == "Image"||key=="Logo") {
                                el.siblings('img').attr('src', value)
                            }
                        }
                        else if (type == 'radio') {
                            let obj = ".form-input " + "input[name=" + key + "][value=" + value + "]"
                            let radio = $(obj);
                            radio.prop('checked', true);
                        }
                        else if (type == 'date') {
                            let date = value.slice(0, 10);
                            el.val(date);
                        }
                    }
                    else if (tagName == 'select') {
                        el.val(value);
                        if (el.hasClass('select2')) {
                            el.val(value).select2();
                        }
                    }
                    else if (tagName == 'textarea') {
                        if (el.hasClass('ckeditor') || el.hasClass('p-ckeditor')) {
                            CKEDITOR.instances[key].setData(value);
                        }
                        else {
                            el.val(value);
                        }
                    }
                }

            })
        },
        error: function (error) {
            console.log(error)
        },
        complete: function () {
        }
    })
}

// view detail
function GetViewDetail(url, id) {
    //debugger;
    $.ajax({
        url: url,
        type: 'post',
        dataType: 'html',
        data: {
            id: id
        },
        success: function (res) {
            //debugger;
            $('.modal-add .modal-body').html('');
            $('.modal-add .modal-body').append(res);
            $('.btn-save').addClass('d-none');
            $('.modal-add').modal('show');
            $('.modal-title').text('Chi Tiết');
        },
        error: function (error) {
            console.log(error)
        }
    })
}

// delete record
function DeleteById(url, id) {
    swal({
        title: "Xóa dữ liệu này?",
        text: "Dữ liệu xóa sẽ không thể khôi phục!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
            $.ajax({
                url: url,
                type: 'post',
                dataType: 'json',
                data: {
                    id: id
                },
                success: function (res) {
                    console.log(res);
                    if (res) {
                        swal("Thành công!", "Bạn vừa xóa dữ liệu thành công!", "success");
                        GetDataToTable(urlGetData)
                    }
                    else {
                        swal("Không thành công!", "Không thể xóa dữ liệu!", "success");
                    }
                },
                error: function (error) {
                    console.log(error)
                }
            })
        }
    })
}

// xóa đi dữ liệu đang nhập trên form
function RefreshForm() {
    $('.text-danger').html('');
    $('.form-input input').each(function () {
        if ($(this).attr('type') == 'text' || $(this).attr('type') == 'date' || $(this).attr('type') == 'password' || $(this).attr('type') == 'email' || $(this).attr('type') == 'file') {
            $(this).val("");
            if ($(this).attr('name') == "Image" || $(this).attr('name') == "Logo") {
                $(this).val('/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg');
                $(this).siblings('img').attr('src', '/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg');
            }
        }
        else if ($(this).attr('type') == 'number') {
            $(this).val(0);
        }
        else if ($(this).attr('type') == 'radio') {
            let name = $(this).attr('name');
            $("#" + name + "").prop('checked', true);
        }
    })
    $('.form-input select').each(function () {
        $(this).val(0);
        if ($(this).hasClass('select2')) {
            $(this).val(0).select2();
        }
    })
    $('.form-input textarea').each(function () {
        if ($(this).hasClass('ckeditor') || $(this).hasClass('p-ckeditor')) {
            let id = $(this).attr('id');
            CKEDITOR.instances[id].setData('')
        }
        else {
            $(this).val('')
        }
    })


    $('.list-image').html('');
    files.splice(0, files.length);
}

// kiểm tra dữ liệu đầu vào
function ValidationInput() {
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



function ConvertToSlug() {
    $('input#Name').on('keyup', function () {
        console.log("ccc")
        let val = $(this).val();
        $('input#Slug').val(convertToSlug(val))

        function convertToSlug(str) {
            //Đổi chữ hoa thành chữ thường
            str = str.toLowerCase();
            str = str.trim();
            str = str.replace(/\s+/gi, '-')
            //Đổi ký tự có dấu thành không dấu
            str = str.replace(/á|à|ả|ạ|ã|ă|ắ|ằ|ẳ|ẵ|ặ|â|ấ|ầ|ẩ|ẫ|ậ/gi, 'a');
            str = str.replace(/é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ/gi, 'e');
            str = str.replace(/i|í|ì|ỉ|ĩ|ị/gi, 'i');
            str = str.replace(/ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ/gi, 'o');
            str = str.replace(/ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự/gi, 'u');
            str = str.replace(/ý|ỳ|ỷ|ỹ|ỵ/gi, 'y');
            str = str.replace(/đ/gi, 'd');
            str = str.replace(/\`|\~|\!|\@|\#|\||\$|\%|\^|\&|\*|\(|\)|\+|\=|\,|\.|\/|\?|\>|\<|\'|\"|\:|\;|_/gi, '-');
            str = str.replace(/\@\-|\-\@|\@/gi, '-');
            return str;
        }
    })
}

function validateEmail(email) {
    var re = /\S+@\S+\.\S+/;
    return re.test(email);
}


// choose main image
function OpenFile(el) {
    $('#fileImage').click();
}
function OpenFileMultiple(el) {
    $('#fileImages').click();
}
function ChooseFile(el) {
    console.log($(el))
    //$('input[name=Image]').val($(el).val());
    var tmppath = URL.createObjectURL(el.files[0]);
    $('#image').fadeIn("fast").attr('src', tmppath);
    $('#Logo').fadeIn("fast").attr('src', tmppath);
}

function ChooseFileMultiple(el) {
    //$('input[name=Image]').val($(el).val());
    var tmppath = URL.createObjectURL(el.files[0]);
    let index = files.length;
    files.push(el.files[0]);
    let row = `<div class="image-item">
                    <img src="${tmppath}" class="img-size" alt="Cập nhật" data-server="false"/>
                    <i class="fas fa-times"  onclick="DeleteImage(this,${index},true)"></i>
                </div>`;
    $('.list-image').append(row);
}


function DeleteImage(el, index, check) {
    $(el).parent().remove();
    if (check) {
        files.splice(index, 1);
    }
}



function OpenLink(url) {
    window.location.href = url;
}
// n-js
function BackClick() {
    window.history.back();
}