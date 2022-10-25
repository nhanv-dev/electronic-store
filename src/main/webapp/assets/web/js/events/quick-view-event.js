const productModal = new bootstrap.Modal(document.getElementById('productDetailModal'))
const contentProductModal = document.querySelector('#productDetailModal .modal-body')
const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
})

function handleQuickView(id) {
    axios.get(`${contextPath}/api/product/${id}`)
        .then(response => {
            if (response.status === 200) {
                contentProductModal.innerHTML = generateContentQuickView(response.data)
                productModal.show()
            }
        })
        .catch((err) => {
            showFailToast("Vui lòng thử lại")
        })
}
