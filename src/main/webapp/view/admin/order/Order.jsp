<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 24/04/2022
  Time: 6:15 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="vi_VN"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Valex | Quản lý hóa đơn</title>
    <%@ include file="/common/admin/style.jsp" %>
    <style>
        .ck-editor__editable {
            min-height: 500px;
        }
    </style>
</head>
<body>
<%@ include file="/components/admin/Sidebar.jsp" %>
<div class="main-content">
    <%@ include file="/components/admin/Header.jsp" %>
    <div class="container px-3 py-5">
        <div id="form-product-container" class="row g-4">
            <div class="col-12 col-lg-3">
                <div class="row g-4">
                    <div class="col-12">
                        <div class="container-card">
                            <div class="container-card-header">
                                <div class="container-card-header-title mb-3">
                                    <h3>Hình ảnh</h3>
                                </div>
                            </div>
                            <div class="thumbnail-body">
                                <div class="image-input">
                                    <label for="source"
                                           class="btn btn-icon btn-circle btn-active-color-primary w-25px h-25px bg-body shadow">
                                        <i class="fa-solid fa-pencil"></i>
                                        <input type="file" name="avatar" id="source">
                                        <input type="hidden" name="avatar-remove">
                                    </label>
                                </div>
                                <div class="text-muted fs-7 text-center">
                                    "Thêm hình ảnh cho sản phẩm. Chỉ bao gồm các file .png, .jpeg và .jpg"
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="container-card">
                            <div class="container-card-header-title mb-3 d-flex align-items-center justify-content-between gap-3">
                                <h3>Danh mục</h3>
                                <button type="button" class="btn btn-cate"
                                        data-bs-toggle="modal" data-bs-target="#addCategory">
                                    <i class="fa-solid fa-plus"></i>
                                </button>
                            </div>
                            <form id="addCategoryForm" class="form-content mb-3">
                                <label class="w-100">
                                    <select class="custom-select w-100">
                                        <option selected>Chọn danh mục</option>
                                        <c:forEach items="${categories}" var="catetory">
                                            <option value="${catetory.id}" ${catetory.id == product.category.id? 'selected':''}>
                                                    ${catetory.name}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </label>
                            </form>
                            <p class="title-input text-center">
                                Mỗi sản phẩm thuộc một danh mục
                            </p>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="container-card">
                            <div class="container-card-header-title mb-3 d-flex align-items-center justify-content-between gap-3">
                                <h3>Mã giảm giá</h3>
                                <button type="button" class="btn btn-cate"
                                        data-bs-toggle="modal" data-bs-target="#addDiscount">
                                    <i class="fa-solid fa-plus"></i>
                                </button>
                            </div>
                            <form id="addDiscountForm" class="form-content mb-3">
                                <label class="w-100">
                                    <select class="custom-select w-100">
                                        <option selected>Chọn mã giảm giá</option>
                                        <c:forEach items="${discounts}" var="discount">
                                            <option value="${discount.id}" ${discount.id == product.discount.id? 'selected':''}>
                                                    ${discount.desc}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </label>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="row g-4">
                    <div class="form-content col-12">
                        <div class="container-card">
                            <form class="form-card">
                                <div class="row justify-content-between text-left mb-3">
                                    <div class="form-group col-12 flex-column d-flex">
                                        <label for="productName" class="form-control-label mb-1">
                                            Tên sản phẩm
                                        </label>
                                        <input type="text" id="productName" name="productName"
                                               placeholder="Nhập sản phẩm"
                                               value="${product != null ? product.name : ''}">
                                        <p class="title-input mt-2">
                                            Tên sản phẩm là bắt buộc và được khuyến nghị độc nhất.
                                        </p>
                                    </div>
                                </div>
                                <div class="row g-3  mb-3">
                                    <div class="col w-100 form-group flex-column d-flex">
                                        <label for="productPrice" class="form-control-label mb-1">
                                            Giá
                                        </label>
                                        <input type="number" id="productPrice" name="productPrice" placeholder="0"
                                               step="10000" value="${product != null ? product.price : 0}">
                                    </div>
                                    <div class="col w-100 form-group flex-column d-flex">
                                        <label for="productQuantity" class="form-control-label mb-1">
                                            Số lượng
                                        </label>
                                        <input type="number" id="productQuantity" name="productQuantity"
                                               value="${product != null ? product.inventory.quantity : ''}" min="0" step="1">
                                    </div>
                                    <div class="col w-100 form-group flex-column d-flex">
                                        <label for="productSku" class="form-control-label mb-1">
                                            Sku
                                        </label>
                                        <input type="text" id="productSku" name="productSku"
                                               value="${product != null ? product.sku : ''}">
                                    </div>
                                </div>

                                <div class="form-group flex-column d-flex">
                                    <label for="editor" class="form-control-label mb-1">
                                        Mô tả
                                    </label>
                                    <textarea id="editor" placeholder="Nhập thông tin sản phẩm...">
                                        ${product != null ? product.desc : ''}
                                    </textarea>
                                    <p class="title-input mt-2">
                                        Đặt mô tả cho sản phẩm để tốt hơn hiển thị.
                                    </p>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end gap-3">
                        <button class="btn btn-red">Huỷ bỏ</button>
                        <button type="submit" class="btn btn-primary">
                            Lưu thay đổi
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="addCategory" tabindex="-1" aria-labelledby="addCategoryLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCategoryLabel">Tạo danh mục</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-3 align-items-center form-content py-3">
                    <div class="col-lg-4">
                        <label for="categoryName" class="form-control-label">
                            Tên danh mục:
                        </label>
                    </div>
                    <div class="col">
                        <input type="text" id="categoryName" name="categoryName"
                               placeholder="Nhập tên danh mục"
                               style="border: 1px solid #ccc; border-radius: 5px; font-weight: 500; font-size: 15px; padding: 6px 12px; width: 100%">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">
                    Hủy bỏ
                </button>
                <button type="button" class="btn btn-primary">Lưu</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="addDiscount" tabindex="-1" aria-labelledby="addDiscountLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addDiscountLabel">Thêm sự kiện & mã giảm giá</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="add-discount-form" class=" form-content py-3">
                    <div class="row g-3 align-items-center mb-3">
                        <div class="col-lg-4">
                            <label for="discountName" class="form-control-label">
                                Tên danh mục:
                            </label>
                        </div>
                        <div class="col">
                            <input type="text" id="discountName" name="discountName"
                                   placeholder="Nhập tên sự kiên hoặc mã giảm giá"
                                   style="border: 1px solid #ccc; border-radius: 5px; font-weight: 500; font-size: 15px; padding: 6px 12px; width: 100%">
                        </div>
                    </div>
                    <div class="row g-3 align-items-center mb-3">
                        <div class="col-lg-4">
                            <label for="discountDesc" class="form-control-label">
                                Mô tả
                            </label>
                        </div>
                        <div class="col">
                            <input type="text" id="discountDesc" name="discountDesc"
                                   style="border: 1px solid #ccc; border-radius: 5px; font-weight: 500; font-size: 15px; padding: 6px 12px; width: 100%">
                        </div>
                    </div>
                    <div class="row g-3 align-items-center mb-3">
                        <div class="col-lg-4">
                            <label for="discountPercent" class="form-control-label">
                                Phần trăm
                            </label>
                        </div>
                        <div class="col">
                            <input type="text" id="discountPercent" name="discountPercent"
                                   style="border: 1px solid #ccc; border-radius: 5px; font-weight: 500; font-size: 15px; padding: 6px 12px; width: 100%">
                        </div>
                    </div>
                    <div class="row g-3 align-items-center">
                        <div class="col-lg-4">
                            <label for="discountPercent" class="form-control-label">
                                Phần trăm
                            </label>
                        </div>
                        <div class="col">
                            <div class="d-flex align-items-center justify-content-start gap-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="discountActive"
                                           id="discountActive1" checked>
                                    <label class="form-check-label" for="discountActive1">
                                        Kích hoạt
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="discountActive"
                                           id="discountActive2">
                                    <label class="form-check-label" for="discountActive2">
                                        Vô hiệu
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">
                    Hủy bỏ
                </button>
                <button type="button" class="btn btn-primary">Lưu</button>
            </div>
        </div>
    </div>
</div>

<%@ include file="/common/admin/script.jsp" %>
<script src="https://cdn.ckeditor.com/ckeditor5/34.1.0/classic/ckeditor.js"></script>

<script>
    ClassicEditor.create(document.querySelector('#editor'))
</script>
</body>
</html>
