
//var order = {
//    init: function () {
//        order.registerEvent();
//    },
//    registerEvent: function () {
//        $('.btnDetail').off('click').on('click', function (e) {
//            //xoa dieu huong mac dinh cua the a

//            var orderId = eval($(this).data('id'));
//            if (orderId) {
//                $.ajax({
//                    url: '/Order/GetOrderDetail',
//                    type: 'POST',
//                    data: {
//                        orderId: id
//                    },
//                    dataType: 'json',
//                    success: function (response) {

//                    }
//                });
//            }
//        });

//    },
//    getOrderDetail: function (id) {
//        $.ajax({
//            url: '/Order/GetOrderDetail',
//            type: 'POST',
//            data: {
//                orderId: id
//            },
//            dataType: 'json',
//            success: function (response) {
                
//            }
//        });
//    }

//}
//order.init();
