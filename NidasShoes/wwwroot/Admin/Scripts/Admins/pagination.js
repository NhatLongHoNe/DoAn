let pageSize = 10;
let pageNumber = 1;
let pageCount = 0;
let data = [];
var dataPagging = []; 
function setPagination(pageCount, pageNumber) {
    $('.pagination ul').html('');
    if (pageCount <= 5) {
        setPaginationRange(1, pageCount, pageNumber);
    } else if (pageNumber < 3) {
        setPaginationRange(1, 4, pageNumber);
        let rowRight = `<li class="page-item page-link" data-page="${pageCount}"> <i class="fas fa-angle-double-right"></i></li>`;
        $('.pagination ul').append(rowRight);
    } else if (pageNumber > pageCount - 2) {
        let rowLeft = `<li data-page="1"> <i class="fas fa-angle-double-left"></i></li>`;
        $('.pagination ul').prepend(rowLeft);
        setPaginationRange(pageCount - 3, pageCount, pageNumber);
    } else {
        setPaginationRange(pageNumber - 1, pageNumber + 1, pageNumber);
        let rowRight = `<li data-page="${pageCount}"> <i class="fas fa-angle-double-right"></i></li>`;
        $('.pagination ul').append(rowRight);
        let rowLeft = `<li data-page="1"> <i class="fas fa-angle-double-left"></i></li>`;
        $('.pagination ul').prepend(rowLeft);
    }
    selectPagination();
    updatePaginationInfo(pageNumber, pageCount); 
}
function setPaginationRange(start, end, pageNumber) {
    for (let i = start; i <= end; i++) {
        if (i == pageNumber) {
            let row = `<li class="page-item page-link active" data-page="${i}"> ${i} </li>`;
            $('.pagination ul').append(row);
        } else {
            let row = `<li class="page-item page-link" data-page="${i}"> ${i} </li>`;
            $('.pagination ul').append(row);
        }
    }
}
function updatePageCount(dataSize, pageSize) {
    pageCount = dataSize % pageSize == 0 ? dataSize / pageSize : parseInt(dataSize / pageSize) + 1;
}
function setSelectDisplay() {
    $('select[name="display"]').change(function () {
        pageSize = $(this).val();
        updatePageCount(dataFilter.length, pageSize);
        setPagination(pageCount, 1);
        setPagingDataHtml(pageSize, pageNumber);
    })
}
function selectPagination() {
    $('.pagination ul li').click(function () {
        let pageNumber = parseInt($(this).attr('data-page'));
        setPagingDataHtml(pageSize, pageNumber);
        setPagination(pageCount, pageNumber);
    })
}

//text hiện trang hiện tại / tổng trang
function setPagingDataHtml(pageSize, pageNumber) {
    dataPagging = dataFilter.slice(pageNumber * pageSize - pageSize, pageNumber * pageSize - 1);
    setListDataHtml(dataPagging, pageNumber * pageSize - pageSize+1);
}
function updatePaginationInfo(pageNumber, pageCount) {
    let text = `Trang ${pageNumber} / ${pageCount}`;
    $('.pagination .info p').text(text);  
}
// Function hiển thị data trong một page, phải được định nghĩa lại trong mỗi view khác nhau
