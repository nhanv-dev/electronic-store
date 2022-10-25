const discountForm = document.querySelector('#add-discount-form')
discountForm?.addEventListener('submit', handleAddDiscount)

function handleDeleteDiscount(id) {
    axios({method: 'delete', url: `${contextPath}/api/discount`, data: {id}})
        .then(() => $('#discount-table').bootstrapTable('refresh'))
        .catch(err => console.log(err))
}

function handleUpdateDiscount() {
    const formData = new FormData(document.querySelector('#update-discount-form'));
    let data = {};
    formData.forEach((value, key) => data[key] = value)
    axios({method: 'put', url: `${contextPath}/api/discount`, data: data})
        .then(() => $('#discount-table').bootstrapTable('refresh'))
        .catch(err => console.log(err))
}


// Add discount


function handleAddDiscount(event) {
    event.preventDefault()
    const formData = new FormData(discountForm);
    let data = {};
    formData.forEach((value, key) => data[key] = value)
    axios({method: 'post', url: `${contextPath}/api/discount`, data: data})
        .then((response) => {
            const discount = JSON.parse(response.data.discount)
            $('#discountId').append(`
                <option value="${discount.id}" selected>
                    ${discount.name}
                </option>
            `)
            $('select')?.niceSelect('update')
            $('#addDiscount')?.modal('hide')
            $('#discount-table')?.bootstrapTable('refresh')
        })
        .catch(err => console.log(err))
}