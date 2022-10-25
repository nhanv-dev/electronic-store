$(function () {
    let $table = $('#discount-table')
    $table.bootstrapTable({
        classes: 'product-table table-borderless',
        url: `${contextPath}/api/discount/`,
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
            {field: 'name', title: 'Chủ đề', class: 'col-200 col-style', sortable: true,},
            {field: 'desc', title: 'Mô tả', class: 'col-200 col-style ', sortable: true,},
            {
                field: 'active',
                title: 'Trạng thái',
                class: 'col-150 col-style',
                sortable: true,
                formatter: activeFormatter
            },
            {field: 'percent', title: 'Giảm', class: 'col-150 col-style ', sortable: true, formatter: percentFormatter},
            {
                field: 'createdAt',
                title: 'Ngày thêm',
                class: 'col-100 w-100',
                sortable: true,
                formatter: createdAtFormatter
            },
            {
                field: 'modifiedAt',
                title: 'Ngày chỉnh sửa',
                class: 'col-150 w-100 text-end',
                sortable: true,
                formatter: modifiedAtFormatter
            }, {field: 'actions', title: 'Thao tác', class: 'col-actions', formatter: actionsFormatter},
        ]
    })

    function activeFormatter(index, row) {
        return row.active ? 'Kích hoạt' : 'Vô hiệu'
    }

    function actionsFormatter(index, row) {
        return `
            <div class="d-flex gap-2 align-items-center justify-content-end">
                <button class="col-actions__delete" onclick="handleDeleteDiscount('${row.id}')">
                    <i class="fa-solid fa-trash-can"></i>
                </button>
            </div>
        `
    }

    function percentFormatter(index, row) {
        return row.percent.toLocaleString(undefined, {style: 'percent', minimumFractionDigits: 0});
    }

    function createdAtFormatter(index, row) {
        const date = new Date(row.createdAt)
        const options = {year: "numeric", month: "2-digit", day: "2-digit"};
        return `
            <span class="col-style">${date.toLocaleString("vi", options)}</span>
        `
    }

    function modifiedAtFormatter(index, row) {
        const date = new Date(row.modifiedAt)
        const options = {year: "numeric", month: "2-digit", day: "2-digit"};
        return `
            <span class="col-style">${date.toLocaleString("vi", options)}</span>
        `
    }

    function detailFormatter(index, row) {
        const createdAt = new Date(row.createdAt)
        const modifiedAt = new Date(row.modifiedAt)
        const options = {year: "numeric", month: "2-digit", day: "2-digit"}

        return `
            <div class="detail-formatter container-fluid">
                <form id="update-discount-form" class="row g-4">
                    <div class="pb-2 mb-2" style="border-bottom: 1px dashed #efefef">
                        <p style="font-weight: 500;font-size: 14px;color: #7E8299">
                            Ngày thêm: ${createdAt.toLocaleString('vi', options)}
                        </p>
                    </div>
                    <div class="col-12 col-lg-5">
                        <input type="hidden" value="${row.id}" name="id">
                        <div class="form-group mb-4">
                            <label for="name">Chủ đề</label>
                            <input type="text" name="discountName" id="name" value="${row.name}">
                        </div>   
                        <div class="form-group mb-4">
                            <label for="desc">Mô tả</label>
                            <input type="text" name="discountDesc" id="desc" value="${row.desc}">
                        </div>
                         <div class="form-group mb-4">
                            <label for="number">Phần trăm giảm</label>
                            <input type="number" name="discountPercent" id="number" value="${row.percent}">
                        </div>   
                        <div class="form-group">
                            <label for="discountStatus">Trạng thái</label>
                            <select id="discountStatus" name="discountStatus">
                                <option value="active" ${row.active && 'selected'}>Kích hoạt</option>
                                <option value="inactive" ${!row.active && 'selected'}>Vô hiệu</option>
                            </select>
                        </div>   
                    </div>
                    <div class="col-12 col-lg-7 d-flex flex-column gap-3 align-items-start justify-content-end">
                        <div class="d-flex align-items-center gap-3" style="font-weight: 500;font-size: 14px;color: #7E8299"> 
                            <p>Chỉnh sửa lần cuối: ${modifiedAt.toLocaleString('vi', options)}</p>
                        </div>
                        <div class="group-button">
                            <button type="button" onclick="handleUpdateDiscount()" class="primary-button">Cập nhật</button>
                            <button type="button" onclick="handleDeleteDiscount('${row.id}')" class="danger-button" >Xóa</button>
                        </div>
                    </div>
                </form>
            </div>
        `
    }
})
