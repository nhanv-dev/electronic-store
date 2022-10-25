const generateContentQuickView = (product) => {
    const {images} = product
    let imagesElement = images.map((image, index) => {
        return `<div class="modal-images__slide__image"><img src="${image.url}" alt="${image.url}" onmouseover="changeImageQuickView(this)"/></div>`
    }).join('')
    if (images.length > 4) {
        imagesElement = `
            <button onclick="prevSlideImage()" class="modal-images__slide-container__button-prev">
                <i class="fa-solid fa-chevron-left"></i>
            </button>
            <div class="modal-images__slide">${imagesElement}</div>
            <button onclick="nextSlideImage()" class="modal-images__slide-container__button-next">
                <i class="fa-solid fa-chevron-right"></i>
            </button>`
    } else {
        imagesElement = `
            <div class="modal-images__slide">${imagesElement}</div>`
    }
    let priceElement = `
        <span>
            ${product.price?.toLocaleString('vi', {style: 'currency', currency: 'VND'})}
        </span>
    `
    if (product.discount !== null && product.discount.active) {
        product.salePrice = product.price * (1 - product.discount.percent)
        priceElement = `
            <span class="product-price--new">
                ${product.salePrice?.toLocaleString('vi', {style: 'currency', currency: 'VND'})}
            </span>
            <span class="${product.salePrice ? 'product-price--old' : 'product-price--new'}">
                ${product.price?.toLocaleString('vi', {style: 'currency', currency: 'VND'})}
            </span>
        `
    }

    return `
        <div class="container-fluid">
            <div class="row g-4">
                <div class="col-12 col-md-5">
                    <div class="modal-images">
                        <div class="modal-images__container">
                            <div class="modal-images__image">
                                <img src="${images[0] ? images[0].url : contextPath+'/assets/images/no-image.png'}" alt="${product.id}"/>
                            </div>
                            <div class="modal-images__slide-container">
                                ${imagesElement}
                            </div>    
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="product-content">
                        <h5 class="product-title"> ${product.name}</h5>
                        <div class="product-subtitle">
                            <a href="${contextPath}/category/${product.category.slug}" class="product-category">
                                <span>${product.category.name}</span>
                            </a>
                            <span>|</span>
                            <div class="product-sku">
                                <span>SKU:</span>
                                <span>${product.sku}</span>
                            </div>
                        </div>
                        <div class="${product.inventory.quantity > 0 ? 'product-status product-status--available' : 'product-status product-status--warning'}">
                            ${product.inventory.quantity > 0 ?
                                '<i class="fa-regular fa-circle-check"></i> Còn hàng' :
                                '<i class="fa-solid fa-circle-exclamation"></i> Hết hàng'}
                        </div>
                        <div class="product-price">
                            ${priceElement}
                        </div>
                        <div class="product-desc mb-3">
                            ${product.desc}
                        </div>
                        <div class="product-group-button">
                            <div class="d-flex flex-wrap gap-3 align-items-center mb-4">
                                 <div class="button-quantity">
                                    <button type="button"><i class="fa-solid fa-minus"></i></button>
                                    <label>
                                        <input type="number" tabindex="-1" value="1" min="0" max="${product.inventory.quantity}"/>
                                    </label>
                                    <button type="button"><i class="fa-solid fa-plus"></i></button>
                                </div>
                                <button class="button-cart" onclick="handleAddToCart('${product.id}')">
                                    <i class="fa-solid fa-cart-arrow-down"></i>
                                    Thêm vào giỏ hàng
                                </button>
                            </div>
                            <div class="d-flex flex-wrap gap-5 align-items-center">
                                <button class="button-options" onclick="handleFavoriteItem('${product.id}')">
                                    <i class="fa-regular fa-heart"></i>
                                    Thêm vào yêu thích
                                </button>
                                <button class="button-options" onclick="handleCompareItem('${product.id}')">
                                    <i class="fa-solid fa-layer-group"></i>
                                    So sánh
                                </button>
                            </div>   
                        </div>
                    </div>
                </div>
            </div>
        </div>`
}

const generateCartItemSidebar = (cart) => {
    if (cart.amount <= 0) {
        return `
            <div class="cart-message" >
                <img src="https://cdni.iconscout.com/illustration/premium/thumb/sorry-item-not-found-3328225-2809510.png" alt="cart-message">
                <h5>Giỏ hàng của bạn rỗng</h5>
            </div>
        `
    }
    let formatter = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'});
    return cart.items.map((item) => {
        let priceElement = null, product = item.product
        if (product.discount && product.discount.active) {
            priceElement =
                `<span class="cart-item__price cart-item__price--new">${formatter.format(product.price * (1 - product.discount.percent))}</span>
                 <span class="cart-item__price cart-item__price--old">${formatter.format(product.price)}</span>`
        } else {
            priceElement = `<span class="cart-item__price">${formatter.format(product.price)}</span>`
        }
        return `
            <div class="cart-item">
                <a href="${contextPath}/product/${item.product.slug}"
                class="cart-item__image">
                    <img src="${item.product.images[0] ? item.product.images[0].url :  contextPath+'/assets/images/no-image.png'}" alt="${item.product.id}"/>
                </a>
                <div class="cart-item__content">
                    <a href="${contextPath}/product/${item.product.slug}" class="cart-item__title">${item.product.name}</a>
                    <div class="d-flex align-items-end gap-3 mb-1">${priceElement}</div>
                    <div class="button-quantity">
                        <button onclick="handleUpdateQuantityCartItem(this, -1)" type="button" data-id="${item.id}">
                            <i class="fa-solid fa-minus"></i>
                        </button>
                        <label>
                            <input id="input-quantity-product" type="number" tabindex="-1" value="${item.quantity}" min="0" max="${item.product.inventory.quantity}"/>
                        </label>
                        <button onclick="handleUpdateQuantityCartItem(this, 1)" type="button" data-id="${item.id}">
                            <i class="fa-solid fa-plus"></i>
                        </button>
                    </div>
                </div>
                <div class="cart-item__button-remove">
                    <button onclick="handleRemoveCartItem('${item.id}')"><i class="fa-solid fa-xmark"></i></button>
                </div>
            </div>
        `
    }).join('')
}

function nextSlideImage() {

}

function prevSlideImage() {

}
