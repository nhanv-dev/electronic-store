function handleCompareItem(id) {
    const data = {
        method: 'post',
        url: `${contextPath}/compare`,
        data: {productId: id}
    }
    axios(data)
        .then(() => {
            showSuccessToast("Đã thêm sản phẩm vào danh sách so sánh")
        })
        .catch(() => showFailToast("Vui lòng thử lại"))

}
