var checkSeo = {
    rate: 0,
    result: [],
    readability: [],
    //setTimeOutArr = [], 
    checkTitle: function (title) {
        let check = this;
        let obj = new Object();
        obj.typeCheck = "Độ rộng của tiêu đề Seo";
        obj.note = "Rất tốt";
        obj.status = 1;
        check.result.push(obj);
    },
    checkImage: function (images) {
        let count = 0;
        let check = this;
        $.each(images, function (index, el) {
            console.log(el);
            let alt = $(el).attr('alt');
            console.log(alt);
            if (alt != undefined && alt.trim() != '') {
                count++;
            }
        });
        let obj = new Object();
        obj.typeCheck = 'Những thuộc tính alt trong hình ảnh';
        let progress = parseInt(count * 100 / images.length);
        if (progress < 30) {
            obj.note = progress + " hình ảnh chưa có thông tin alt.Hãy bổ sung thêm!";
            obj.status = 3;
        } else if (obj.progressbar < 70) {
            obj.status = 2;
            obj.note = progress + " hình ảnh chưa có thông tin alt.Hãy bổ sung thêm!";

        } else {
            obj.status = 1;
            obj.note = "Hầu hết các hình ảnh đã có thông tin alt.Rất tốt!";
        }
        check.result.push(obj);
    },
    checkAel: function (listAs) {
        let domain = "vietywine.com";
        let linkOutSize = 0;
        let linkInSize = 0;
        let count = 0;
        let check = this;
        $.each(listAs, function (index, el) {
            let href = $(el).attr('href');
            if (href.toLocaleLowerCase().includes(domain) == true) {
                linkInSize++;
            } else {
                linkOutSize++;
            }
        });
        let objInSizeLink = new Object();
        let objOutSizeLink = new Object();
        objInSizeLink.typeCheck = "Các đường dẫn nội bộ";
        objOutSizeLink.typeCheck = "Các đường dẫn ra ngoài trang";
        if (linkInSize > 0) {
            objInSizeLink.note = "Bạn có đủ các đường dẫn nội bộ.Rất tốt!";
            objInSizeLink.status = 1;
        } else {
            objInSizeLink.note = "Không có các đường dẫn nội bộ.Hãy thêm một số đường dẫn!";
            objInSizeLink.status = 3;
        }
        if (linkOutSize > 0) {
            objOutSizeLink.note = "Bạn có đủ các đường dẫn ra ngoài trang.Rất tốt!";
            objOutSizeLink.status = 1;
        } else {
            objOutSizeLink.note = "Không có các đường dẫn ra ngoài trang.Hãy thêm một số đường dẫn!";
            objOutSizeLink.status = 3;
        }
        check.result.push(objInSizeLink);
        check.result.push(objOutSizeLink);
    },
    checkKeyWordInTitle(mainKey, title) {
        if (mainKey.trim().length == 0) return;
        let check = this;
        let obj = new Object();
        obj.typeCheck = "Từ khóa trong tiêu đề";
        if (title.toLocaleLowerCase().includes(mainKey.toLocaleLowerCase()) == true) {
            obj.note = "Từ khóa khớp chính xác xuất hiện trong tiêu đề SEO.Rất tốt!";
            obj.status = 1;
        } else {
            obj.note = "Từ khóa chưa xuất hiện trong tiêu đề Seo.Hãy chỉnh sửa lại ngay!";
            obj.status = 3;
        }
        check.result.push(obj);
    },
    chechKeyMainInSubTitle(keyMain, subTitles) {
        if (keyMain.trim().length == 0) return;
        let count = 0;
        let checkTitle = 0;
        let check = this;
        keyMain = keyMain.toLocaleLowerCase();
        $.each(subTitles, function (index, el) {
            let text = el.text();
            checkTitle++;
            if (text.toLocaleLowerCase().includes(keyMain) == true) {
                count++;
            }
        })
        let progess = parseInt(count * 100 / checkTitle);
        let obj = new Object();
        obj.typeCheck = "Từ khóa trong tiêu đề phụ";
        if (progess <= 30) {
            obj.note = "Hãy dùng nhiều hơn các cụm từ hoặc các từ đồng nghĩa trong tiêu đề phụ.Hãy tiếp tục chỉnh sửa!";
            obj.status = 3;
        } else if (progess <= 50) {
            obj.note = "Hãy dùng nhiều hơn các cụm từ hoặc các từ đồng nghĩa trong tiêu đề phụ.Hãy tiếp tục chỉnh sửa!";
            obj.status = 2;
        } else {
            obj.note = "Khóa chính có mặt ở hầu hết các tiêu đề phụ.Rất tốt!";
            obj.status = 1;
        }
        check.result.push(obj);
    },
    checkLengthContent(length) {
        let check = this;
        let obj = new Object();
        obj.typeCheck = "Độ dài của văn bản";
        if (length < 500) {
            obj.note = "Văn bản quá ngắn.Hãy bổ xung thêm!";
            obj.status = 3;
        } else if (length < 800) {
            obj.note = "Văn bản có " + length + "từ.Số lượng từ ít hơn so với mức tối tối thiểu 900 từ.Hãy bổ xung thêm!";
            obj.status = 2;
        } else {
            obj.note = "Số lượng từ khớp với mức khuyến cáo.Rất tốt!";
            obj.status = 1;
        }
        check.result.push(obj);
    },
    checkKeyMainInDescription(keyMain, des) {
        if (keyMain.trim().length == 0) return;
        let check = this;
        let obj = new Object();
        obj.typeCheck = "Cụm từ khóa trong mô tả meta";
        if (des.toLocaleLowerCase().includes(keyMain.toLocaleLowerCase()) == true) {
            obj.note = "Cụm từ khóa hoặc từ đồng nghĩa xuất hiện trong mô tả meta. Rất tốt!";
            obj.status = 1;
        } else {
            obj.note = "Cụm từ khóa hoặc từ đồng nghĩa không xuất hiện trong mô tả meta. Hãy bổ sung ngay!";
            obj.status = 3;
        }
        check.result.push(obj);
    },

    checkContent: function (listPs, keyMain) {
        let count = 0;
        let totalCheck = 0;
        let checkKeyMain = 0;
        let check = this;
        let objLength = new Object();
        let objKeyMain = new Object();
        console.log("keyMAin", keyMain);
        // Kiểm tra số lần xuất hiện của keyMain

        $.each(listPs, function (index, el) {
            let listText = $(el).text().split(".");
            $.each(listText, function (i, item) {
                totalCheck++;
                if (item.trim() != '' && item.trim().split(" ").length >= 20) {
                    count++;
                }
                if (item.toLocaleLowerCase().trim().includes(keyMain.toLocaleLowerCase()) == true) {
                    checkKeyMain++;
                }
            })
        });
        let checkNumber = parseInt(count * 100 / totalCheck);

        objKeyMain.typeCheck = "Mật độ cụm từ khóa";
        objLength.typeCheck = "Độ dài của câu";
        if (checkNumber < 50) {
            objLength.note = checkNumber + "% trong số các câu chứa 20 trở lên, nhiều hơn mức khuyến nghị tối đa là 20%.Hãy rút gọn các câu!";
            objLength.status = 3;
        } else if (checkNumber < 70) {
            objLength.note = check + "% trong số các câu chứa 20 trở lên, nhiều hơn mức khuyến nghị tối đa là 20%.Hãy rút gọn các câu!";
            objLength.status = 2;
        } else {
            objLength.note = "Phần lớn các câu văn đều chứa dưới 20 từ.Rất tốt!";
            objLength.status = 1;
        }
        if (checkKeyMain < 1) {
            objKeyMain.note = "Cụm từ khóa không tồn tại trong bài viết.Hãy bổ sung thêm!";
            objKeyMain.status = 3;
        } else if (checkKeyMain < 3) {
            objKeyMain.note = "Cụm từ khóa ít xuất hiện trong bài viết( " + checkKeyMain + " lần).Hãy bổ sung thêm!";
            objKeyMain.status = 2;
        } else {
            objKeyMain.note = "Cụm từ khóa xuất hiện " + checkKeyMain + " lần trong bài viết.Rất tốt!";
            objKeyMain.status = 1;
        }
        check.readability.push(objLength);
        if (keyMain.trim().length == 0) return;
        check.result.push(objKeyMain);
    },
    checkLengthDesc(desc) {
        let check = this;
        let obj = new Object();
        obj.typeCheck = "Độ dài thẻ meta";
        if (desc.length > 255) {
            obj.note = "Nội dung trong thẻ meta vượt quá 255 ký tự. Hãy rút gọn!"
            obj.status = 3;
        } else {
            obj.note = "Rất tốt!"
            obj.status = 1;
        }
        check.result.push(obj);
    },
    checkKeyInSlug(str, slug) {
        let check = this;
        let count = 0;
        str = str.toLowerCase();
        str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
        str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
        str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
        str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
        str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
        str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
        str = str.replace(/đ/g, "d");
        str = str.replace(/!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'|\"|\&|\#|\[|\]|~|\$|_|`| |{|}|\||\\/g, "-");
        str = str.replace(/ + /g, " ");
        str = str.trim();
        let listKey = str.split('');
        $.each(listKey, function (index, item) {
            if (slug.toLocaleLowerCase().includes(item) == true) {
                count++;

            }
        })
        let obj = new Object();
        obj.typeCheck = "Từ khóa trong Slug"
        let progess = parseInt(count * 100 / listKey.length);
        if (progess <= 20) {
            obj.note = "Một phần rất nhỏ của từ khóa xuất hiện trong SLug.Hãy chỉnh sửa thêm!";
            obj.status = 3;
        } else if (progess < 50) {
            obj.note = "Gần một nửa từ khóa xuất hiện trong Slug.Hãy chỉnh sửa thêm!";
            obj.status = 2;
        } else {
            obj.note = "Hơn một nửa từ khóa xuất hiện trong SLug.Rất tốt!";
            obj.status = 1;
        }
        check.result.push(obj);
    },

    checkLengthKeyMain(keyMain) {
        let check = this;
        let obj = new Object();
        obj.typeCheck = "Độ dài cụm từ khóa";
        if (keyMain.trim().length < 1) {
            obj.note = "Cụm từ khóa chính không tồn tại.Hãy bổ sung thêm!";
            obj.status = 3;
        } else if (keyMain.trim().length > 60) {
            obj.note = "Cụm từ khóa chính quá dài.Hãy chỉnh sửa lại!";
            obj.status = 2;
        } else {
            obj.note = "Rất tốt!";
            obj.status = 1;
        }
        check.result.push(obj);
    },
    checkLengthParagrap(listPs) {
        let check = this;
        let count = 0;
        let obj = new Object();
        obj.typeCheck = "Độ dài của đoạn văn";
        $.each(listPs, function (index, el) {
            let length = $(el).text().split().length;
            if (length > 100) {
                count++;

            }
        })
        if (count < 1) {
            obj.note = "Không có các đoạn văn quá dài. Rất tốt!";
            obj.status = 1;

        } else if (count < listPs / 2) {
            obj.note = "Một số đoạn văn hơi dài. Hãy chỉnh sửa lại!";
            obj.status = 2;
        } else {
            obj.note = "Một số đoạn văn hơi dài. Hãy chỉnh sửa lại!";
            obj.status = 3;

        }
        check.readability.push(obj);
    },

    addListHtml: function (data) {
        let check = this;
        $('#ketQuaTot').html('');
        $('#cacCaiTien').html('');
        $('#cacVanDe').html('');
        let dataSuccess = data.filter(x => x.status == 1);
        let dataWarning = data.filter(x => x.status == 2);
        let dataDanger = data.filter(x => x.status == 3);
        let row = ``;
        if (dataDanger.length <= 3 && dataWarning.length <= 3) {
            row = `<span class="text-success"><i class="fas fa-smile"></i></span> SEO`;
        } else if (dataDanger.length <= 5) {
            row = `<span class="text-warning"><i class="far fa-smile"></i></span> SEO`;

        } else {
            row = `<span class="text-danger"><i class="fas fa-frown-open"></i></span> SEO`;

        }
        $('#box-seo').html(row);
        $('.cacvande_count').text(`Các vấn đề (${dataDanger.length})`);
        $('.cacCaiTien_count').text(`Các cải tiến  (${dataWarning.length})`);
        $('.ketQuaTot_count').text(`Kết quả tốt (${dataSuccess.length})`);
        $.each(data, function (index, item) {
            check.addHtml(item, index, item.status);
        });

    },
    addHtml: function (obj, stt, status) {
        if (status == 1) {
            let row = `<div class="mb-1">
                                        <span class="text-success mr-1">
                                            <i class="fas fa-circle"></i>
                                        </span>
                                        <span>
                                            <b> ${obj.typeCheck}:</b> ${obj.note}
                                        </span>
                                    </div>`;
            $('#ketQuaTot').append(row);
        } else if (status == 2) {
            let row = `<div class="mb-1">
                                        <span class="text-warning mr-1">
                                            <i class="fas fa-circle"></i>
                                        </span>
                                        <span>
                                            <b> ${obj.typeCheck}:</b> ${obj.note}
                                        </span>
                                    </div>`;
            $('#cacCaiTien').append(row);
        } else {
            let row = `<div class="mb-1">
                                        <span class="text-danger mr-1">
                                            <i class="fas fa-circle"></i>
                                        </span>
                                        <span>
                                            <b> ${obj.typeCheck}:</b> ${obj.note}
                                        </span>
                                    </div>`;
            $('#cacVanDe').append(row);
        }

    },
    addHtmlRead(obj, stt, status) {
        if (status == 1) {
            let row = `<div class="mb-1">
                                        <span class="text-success mr-1">
                                            <i class="fas fa-circle"></i>
                                        </span>
                                        <span>
                                            <b> ${obj.typeCheck}:</b> ${obj.note}
                                        </span>
                                    </div>`;
            $('#tinhDeDocTot').append(row);
        } else if (status == 2) {
            let row = `<div class="mb-1">
                                        <span class="text-warning mr-1">
                                            <i class="fas fa-circle"></i>
                                        </span>
                                        <span>
                                            <b> ${obj.typeCheck}:</b> ${obj.note}
                                        </span>
                                    </div>`;
            $('#caiTien').append(row);
        } else {
            let row = `<div class="mb-1">
                                        <span class="text-danger mr-1">
                                            <i class="fas fa-circle"></i>
                                        </span>
                                        <span>
                                            <b> ${obj.typeCheck}:</b> ${obj.note}
                                        </span>
                                    </div>`;
            $('#vande').append(row);
        }
    },
    addListHtmlRead(data) {
        console.log(data);
        let check = this;
        $('#tinhDeDocTot').html('');
        $('#caiTien').html('');
        $('#vanDe').html('');
        let dataSuccess = data.filter(x => x.status == 1);
        let dataWarning = data.filter(x => x.status == 2);
        let dataDanger = data.filter(x => x.status == 3);
        let row = ``;
        if (dataDanger.length < 1) {
            row = `<span class="text-success"><i class="fas fa-smile"></i></span> TÍNH DỄ ĐỌC`;
        } else if (dataDanger.length < 1 && dataWarning.length <= 2) {
            row = `<span class="text-warning"><i class="fas fa-smile"></i></span> TÍNH DỄ ĐỌC`;

        } else {
            row = `<span class="text-danger"><i class="fas fa-frown-open"></i></span> TÍNH DỄ ĐỌC`;

        }
        $('#box-tinhdedoc').html(row);
        $('.vande_count').text(`Các vấn đề (${dataDanger.length})`);
        $('.caiTien_count').text(`Các cải tiến  (${dataWarning.length})`);
        $('.tinhDeDocTot_count').text(`Kết quả tốt (${dataSuccess.length})`);
        $.each(data, function (index, item) {
            check.addHtmlRead(item, index, item.status);
        });
    },
    checkSeo(id) {

        let check = this;
        check.result = [];
        check.readability = [];
        let content = CKEDITOR.instances[id].getData();
        $('.contentCkedtior').html('');
        $('.contentCkedtior').append(content);
        let lengtContent = $('.contentCkedtior').text().split(" ").length;
        let images = $('.contentCkedtior img');
        let pEls = $('.contentCkedtior p');
        let aEls = $('.contentCkedtior a');

        let tieude = $('#title').val();
        let keywords = $('#meta-keyword').val().split(",");
        let contentKeyWord = $('.contentCkedtior').text();
        let keyMain = $('#main-keyword').val();
        if (keyMain != null) {
            keyMain = keyMain.trim().toLocaleLowerCase();

        }


        let metaDescription = $('#meta-description').val();
        let slug = $('#slug').val();
        let subTitles = [];
        subTitles = subTitles.concat($('.contentCkedtior h2'));
        subTitles = subTitles.concat($('.contentCkedtior h3'));
        subTitles = subTitles.concat($('.contentCkedtior h4'));
        subTitles = subTitles.concat($('.contentCkedtior h5'));
        check.checkTitle(tieude);
        check.checkImage(images);
        check.checkContent(pEls, keyMain);
        check.checkAel(aEls);
        check.checkKeyMainInDescription(keyMain, metaDescription);
        check.checkLengthContent(lengtContent);
        check.checkKeyWordInTitle(keyMain, tieude);
        check.chechKeyMainInSubTitle(keyMain, subTitles);
        check.checkLengthDesc(metaDescription);
        check.checkKeyInSlug(keyMain, slug);
        check.checkLengthKeyMain(keyMain);
        check.checkLengthParagrap(pEls);
        console.log(check.result);
        check.addListHtml(check.result);
        check.addListHtmlRead(check.readability);
    },
    checkSeoAction(id) {
        let check = this;
        $('input, textarea').on('change', function () {
            check.checkSeo(id);
        });
        CKEDITOR.instances[id].on('change', function () {
            check.checkSeo(id);
        });

        CKEDITOR.instances['description'].on('change', function () {
            check.checkSeo(id);
        });





    }
}


//Sự kiện keyup show SEO
function selectSEO(idValue, show, maxValue) {
    let text = $('#' + idValue).val();
    $('#' + show).html(text);
    let lengthValue = maxValue;// $('#' + idValue).attr('maxlength');
    let progessValue = $('#' + idValue).attr('progess-value');
    if (text.length < 1) {
        $('#' + progessValue).attr('data-status', 'low');
        $('#' + progessValue).attr('aria-valuenow', 0);
        $('#' + progessValue).css('width', '0%');
        $('span[data-progress="' + progessValue + '"]').html(0 + '%');
    }
    else if (text.length > 0 && text.length <= parseInt(lengthValue * 3 / 8)) {
        $('#' + progessValue).attr('data-status', 'low');
        $('#' + progessValue).attr('aria-valuenow', 25);
        $('#' + progessValue).css('width', '25%');
        $('span[data-progress="' + progessValue + '"]').html(25 + '%');
    }
    else if (text.length > parseInt(lengthValue * 3 / 8) && text.length <= parseInt(lengthValue / 1.6)) {
        $('#' + progessValue).attr('data-status', 'normal');
        $('#' + progessValue).attr('aria-valuenow', 50);
        $('#' + progessValue).css('width', '50%');
        $('span[data-progress="' + progessValue + '"]').html(50 + '%');
    }
    else if (text.length > parseInt(lengthValue / 1.6) && text.length <= parseInt(lengthValue * 3 / 4)) {
        $('#' + progessValue).attr('data-status', 'perfect');
        $('#' + progessValue).attr('aria-valuenow', 80);
        $('#' + progessValue).css('width', '80%');
        $('span[data-progress="' + progessValue + '"]').html(80 + '%');
    }
    else if (text.length > parseInt(lengthValue * 3 / 4) && text.length <= lengthValue) {
        $('#' + progessValue).attr('data-status', 'perfect');
        $('#' + progessValue).attr('aria-valuenow', lengthValue);
        $('#' + progessValue).css('width', '100%');
        $('span[data-progress="' + progessValue + '"]').html(100 + '%');
    };

}
