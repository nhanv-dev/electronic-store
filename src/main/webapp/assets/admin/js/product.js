if (document.querySelector('#editor')) ClassicEditor.create(document.querySelector('#editor'))

const form = document.querySelector('#product-form')
const fileList = []
form?.addEventListener('submit', (event) => handleSaveProduct(event))

$("#choose-image").change(function () {
    previewImages(this);
});

function handleSaveProduct(event) {
    event.preventDefault()
    alertify.confirm("Hãy kiểm tra trước khi lưu sản phẩm.",
        function () {
            document.getElementById('choose-image').files = convertDataTransfer()
            const formData = new FormData(form);
            axios.post(`${contextPath}/api/product`, formData, {headers: {"Content-Type": 'multipart/form-data'}})
                .then(response => {
                    const queryString = window.location.search;
                    const urlParams = new URLSearchParams(queryString);
                    const action = urlParams.get('action')
                    if (action === 'add') {
                        window.location.href = `${contextPath}/admin/product?action=edit&id=${response.data.id}`
                    } else {
                        $('#slug').attr('href', `${contextPath}/product/${response.data.slug}`)
                        $('#preview-images').find('.preview-images__image').remove()
                        const images = response.data.images
                        images.forEach((image) => {
                            const html = `
                                <div class="preview-images__image">
                                    <img src="${image.url}" alt="${image.id}"/>
                                    <button onclick="handleDeleteImage(this,'${image.id}', null,event)"><i class="fa-solid fa-xmark"></i></button>
                                </div>
                            `
                            $('#preview-images').append(html)
                        })
                    }
                })
                .catch(() => {
                    alertify.error('Thao tác thất bại')
                })
            alertify.success('Bạn đã lưu sản phẩm')
        },
        function () {
            alertify.error('Bạn đã hủy thao tác')
        }).set({title: "Lưu sản phẩm"}).set({labels: {ok: 'Lưu', cancel: 'Hủy bỏ'}})
}

function handleDeleteProduct(id) {
    alertify.confirm(`Bạn có chắc chắn muốn xóa sản phẩm có mã ${id}.`,
        function () {
            axios({method: 'delete', url: `${contextPath}/api/product`, data: {id, action: 'deleteProduct'}})
                .then(() => {
                    $('#product-table').bootstrapTable('refreshOptions', {})
                    alertify.success('Bạn đã xóa sản phẩm.')
                })
                .catch((error) => alertify.error(error))

        },
        function () {
            alertify.error('Bạn đã hủy thao tác');
        }).set({title: "Xóa sản phẩm"}).set({labels: {ok: 'Xóa', cancel: 'Hủy bỏ'}})
}

function handleDeleteImage(element, id, action, event) {
    event.preventDefault()
    event.stopPropagation()
    alertify.confirm(`Bạn có chắc chắn muốn xóa hình ảnh của sản phẩm.`,
        function () {
            if (action === 'removeFileList') {
                removeFileFromFileList(id)
            } else {
                axios({method: 'delete', url: `${contextPath}/api/product`, data: {id, action: 'deleteImage'}})
                    .then(() => {
                        alertify.success('Bạn đã xóa hình ảnh.')
                        element.closest('.preview-images__image').remove()
                    })
                    .catch(() => alertify.error('Thao tác thất bại'))
            }

        },
        function () {
            alertify.error('Bạn đã hủy thao tác')
        }
    ).set({title: "Xóa sản phẩm"}).set({labels: {ok: 'Xóa', cancel: 'Hủy bỏ'}})

}

function previewImages(input) {
    if (Array.from(input.files).length > 0) {
        $('.preview-images__no-image').addClass('d-none')
        Array.from(input.files).forEach(function (file, index) {
            const reader = new FileReader();
            if (!isContainFileList(file)) {
                fileList.push(file)
                reader.onload = function (event) {
                    $('#preview-images').append(
                        `<div class="preview-images__image">
                        <img src="${event.target.result}" alt="your image"/>
                        <button onclick="handleDeleteImage(this,'${file.name}', 'removeFileList',event)"><i class="fa-solid fa-xmark"></i></button>
                    </div>`)
                }
                reader.readAsDataURL(file);
            }
        })
    } else {
        $('.preview-images__no-image').addClass('d-block')
    }
    input.files = convertDataTransfer()
}

function convertDataTransfer() {
    const data = new DataTransfer()
    for (let i = 0; i < fileList.length; i++)
        data.items.add(fileList[i])
    return data.files;
}

function removeFileFromFileList(name) {
    fileList.filter(file => file.name !== name)
}

function isContainFileList(file) {
    for (let i = 0; i < fileList.length; i++) {
        if (file.name === fileList[i].name)
            return true
    }
    return false
}

