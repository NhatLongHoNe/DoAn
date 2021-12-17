var pageSize = 9;
var pageNumber = 1;
var pageCount = 0;
var data = [];
var dataFilter = [];
var dataPagging = []; 
function setPagination(pageCount, pageNumber) {
    $('.pagination ul').html('');
    if (pageCount <= 5) {
        setPaginationRange(1, pageCount, pageNumber);
    } else if (pageNumber < 3) {
        setPaginationRange(1, 4, pageNumber);
        let rowRight = `<li data-page="${pageCount}"> <i class="fas fa-angle-right"></i></li>`;
        $('.pagination ul').append(rowRight);
    } else if (pageNumber > pageCount - 2) {
        let rowLeft = `<li data-page="1"> <i class="fas fa-angle-left"></i></li>`;
        $('.pagination ul').prepend(rowLeft);
        setPaginationRange(pageCount - 3, pageCount, pageNumber);
    } else {
        setPaginationRange(pageNumber - 1, pageNumber + 1, pageNumber);
        let rowRight = `<li data-page="${pageCount}"> <i class="fas fa-angle-right"></i></li>`;
        $('.pagination ul').append(rowRight);
        let rowLeft = `<li data-page="1"> <i class="fas fa-angle-left"></i></li>`;
        $('.pagination ul').prepend(rowLeft);
    }
    selectPagination();
    updatePaginationInfo(pageNumber, pageCount); 
}
function setPaginationRange(start, end, pageNumber) {
    for (let i = start; i <= end; i++) {
        if (i == pageNumber) {
            let row = `<li class="active" data-page="${i}"> ${i} </li>`;
            $('.pagination ul').append(row);
        } else {
            let row = `<li data-page="${i}"> ${i} </li>`;
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
function setPagingDataHtml(pageSize, pageNumber) {
    dataPagging = dataFilter.slice(pageNumber * pageSize - pageSize, pageNumber * pageSize);
    console.log(dataPagging); 
    setListDataHtml(dataPagging, pageNumber * pageSize - pageSize + 1);
}
function updatePaginationInfo(pageNumber, pageCount) {
    let text = `Trang ${pageNumber} / ${pageCount}`;
    $('.pagination .info p').text(text);  
}
// Function hiển thị data trong một page, phải được định nghĩa lại trong mỗi view khác nhau
function setListDataHtml(data , sttStart) {

}
