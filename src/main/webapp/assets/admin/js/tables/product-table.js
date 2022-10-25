$(function () {
    let $table = $('#product-table')
    $table.bootstrapTable({
        classes: 'product-table table-borderless',
        url: `${contextPath}/api/product/`,
        method: 'get',
        height: 800,
        smartDisplay: true,
        locale: 'vi-VN',
        clickToSelect: true,
        search: true,
        searchSelector: "#search",
        pagination: true,
        detailView: true,
        detailViewIcon: true,
        detailFormatter: detailFormatter,
        toolbar: "#toolbar",
        loadingFontSize: '18px',
        columns: [
            {field: 'name', title: 'Tên sản phẩm', class: 'w-100', sortable: true, formatter: nameFormatter},
            {
                field: 'inventory',
                title: 'Số lượng',
                class: 'col-quantity',
                sortable: true,
                formatter: quantityFormatter
            },
            {field: 'category', title: 'Loại', class: 'col-category', sortable: true, formatter: categoryFormatter},
            {field: 'price', title: 'Giá', class: 'col-price', sortable: true, formatter: priceFormatter},
            {field: 'sku', title: 'SKU', class: 'col-sku', sortable: true, formatter: skuFormatter},
            {field: 'actions', title: 'Thao tác', class: 'col-actions', formatter: actionsFormatter},
        ]
    })

    function categoryFormatter(index, row) {
        return `
            <a href="${contextPath}/admin/category?id=${row.category.id}" class="col-category">
                ${row.category.name}
            </a>
        `
    }

    function nameFormatter(index, row) {
        let image = `
            <a href="${contextPath}/admin/product?action=edit&id=${row.id}" class="col-image">
               <img src="${contextPath}/assets/images/no-image.png" alt="${row.id}"/>
            </a>`
        if (row.images?.length > 0) {
            image = `
            <a href="${contextPath}/admin/product?action=edit&id=${row.id}" class="col-image">
                <img src="${row.images[0].url}" alt="${row.id}"/>
            </a>
            `
        }
        return `
            <div class="d-flex align-items-start justify-content-start gap-3">
                ${image}
                <a href="${contextPath}/admin/product?action=edit&id=${row.id}" class="col-name">${row.name}</a>
            </div>
        `

    }

    function quantityFormatter(index, row) {
        if (row.inventory.quantity <= 0) {
            return `
            <span class="col-quantity--danger">Hết hàng</span>
            <span class="danger-color"> ${row.inventory.quantity} </span>
            `
        } else if (row.inventory.quantity <= 10) {
            return `
            <span class="col-quantity--warning">Còn ít</span>
            <span class="warning-color"> ${row.inventory.quantity} </span>
            `
        } else {
            return `<span> ${row.inventory.quantity} </span>`
        }
    }

    function priceFormatter(index, row) {
        return row.price?.toLocaleString('vi', {style: 'currency', currency: 'VND'});
    }

    function skuFormatter(index, row) {
        return row.sku || 'Không có';
    }

    function actionsFormatter(index, row) {
        return `
            <div class="d-flex gap-2 align-items-center justify-content-end">
                <a href="${contextPath}/admin/product?action=edit&id=${row.id}" class="col-actions__edit">
                    <i class="fa-solid fa-pen-to-square"></i>
                </a>
                <button class="col-actions__delete" onclick="handleDeleteProduct('${row.id}')">
                    <i class="fa-solid fa-trash-can"></i>
                </button>
            </div>
        `
    }


    function detailFormatter(index, row) {
        let images = row.images.length > 0 && row.images.map((image, index) => (
            `<div onmouseover="changeImage(this)" class="product-detail__slide__image">
                <img src="${image.url}" alt="${row.name}"/>
            </div>`
        )).join("")
        if (row.images?.length > 1) {
            images = `
                <div class="position-relative">
                   <button onclick="prevSlide()" class="product-detail__slide__button-prev">
                        <i class="fa-solid fa-chevron-left"></i>
                   </button>
                   <div class="product-detail__slide">                           
                       ${images}   
                   </div>
                   <button onclick="nextSlide()" class="product-detail__slide__button-next">
                       <i class="fa-solid fa-chevron-right"></i>
                   </button>
                </div>`
        } else {
            images = ''
        }
        let image = `<div class="product-detail__image"><img src="${contextPath}/assets/images/no-image.png" alt="${row.name}"/></div>`
        if (row.images?.length > 0)
            image = `<div class="product-detail__image"><img src="${row.images[0].url}" alt="${row.name}"/></div>`
        let salePrice = row.discount?.active && (row.price * (1 - row.discount.percent))
        return `
            <div class="product-detail">
                <div class="row g-5">
                    <div style="width: 320px; min-width: 320px">
                       ${image}
                       ${images}
                    </div>
                    <div class="col">
                        <div class="ms-3 py-2">
                            <div class="mb-3">
                                <div class="">
                                    <span class="product-detail__title">Mã sản phẩm:</span>
                                    <span class="product-detail__id">${row.id}</span>
                                </div>
                            </div>
                            <div class="d-flex gap-5 mb-3">
                                <div class="">
                                    <span class="product-detail__title">Số lượng:</span>
                                    <span class="product-detail__quantity">${row.inventory?.quantity}</span>
                                </div>
                                <div class="">
                                    <span class="product-detail__title">Sku:</span>
                                    <span class="product-detail__sku">${row.sku || "Không có"}</span>
                                </div>
                            </div>
                            <div class="mb-3">
                                <span class="product-detail__title">Tên sản phẩm:</span>
                                <span class="product-detail__name">${row.name}</span>
                            </div>
                             <div class="mb-3 row g-4">
                                <div class="col">
                                    <span class="product-detail__title">Mã giảm giá:</span>
                                    <span class="product-detail__name">${row.discount?.name || 'Không có'}</span>
                                </div>
                                <div class="col">
                                    <span class="product-detail__title">Phần trăm giảm:</span>
                                    <span class="product-detail__name">${row.discount?.percent || 'Không có'}</span>
                                </div>
                                <div class="col">
                                    <span class="product-detail__title">Trạng thái:</span>
                                    <span class="product-detail__name">${row.discount ? (row.discount.active ? 'Kích hoạt' : 'Vô hiệu') : 'Không có'}</span>
                                </div>
                            </div>
                            <div class="mb-3 d-flex gap-5">
                                <div style="min-width: max-content">
                                    <span class="product-detail__title">Giá gốc:</span>
                                    <span class="product-detail__price">
                                        ${row.price?.toLocaleString('vi', {style: 'currency', currency: 'VND'})}
                                    </span>
                                </div>
                                <div style="min-width: max-content">
                                    <span class="product-detail__title">Giá bán:</span>
                                    <span class="product-detail__price">
                                        ${(salePrice || row.price).toLocaleString('vi', {style: 'currency', currency: 'VND'})}
                                    </span>
                                </div>
                            </div>
                             <div class="mb-3">
                                <span class="product-detail__title">Mô tả:</span>
                                <div class="product-detail__desc">${row.desc}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           `
    }
})

function changeImage(element) {
    const src = $(element).children('img').attr('src')
    $('.product-detail__image img').attr('src', src)
}

function nextSlide(e) {
    const scrollLeft = $('.product-detail__slide').scrollLeft();
    $('.product-detail__slide').scrollLeft(scrollLeft + 90)
}

function prevSlide(e) {
    const scrollLeft = $('.product-detail__slide').scrollLeft();
    $('.product-detail__slide').scrollLeft(scrollLeft - 90)
}