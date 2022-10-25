const categoryForm = document.querySelector('#add-category-form')
categoryForm?.addEventListener('submit', (event) => {
    event.preventDefault()
    alertify.confirm("Hãy kiểm tra trước khi lưu danh mục.",
        function () {
            const formData = new FormData(categoryForm);
            let data = {};
            formData.forEach((value, key) => data[key] = value)
            axios({method: 'post', url: `${contextPath}/api/category`, data: data})
                .then((response) => {
                    const category = JSON.parse(response.data.category)
                    $('#categoryId').append(`
                        <option value="${category.id}" selected>
                            ${category.name}
                        </option>
                    `)
                    $('select')?.niceSelect('update')
                    $('#addCategory')?.modal('hide')
                    $('#category-table')?.bootstrapTable('refresh')
                    alertify.success('Bạn đã lưu danh mục')
                })
                .catch((err) => {
                    console.log(err)
                    alertify.error('Thao tác thất bại')
                })
        },
        function () {
            alertify.error('Bạn đã hủy thao tác')
        }).set({title: "Lưu danh mục"}).set({labels: {ok: 'Lưu', cancel: 'Hủy bỏ'}})
})

function handleDeleteCategory(id) {
    alertify.confirm("Xóa danh mục sẽ xóa tất cả sản phẩm thuộc danh mục đó.",
        function () {
            const formData = new FormData(categoryForm);
            let data = {};
            formData.forEach((value, key) => data[key] = value)
            axios({method: 'delete', url: `${contextPath}/api/category`, data: {id}})
                .then((response) => {
                    $('#category-table')?.bootstrapTable('refresh')
                    alertify.success('Bạn đã xóa danh mục')
                })
                .catch((err) => {
                    console.log(err)
                    alertify.error('Thao tác thất bại')
                })
        },
        function () {
            alertify.error('Bạn đã hủy thao tác')
        }).set({title: "Xóa danh mục"}).set({labels: {ok: 'Xóa', cancel: 'Hủy bỏ'}})
}

function handleUpdateCategory() {
    const formData = new FormData(document.querySelector('#update-category-form'));
    let data = {};
    formData.forEach((value, key) => data[key] = value)
    axios({method: 'put', url: `${contextPath}/api/category`, data: data})
        .then(() => $('#category-table').bootstrapTable('refresh'))
        .catch(err => console.log(err))
}
