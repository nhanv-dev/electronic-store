function handleResetPassowrd(id) {
    axios({method: 'put', url: `${contextPath}/admin/staff`, data: {id, action: 'resetPassword'}})
        .then(response => {
            $('#staff-table').bootstrapTable('refresh')
        })
        .catch(err => console.log(err))
}

function handleDeleteStaff(id) {
    axios({method: 'delete', url: `${contextPath}/admin/staff`, data: {id}})
        .then(() => $('#staff-table').bootstrapTable('refresh'))
        .catch(err => console.log(err))
}

function handleUpdateStaff() {
    const formData = new FormData(document.querySelector('#update-staff-form'));
    let data = {};
    formData.forEach((value, key) => data[key] = value)
    axios({method: 'put', url: `${contextPath}/admin/staff`, data: data})
        .then(() => {
            $('#staff-table').bootstrapTable('refresh')
            alertify.success('Cập nhật thông tin thành công.')

        })
        .catch(err => console.log(err))
}

function handleAddStaff() {
    const formData = new FormData(document.querySelector('#add-staff-form'));
    let data = {};
    formData.forEach((value, key) => data[key] = value)
    axios({method: 'post', url: `${contextPath}/admin/staff`, data: data})
        .then(() => {
            $('#staff-table').bootstrapTable('refresh')
            $('#myModal').modal('hide');
            document.querySelector('#add-staff-form').reset();
            alertify.success('Bạn đã thêm nhân viên mới.')
        })
        .catch(err => console.log(err))
}

document.querySelector('#add-staff-form').addEventListener('submit', function (event) {
    event.preventDefault()
    handleAddStaff()
})