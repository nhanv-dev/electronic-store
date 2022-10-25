function handleFavoriteItem(id) {
    axios({method: "post", url: `${contextPath}/wishlist`, data: {productId: id},})
        .then(response => {
            updateWishlistAmount(response.data)
            showSuccessToast("Đã yêu thích sản phẩm")
        })
        .catch(() => showFailToast("Vui lòng thử lại"))
}

function handleRemoveFavoriteItem(element, id) {
    console.log(element)
    axios({method: "delete", url: `${contextPath}/wishlist`, data: {id: id},})
        .then(response => {
            updateWishlistAmount(response.data)
            $(element).closest('.wishlist-item').remove();
            showSuccessToast("Đã bỏ yêu thích sản phẩm")
        })
        .catch((err) => console.log(err))
        .catch(() => showFailToast("Vui lòng thử lại"))
}

function updateWishlistAmount(data) {
    const wishList = JSON.parse(data.wishList)
    $('#header-amount-wishlist')?.text(wishList.items.length)
    if (wishList.items.length <= 0) {
        $('#wishlist-container')?.html(`
                 <section class="py-5">
                    <div class="container text-center">
                        <div class="list-product--not-found">
                            <div class="list-product--not-found__image">
                                <img src="https://cdni.iconscout.com/illustration/premium/thumb/sorry-item-not-found-3328225-2809510.png"
                                     alt="not found image"/>
                            </div>
                            <h5 class="list-product--not-found__message">Bạn chưa yêu thích sản phẩm nào.</h5>
                            <a class="list-product--not-found__link"
                               href="${contextPath}/category/">
                                Tiếp tục mua sắm
                            </a>
                        </div>
                    </div>
                </section>`
        )
    }
    $('#span-amount-footer')?.text(`Hiện có ${wishList.items.length} sản phẩm được yêu thích.`)
}
