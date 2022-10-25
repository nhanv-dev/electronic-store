new Chart(document.getElementById('chartCategory'), {
    type: 'bar',
    data: {
        labels: [
            'Laptop & Macbook',
            'Điện thoại',
            'Màn hình máy tính',
            'Tivi - Màn hình TV',
            'PC - Máy tính đồng bộ',
            'Linh kiện máy tính',
            'Phụ kiện & Thiết bị ngoại vi',
        ],
        datasets: [{
            type: 'bar',
            label: 'Doanh thu tháng này',
            data: [65000000, 59000000, 80000000, 81000000, 56000000, 55000000, 40000000],
            backgroundColor: '#0162e8',
            borderColor: '#0162e8',
        }, {
            type: 'bar',
            label: 'Doanh thu tuần này',
            data: [6500000, 5900000, 800000, 8100000, 5600000, 5500000, 4000000],
            backgroundColor: '#0162e8',
            borderColor: '#0162e8',
        }]
    },
    options: {scales: {x: {grid: {display: false}}, y: {grid: {display: true}}}}

});

new Chart(document.getElementById('lineChart'), {
    type: 'line',
    data: {
        labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
        datasets: [{
            label: 'Đơn đặt hàng / tháng',
            data: [65, 59, 80, 81, 56, 55, 40, 59, 80, 81, 56, 55, 40],
            fill: false,
            borderColor: 'rgb(75, 192, 192)',
            tension: 0.1
        }]
    },
    options: {scales: {x: {grid: {display: false}}, y: {grid: {display: true}}}}
})