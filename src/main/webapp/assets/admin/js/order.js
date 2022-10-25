function handleDeleteOrder(id) {
    axios({method: 'delete', url: `${contextPath}/admin/order`, data: {id}})
        .then(() => $('#order-table').bootstrapTable('refresh'))
        .catch(err => console.log(err))
}

function handleUpdateOrder() {
    const formData = new FormData(document.querySelector('#update-order-form'));
    let data = {};
    formData.forEach((value, key) => data[key] = value)
    axios({method: 'put', url: `${contextPath}/admin/order`, data: data})
        .then(() => {
            $('#order-table').bootstrapTable('refresh')
            alertify.success('Cập nhật thông tin thành công.')
        })
        .catch(err => console.log(err))
}
