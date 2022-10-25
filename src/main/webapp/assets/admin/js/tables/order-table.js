$(function () {
    let $table = $('#order-table')
    $table.bootstrapTable({
        classes: 'product-table table-borderless',
        url: `${contextPath}/api/order/`,
        method: 'get',
        height: 600,
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
            {field: 'id', title: 'Mã', class: 'col-150 col-style', sortable: true,},
            {field: 'status', title: 'Trạng thái', class: 'col-200 col-style', sortable: true},
            {
                field: 'total',
                title: 'Tổng tiền',
                class: 'col-200 col-style text-end',
                sortable: true,
                formatter: totalFormatter
            },
            {
                field: 'amount',
                title: 'Số lượng',
                class: 'col-150 col-style text-center',
                sortable: true,
                formatter: amountFormatter
            },
            {
                field: 'createdAt',
                title: 'Ngày tạo',
                class: 'col-200 col-style w-100 text-end',
                sortable: true,
                formatter: createdAtFormatter
            },
            {
                field: 'modifiedAt',
                title: 'Chỉnh sửa lần cuối ',
                class: 'col-200 col-style w-100 text-end',
                sortable: true,
                formatter: modifiedAtFormatter
            },
        ]
    })

    function totalFormatter(index, row) {
        return row.total.toLocaleString('vi', {style: 'currency', currency: 'VND'})
    }

    function createdAtFormatter(index, row) {
        return (new Date(row.createdAt)).toLocaleString()
    }

    function modifiedAtFormatter(index, row) {
        return (new Date(row.modifiedAt)).toLocaleString()
    }

    function amountFormatter(index, row) {
        return row.items.length
    }

    function detailFormatter(index, row) {
        const createdAt = (new Date(row.createdAt)).toLocaleString()
        const modifiedAt = (new Date(row.modifiedAt)).toLocaleString()
        const options = {year: "numeric", month: "2-digit", day: "2-digit"}
        let table = row.items?.map((item, index) => {
            const total = (item.product.price * item.quantity).toLocaleString('vi', {
                style: 'currency',
                currency: 'VND'
            })
            return `
                <div class="order-detail-table__body__row">
                    <div class="col-index">${index + 1}</div>
                    <div class="col-id">${item.product.id}</div>
                    <div class="col-id text-end">${total}</div>
                    <div class="col-amount">${item.quantity}</div>
                    <div class="col-amount">${item.product.inventory.quantity}</div>
                    <div class="col-action">
                        <a href="${contextPath}/admin/product?action=edit&id=${item.product.id}">Xem</a>
                    </div>
                </div>
            `
        }).join('')
        return `
            <div class="detail-formatter container-fluid">
                <form id="update-order-form" class="row g-4">
                    <div class="d-flex gap-4 align-items-center pb-2 mb-2" style="border-bottom: 1px dashed #efefef">
                        <p style="font-weight: 500;font-size: 14px;color: #7E8299">
                            Ngày tạo: ${createdAt.toLocaleString('vi', options)}
                        </p>
                       <p style="font-weight: 500;font-size: 14px;color: #7E8299">Chỉnh sửa lần cuối: ${modifiedAt.toLocaleString('vi', options)}</p>
                    </div>
                    <div class="col-12 col-lg-4">
                        <input type="hidden" value="${row.id}" name="id">
                        <div class="row g-4 mb-4 align-items-center">
                            <p class="col-6 col-lg-4 name">Khách hàng:</p>
                            <p class="col">${row.userId}</p>
                        </div>
                        <div class="row g-4 mb-4 align-items-center">
                            <div class="col-6 col-lg-4 name">Trạng thái:</div>
                            <div class="col">
                                <select name="orderStatus">
                                    <option value="OS01">Chờ xác nhận</option>
                                    <option value="OS02">Đang vận chuyển</option>
                                    <option value="OS03">Đã hoàn tất</option>
                                </select>
                            </div>
                        </div>
                        <div class="row g-4 mb-4 align-items-center">
                            <p class="col-6 col-lg-4 name">Tổng tiền:</p>
                            <p class="col total">${row.total.toLocaleString('vi', {style: 'currency', currency: 'VND'})}</p>
                        </div>
                        <div class="d-flex flex-column gap-3 align-items-start justify-content-end">
                            <div class="group-button">
                                <button type="button" onclick="handleUpdateOrder()" class="primary-button">Cập nhật</button>
                                <button type="button" onclick="handleDeleteOrder('${row.id}')" class="danger-button" >Xóa</button>
                            </div>
                        </div>     
                    </div>
                    <div class="col">
                        <div class="order-detail-table">
                            <div class="order-detail-table__header">
                                <div class="col-index">#</div>
                                <div class="col-id">Mã sản phẩm</div>
                                <div class="col-id text-end">Giá tiền</div>
                                <div class="col-amount">Số lượng đặt</div>
                                <div class="col-amount">Tồn kho</div>
                                <div class="col-action">Thao tác</div>
                            </div>
                           <div class="order-detail-table__body">
                                ${table}
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        `
    }
})
