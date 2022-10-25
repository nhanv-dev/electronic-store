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
    <title>Valex - Sự kiện & Giảm giá</title>
    <%@ include file="/common/admin/style.jsp" %>
    <style>
        .nice-select {
            height: 38px;
            width: 100%;
        }
    </style>
</head>
<body>
<%@ include file="/components/admin/Sidebar.jsp" %>
<div class="main-content">
    <%@ include file="/components/admin/Header.jsp" %>
    <div class="container px-3 py-5">
        <div class="container-card">
            <div id="toolbar">
                <div class="toolbar">
                    <div class="toolbar__search">
                        <span class="toolbar__search__icon">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </span>
                        <label for="search">
                            <input type="text" id="search" class="toolbar__search__input"
                                   placeholder="Tìm kiếm sự kiện giảm giá">
                        </label>
                    </div>
                    <div class="toolbar__options">
                        <button type="button" data-bs-toggle="modal" data-bs-target="#addDiscount"
                                class="toolbar__button toolbar__button--primary">
                            <i class="fa-solid fa-plus"></i>
                            <span>Thêm mới</span>
                        </button>
                    </div>
                </div>
            </div>
            <table id="discount-table"></table>
        </div>
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

<%@ include file="/common/admin/script.jsp" %>
<script src="<c:url value="/assets/admin/js/discount.js"/>"></script>
<script src='<c:url value ="/assets/admin/js/tables/discount-table.js"/>'></script>

</body>
</html>
