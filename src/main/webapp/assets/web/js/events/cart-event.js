function getDataProduct(element) {
    const productId = $(element).data('product-id')
    const quantity = $(element).parent().find('input[type=number]').val()
    return {productId, quantity}
}

function handleAddToCart(element) {
    const data = getDataProduct(element)
    axios({method: "post", url: `${contextPath}/cart`, data: data,})
        .then((response) => {
            handleUpdateCart(response.data)
            showSuccessToast("Đã thêm vào giỏ hàng")
        })
        .catch((error) => {
            console.log(error)
            showFailToast("Vui lòng thử lại")
        })
}

function handleUpdateQuantityCartItem(element, value) {
    const input = $(element).parent().find('input[type=number]')
    const id = $(element).data('id')
    const max = parseInt(input.attr('max'))
    let quantity = parseInt(input.val()) + value
    if (quantity > max && value >= 1) quantity = max
    input.val(quantity)
    if (quantity <= 0) {
        axios({method: 'delete', url: `${contextPath}/cart`, data: {id: id}})
            .then((response) => {
                handleUpdateCart(response.data)
                handleUpdatePageCart(element, response.data)
                $(element).closest('.cart-item').remove()
                showSuccessToast("Đã xóa khỏi giỏ hàng")
            })
            .catch(() => showFailToast("Vui lòng thử lại"))
    } else {
        axios({method: 'put', url: `${contextPath}/cart`, data: {id, quantity: quantity + ""}})
            .then((response) => {
                handleUpdateCart(response.data)
                handleUpdatePageCart(element, response.data)
            })
            .catch((error) => console.log(error))
    }
}

function handleDeleteAll() {
    axios({method: 'delete', url: `${contextPath}/cart`, data: {action: "clear"}})
        .then((response) => {
            handleUpdateCart(response.data)
            handleUpdatePageCart(element, response.data)
            showSuccessToast("Đã xóa khỏi giỏ hàng")
        })
        .catch(() => showFailToast("Vui lòng thử lại"))
}

function handleDeleteCartItem(element) {
    const id = $(element).data("id")
    axios({method: 'delete', url: `${contextPath}/cart`, data: {id: id}})
        .then((response) => {
            handleUpdateCart(response.data)
            handleUpdatePageCart(element, response.data)
            $(element).closest('.cart-item').remove()
            showSuccessToast("Đã xóa khỏi giỏ hàng")
        })
        .catch(() => showFailToast("Vui lòng thử lại"))

}

function handleRemoveCartItem(element, id) {
    axios({method: 'delete', url: `${contextPath}/cart`, data: {id: id}})
        .then((response) => {
            handleUpdateCart(response.data)
            // handleUpdatePageCart(element, response.data)
            showSuccessToast("Đã xóa khỏi giỏ hàng")
        })
        .catch((error) => {
            console.log(error)
            showFailToast("Vui lòng thử lại")
        })
}


function handleUpdateCart(data) {
    const cart = JSON.parse(data.cart)
    const formatter = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'});
    $('#cart-sidebar .offcanvas-body')?.html(generateCartItemSidebar(cart))
    $('#header-amount-cart')?.text(cart.amount)
    $('#header-total-cart')?.text(formatter.format(cart.total))
    $('#header-total-cart-sidebar')?.text(formatter.format(cart.total))
}

function handleUpdatePageCart(element, data) {
    const cart = JSON.parse(data.cart)
    const formatter = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'});
    if (cart.items.length > 0) {
        cart.items.forEach(item => {
            if (item.id === $(element).data('id')) {
                let total = item.product.price * item.quantity
                if (item.product.discount?.active) total = (item.product.price * (1 - item.product.discount.percent)) * item.quantity
                $(element).closest('.cart-item').children('.cart-item__total')?.text(formatter.format(total))
                if (item.quantity <= item.product.inventory.quantity) {
                    console.log($(element).closest('.cart-item').children('.warning-quantity'))
                    $(element).closest('.cart-item').children('.warning-quantity')?.remove()
                }
            }
        })
        $('.cart-total').text(formatter.format(cart.total))
        $('.cart-quantity').text(`${cart.amount} sản phẩm`)
    } else {
        $('#section-cart-page').html(`
         <div class="container text-center">
            <div class="list-product--not-found">
                <div class="list-product--not-found__image">
                    <img src="https://cdni.iconscout.com/illustration/premium/thumb/sorry-item-not-found-3328225-2809510.png"
                         alt="not found image"/>
                </div>
                <h5 class="list-product--not-found__message">Bạn chưa thêm sản phẩm vào giỏ hàng.</h5>
                <a class="list-product--not-found__link" href="${contextPath}/category/">
                    Tiếp tục mua sắm
                </a>
            </div>
        </div>
        `)
    }
}

