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
    <title>${product != null ? product.name : 'Thêm sản phẩm'}</title>
    <%@ include file="/common/admin/style.jsp" %>
</head>
<body>
<%@ include file="/components/admin/Sidebar.jsp" %>
<div class="main-content">
    <%@ include file="/components/admin/Header.jsp" %>
    <div class="container px-3 py-5" id="product-form-container">
        <div class="container-card mb-4">
            <div class="container-card__breadcrumb">
                <a href="${pageContext.request.contextPath}/admin/product" class="container-card__breadcrumb__link">
                    <i class="fa-solid fa-arrow-left"></i>
                    <span>danh mục sản phẩm</span>
                </a>
                <c:if test="${product != null}">
                    <a href="${pageContext.request.contextPath}/product/${product.slug}"
                       class="container-card__breadcrumb__link" id="slug">
                        <span>Hiển thị sản phẩm</span>
                        <i class="fa-solid fa-arrow-right"></i>
                    </a>
                </c:if>
            </div>
        </div>
        <form id="product-form" method="post" action="${pageContext.request.contextPath}/api/product/"
              acceptcharset="UTF-8" class="row g-4"
              enctype="multipart/form-data">
            <input type="hidden" value="${product != null ? product.id : ''}" name="id">
            <div class="col-12 col-lg-3">
                <div class="row g-4">
                    <div class="col-12">
                        <div class="container-card">
                            <div class="container-card__title">
                                <h3>Hình ảnh</h3>
                            </div>
                            <div class="thumbnail-body">
                                <div class="image-input mb-4">
                                    <label for="choose-image" class=button>
                                        <i class="fa-solid fa-pencil"></i>
                                        <input type="file" name="images" id="choose-image" multiple="multiple"
                                               accept="image/png, image/jpeg">
                                    </label>
                                </div>
                                <div class="message-bottom text-center" style="font-size: 13px">
                                    Thêm hình ảnh cho sản phẩm. Chỉ bao gồm các file .png, .jpeg và .jpg
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="container-card">
                            <div class="container-card__title ">
                                <a href="${pageContext.request.contextPath}/admin/category">Danh mục</a>
                                <button type="button" class="btn btn-cate"
                                        data-bs-toggle="modal" data-bs-target="#addCategory">
                                    <i class="fa-solid fa-plus"></i>
                                </button>
                            </div>
                            <label for="categoryId" class="d-none"></label>
                            <select class="w-100 mb-2" id="categoryId" name="categoryId">
                                <c:forEach items="${categories}" var="catetory">
                                    <option value="${catetory.id}" ${catetory.id == product.category.id? 'selected':''}>
                                            ${catetory.name}
                                    </option>
                                </c:forEach>
                            </select>
                            <p class="message-bottom text-center" style="font-size: 13px">
                                Mỗi sản phẩm phải thuộc một loại danh mục
                            </p>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="container-card">
                            <div class="container-card__title">
                                <a href="${pageContext.request.contextPath}/admin/discount">Mã giảm giá</a>
                                <button type="button" class="btn btn-cate"
                                        data-bs-toggle="modal" data-bs-target="#addDiscount">
                                    <i class="fa-solid fa-plus"></i>
                                </button>
                            </div>
                            <label for="discountId" class="d-none"></label>
                            <select class="w-100" id="discountId" name="discountId">
                                <option selected value="no-discount">Không có</option>
                                <c:forEach items="${discounts}" var="discount">
                                    <option value="${discount.id}" ${discount.id == product.discount.id? 'selected':''}>
                                            ${discount.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col col-lg-9">
                <div class="row g-4">
                    <div class="col-12 col-lg-2 w-100">
                        <div class="container-card">
                            <div id="preview-images" class="preview-images w-100">
                                <c:if test="${product != null && product.images.size() > 0}">
                                    <c:forEach items="${product.images}" var="image">
                                        <div class="preview-images__image">
                                            <img src="${image.url}" alt="${image.id}">
                                            <button type="button"
                                                    onclick="handleDeleteImage(this,'${image.id}', null, event)">
                                                <i class="fa-solid fa-xmark"></i>
                                            </button>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <img class="preview-images__no-image ${(product != null && product.images.size() > 0) ? 'd-none':''}"
                                     src="https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png"
                                     alt="no image">

                            </div>
                        </div>
                    </div>
                    <div class="form-content col-12">
                        <div class="container-card">
                            <div class="container-card__title">
                                <h3>Thông tin sản phẩm</h3>
                                <div class="container-card__breadcrumb__date">
                                    <c:if test="${product!=null}">
                                        <p>Chỉnh sửa lần cuối:
                                            <fmt:formatDate type="both" dateStyle="short" timeStyle="short"
                                                            value="${product.modifiedAt}"/>
                                        </p>
                                        <p>Ngày thêm:
                                            <fmt:formatDate type="both" dateStyle="short" timeStyle="short"
                                                            value="${product.createdAt}"/>
                                        </p>
                                    </c:if>
                                </div>
                            </div>
                            <div class="form-group col-12 flex-column d-flex  mb-3">
                                <label for="productName">Tên sản phẩm</label>
                                <input type="text" id="productName" name="name"
                                       placeholder="Nhập sản phẩm"
                                       value="${product != null ? product.name : ''}">
                                <p class="message-bottom">
                                    Tên sản phẩm là bắt buộc và được khuyến nghị độc nhất.
                                </p>
                            </div>
                            <div class="row g-3 mb-3">
                                <div class="col-3 form-group">
                                    <label for="productPrice">Giá gốc</label>
                                    <input type="number" id="productPrice" name="price"
                                           step="any" value="${product != null ? product.price : ''}">
                                </div>
                                <div class="col-3 form-group">
                                    <fmt:setLocale value="en"/>
                                    <fmt:formatNumber type="number" pattern="0.00" var="price"
                                                      value="${product.price}"/>
                                    <label for="saleProductPrice">
                                        Giá bán
                                    </label>
                                    <c:choose>
                                        <c:when test="${product != null && product.discount != null && product.discount.active == true}">
                                            <fmt:formatNumber type="number" pattern="0.00" var="price"
                                                              value="${product.price * (1-product.discount.percent)}"/>
                                            <input type="number" id="saleProductPrice" name="saleProductPrice"
                                                   value="${price}" disabled>
                                        </c:when>
                                        <c:when test="${product != null && product.discount != null && product.discount.active == false}">
                                            <input type="number" id="saleProductPrice" name="saleProductPrice"
                                                   value="${price}" disabled>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="number" id="saleProductPrice" name="saleProductPrice"
                                                   placeholder="0" step="10000" value="${price}" disabled>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="col-3 form-group">
                                    <label for="productSku">Sku </label>
                                    <input type="text" id="productSku" name="sku" maxlength="10"
                                           value="${product != null ? product.sku : ''}">
                                </div>
                                <div class="col-3 form-group">
                                    <label for="productQuantity">Số lượng </label>
                                    <input type="number" id="productQuantity" name="quantity"
                                           value="${product != null ? product.inventory.quantity : ''}" min="0"
                                           step="1">
                                    <c:if test="${product!=null}">
                                        <input type="hidden" name="inventoryId" value="${product.inventory.id}">
                                    </c:if>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="editor"> Mô tả </label>
                                <textarea id="editor" placeholder="Nhập thông tin sản phẩm..." name="desc">
                                    ${product != null ? product.desc : ''}
                                </textarea>
                                <p class="message-bottom">
                                    Đặt mô tả cho sản phẩm để hiển thị tốt hơn.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end gap-3">
                        <c:if test="${product != null}">
                            <button type="button" class="danger-button" onclick="handleDeleteProduct('${product.id}')">
                                Xóa
                            </button>
                        </c:if>
                        <button type="submit" class="submit-button">
                            Lưu sản phẩm
                        </button>
                    </div>
                </div>
            </div>
        </form>
        <div class="modal fade" id="addCategory" tabindex="-1" aria-labelledby="addCategoryLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <form id="add-category-form" class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addCategoryLabel">Tạo danh mục</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row g-3 align-items-center form-content py-3">
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
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="reset-button" data-bs-dismiss="modal">Hủy</button>
                        <button type="submit" class="submit-button">Lưu</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="modal fade" id="addDiscount" tabindex="-1" aria-labelledby="addDiscountLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <form id="add-discount-form" class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addDiscountLabel">Thêm sự kiện & Mã giảm giá</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="form-content py-3">
                            <div class="row g-3 align-items-center mb-3">
                                <div class="col-lg-4">
                                    <label for="discountName" class="form-control-label">
                                        Chủ đề:
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
                                        Mô tả:
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
                                        Phần trăm:
                                    </label>
                                </div>
                                <div class="col">
                                    <input type="number" id="discountPercent" name="discountPercent" step="any"
                                           style="border: 1px solid #ccc; border-radius: 5px; font-weight: 500; font-size: 15px; padding: 6px 12px; width: 100%">
                                </div>
                            </div>
                            <div class="row g-3 align-items-center">
                                <div class="col-lg-4">
                                    <label for="newDiscountStatus" class="form-control-label">
                                        Trang thái:
                                    </label>
                                </div>
                                <div class="col">
                                    <select class="w-100" id="newDiscountStatus" name="discountStatus">
                                        <option selected value="active">Kích hoạt</option>
                                        <option value="inactive">Vô hiệu</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="reset-button" data-bs-dismiss="modal">
                            Hủy
                        </button>
                        <button type="submit" class="submit-button">Lưu</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="/common/admin/script.jsp" %>
<script src="<c:url value="/assets/admin/js/product.js"/>"></script>
<script src="<c:url value="/assets/admin/js/discount.js"/>"></script>
<script src="<c:url value="/assets/admin/js/category.js"/>"></script>
</body>
</html>
