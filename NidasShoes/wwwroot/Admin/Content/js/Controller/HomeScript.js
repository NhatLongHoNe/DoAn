
    const labels = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
    ];

    const data = {
        labels: labels,
    datasets: [{
                label: 'Tổng bán',
        backgroundColor: 'rgb(255, 193 ,7)',
                borderColor: 'rgb(255, 194, 8)',
                data: [0, 50, 5, 2, 20, 30, 100],
                borderWidth: 1,
            }]
        };

    const config = {
        type: 'bar',
        data: data,
        options: {
            scales: {
            y: {
            beginAtZero: true
                    }
                }
            },
        };

    const myChart = new Chart(
    document.getElementById('myChart'),
    config
    );
