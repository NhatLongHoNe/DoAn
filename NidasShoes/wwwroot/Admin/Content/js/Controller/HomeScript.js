var lab = [];
var dat = [];
var myChart = new Chart(
    document.getElementById('myChart'), {
    type: 'bar',
    data: {
        labels: lab,
        datasets: [{
            label: 'Tổng bán',
            backgroundColor: 'rgb(255, 193 ,7)',
            borderColor: 'rgb(255, 194, 8)',
            data: dat,
            borderWidth: 1,
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

let home = {
    init: function () {
        home.registerEvent();
        home.getDataTransaction(2022);
    },
    registerEvent: function () {
        $('#btnSelectTransaction').change(function (e) {
            e.preventDefault();
            var year = $("#btnSelectTransaction").val();
            console.log(year);
            home.getDataTransaction(year)
        });
    },
    getDataTransaction: function (year) {
       
        $.ajax({
            url: '/Admin/Home/GetDataTransaction',
            type: 'get',
            data: {
                year: eval(year)
            },
            dataType: 'json',
            success: function (response) {
                console.log(response);
                var lab = [];
                var dat = [];
                response.forEach(obj => {
                    Object.entries(obj).forEach(([key, value]) => {
                        if (key == "month") {
                            lab.push(value)
                        }
                        if (key == "total") {
                            dat.push(value);
                        };
                    });
                    console.log('-------------------');
                });

                myChart.data.labels = lab;
                myChart.data.datasets[0].data = dat;
                myChart.update();
            }
        })
    }
};
home.init();
