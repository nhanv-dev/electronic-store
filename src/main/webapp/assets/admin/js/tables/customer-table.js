$(function () {
    let $table = $('#staff-table')
    $table.bootstrapTable({
        classes: 'product-table table-borderless',
        url: `${contextPath}/api/user/?role=customer`,
        method: 'get',
        height: 550,
        smartDisplay: true,
        locale: 'vi-VN',
        clickToSelect: true,
        search: true,
        searchSelector: "#search",
        detailView: true,
        detailViewIcon: true,
        detailFormatter: detailFormatter,
        pagination: true,
        toolbar: "#toolbar",
        loadingFontSize: '18px',
        columns: [
            {field: 'name', title: 'Họ & Tên', class: 'col-style col-200', sortable: true,},
            {field: 'username', title: 'Tài khoản', class: 'col-style col-100 ', sortable: true,},
            {field: 'email', title: 'Email', class: 'col-style col-100 ', sortable: true,},
            {field: 'phone', title: 'Số điện thoại', class: 'col-style col-150 ', sortable: true,},
            {field: 'address', title: 'Địa chỉ', class: 'col-style col-200', sortable: true,},
            {
                field: 'createdAt',
                title: 'Ngày thêm',
                class: 'col-style col-100 w-100',
                sortable: true,
                formatter: createdAtFormatter
            },
            {
                field: 'modifiedAt',
                title: 'Ngày chỉnh sửa',
                class: 'col-style col-150 w-100 text-end',
                sortable: true,
                formatter: modifiedAtFormatter
            },
        ]
    })

    function createdAtFormatter(index, row) {
        const date = new Date(row.createdAt)
        const options = {year: "numeric", month: "2-digit", day: "2-digit"};
        return `
            <span>${date.toLocaleString("vi", options)}</span>
        `
    }

    function modifiedAtFormatter(index, row) {
        const date = new Date(row.modifiedAt)
        const options = {year: "numeric", month: "2-digit", day: "2-digit"};
        return `
            <span>${date.toLocaleString("vi", options)}</span>
        `
    }

    function detailFormatter(index, row) {
        const createdAt = new Date(row.createdAt)
        const modifiedAt = new Date(row.modifiedAt)
        const options = {year: "numeric", month: "2-digit", day: "2-digit"}

        return `
            <div class="detail-formatter container-fluid">
                <form id="update-staff-form" class="row g-4">
                    <div class="d-flex gap-4 align-items-center pb-2 mb-2" style="border-bottom: 1px dashed #efefef">
                        <p style="font-weight: 500;font-size: 14px;color: #7E8299">
                            Ngày thêm: ${createdAt.toLocaleString('vi', options)}
                        </p>  
                        <p style="font-weight: 500;font-size: 14px;color: #7E8299">
                            Chỉnh sửa lần cuối: ${modifiedAt.toLocaleString('vi', options)}
                        </p>
                    </div>
                    <div class="col-12 col-lg-5">
                        <input type="hidden" value="${row.id}" name="id">
                        <div class="form-group mb-4">
                            <label for="name">Họ & tên</label>
                            <input type="text" name="name" id="name" disabled value="${row.name}">
                        </div>
                         <div class="form-group mb-4">
                            <label for="address">Địa chỉ</label>
                            <input type="text" name="address" id="address" disabled value="${row.address}">
                        </div>
                        <div class="form-group mb-4">
                            <label for="phone">Số điện thoại</label>
                            <input type="text" name="phone" id="phone" disabled value="${row.phone}">
                        </div>
                         <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" name="email" id="email" disabled value="${row.email}">
                        </div>   
                    </div>
                    <div class="col-12 col-lg-7 d-flex flex-column gap-3 align-items-start justify-content-end">
                    
                    </div>
                </form>
            </div>
        `
    }
})
