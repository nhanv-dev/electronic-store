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
    <title>Valex - Danh mục</title>
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
                        <button type="button" data-bs-toggle="modal" data-bs-target="#addCategory"
                                class="toolbar__button toolbar__button--primary">
                            <i class="fa-solid fa-plus"></i>
                            <span>Thêm mới</span>
                        </button>
                    </div>
                </div>
            </div>
            <table id="category-table"></table>
        </div>
    </div>
</div>

<div class="modal fade" id="addCategory" tabindex="-1" aria-labelledby="addCategoryLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <form id="add-category-form" class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addCategoryLabel">Thêm danh mục</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-content py-3">
                    <div class="row g-3 align-items-center mb-3">
                        <div class="col-lg-4">
                            <label for="discountName" class="form-control-label">
                                Tên danh mục
                            </label>
                        </div>
                        <div class="col">
                            <input type="text" id="discountName" name="categoryName"
                                   placeholder="Nhập tên danh mục"
                                   style="border: 1px solid #ccc; border-radius: 5px; font-weight: 500; font-size: 15px; padding: 6px 12px; width: 100%">
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
<script src="<c:url value="/assets/admin/js/category.js"/>"></script>
<script src='<c:url value ="/assets/admin/js/tables/category-table.js"/>'></script>

</body>
</html>
