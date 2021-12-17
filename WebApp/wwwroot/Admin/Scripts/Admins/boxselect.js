function clickBoxSearch() {
    $('.box-select').click(function () {
        $(this).children('.box-search').css({
            'display': 'block'
        }); 
        $(this).children('.box-search').children('input').focus();
    })
}

function clickOutSizeDiv() {
    $(document).mouseup(function (e) {
        var container = $(".box-select .box-search");
        if (!container.is(e.target) && container.has(e.target).length === 0) {
            $(".box-select .box-search").css({
                'display': 'none'
            })
        }
    });
}
function selectBoxSearch() {
    $('.box-select .box-search ul li').click(function () {
        let id = $(this).attr('data-value');
        let name = $(this).text();
        $(this).parent().parent().siblings('.value').children('.text').text(name);
        $(this).parent().parent().parent().attr('data-id', id);
        hiddenBoxSearch();
    })
}
function hiddenBoxSearch() {
    setTimeout(function () {
        $(".box-select .box-search").css({
            'display': 'none'
        })
    }, 100)
}

function searchInputBoxSearch() {
    $('.box-select .box-search input').keyup(function () {
        let str = $(this).val();
        str = str.toLowerCase();
        $(this).siblings('ul').children('li').each(function (index, el) {
            let text = $(this).text();
            text = text.toLowerCase();
            if (!text.includes(str)) {
                $(this).css({
                    'display': 'none'
                })
            } else {
                $(this).css({
                    'display': 'block'
                })
            }
        })
    })
}
