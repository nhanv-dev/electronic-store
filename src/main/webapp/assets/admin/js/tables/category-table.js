$(function () {
    let $table = $('#category-table')
    $table.bootstrapTable({
        classes: 'product-table table-borderless',
        url: `${contextPath}/api/category/`,
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
            {field: 'name', title: 'Tên danh mục', class: 'col-300 col-style', sortable: true,},
            {field: 'numberOfProduct', title: 'Số lượng sản phẩm', class: 'col-200 col-style ', sortable: true,},
            {
                field: 'createdAt',
                title: 'Ngày thêm',
                class: 'col-200 w-100 text-end',
                sortable: true,
                formatter: createdAtFormatter
            },
            {
                field: 'modifiedAt',
                title: 'Ngày chỉnh sửa',
                class: 'col-200 w-100 text-end',
                sortable: true,
                formatter: modifiedAtFormatter
            }, {field: 'actions', title: 'Thao tác', class: 'col-actions', formatter: actionsFormatter},
        ]
    })


    function actionsFormatter(index, row) {
        console.log(row)
        return `
            <div class="d-flex gap-2 align-items-center justify-content-end">
                <button class="col-actions__delete" onclick="handleDeleteCategory('${row.id}')">
                    <i class="fa-solid fa-trash-can"></i>
                </button>
            </div>
        `
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
                <form id="update-category-form" class="row g-4">
                    <div class="pb-2 mb-2" style="border-bottom: 1px dashed #efefef">
                        <p style="font-weight: 500;font-size: 14px;color: #7E8299">
                            Ngày thêm: ${createdAt.toLocaleString('vi', options)}
                        </p>
                    </div>
                    <div class="col-12 col-lg-5">
                        <input type="hidden" value="${row.id}" name="id">
                        <div class="form-group mb-4">
                            <label for="categoryName">Tên danh mục</label>
                            <input type="text" name="categoryName" id="categoryName" value="${row.name}">
                            <input type="hidden" name="categoryId" id="categoryId" value="${row.id}">
                        </div>
                        <div style="font-size: 15px;font-weight: 500;color: #7E8299;">
                            Hiện có ${row.numberOfProduct} sản phẩm trong danh mục.
                        </div>
                    </div>
                    <div class="col-12 col-lg-7 d-flex flex-column gap-3 align-items-start justify-content-end">
                        <div class="d-flex align-items-center gap-3" style="font-weight: 500;font-size: 14px;color: #7E8299"> 
                            <p>Chỉnh sửa lần cuối: ${modifiedAt.toLocaleString('vi', options)}</p>
                        </div>
                        <div class="group-button">
                            <button type="button" onclick="handleUpdateCategory()" class="primary-button">Cập nhật</button>
                            <button type="button" onclick="handleDeleteCategory('${row.id}')" class="danger-button" >Xóa</button>
                        </div>
                    </div>
                </form>
            </div>
        `
    }
})
