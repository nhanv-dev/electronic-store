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
    <title>Valex - Quản lý nhân sự</title>
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
                                   placeholder="Tìm kiếm nhân viên">
                        </label>
                    </div>
                    <div class="toolbar__options">
                        <button type="button" data-bs-toggle="modal" data-bs-target="#myModal"
                                class="toolbar__button toolbar__button--primary">
                            <i class="fa-solid fa-plus"></i>
                            <span>Tạo tài khoản</span>
                        </button>
                    </div>
                </div>
            </div>
            <table id="staff-table"></table>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">Tạo tài khoản</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="row g-3" id="add-staff-form">
                    <div class="col-md-6">
                        <label for="name" class="form-label">Họ & tên</label>
                        <input type="text" class="form-control" name="name" id="name" required>
                        <div id="nameFeedback" class="invalid-feedback">
                            Họ tên không hợp lệ.
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="username" class="form-label">Tên đăng nhập</label>
                        <input type="text" class="form-control" name="username" id="username" required>
                        <div id="usernameFeedback" class="invalid-feedback">
                            Vui lòng chọn tên đăng nhập khác.
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="email" class="form-label">Email</label>
                        <input type="text" class="form-control" id="email" name="email" required>
                        <div id="emailFeedback" class="invalid-feedback">
                            Email không hợp lệ
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="phone" class="form-label">Số điện thoại</label>
                        <input type="text" class="form-control" id="phone" name="phone" required>
                        <div id="phoneFeedback" class="invalid-feedback">
                            Số điện thoại không hợp lệ
                        </div>
                    </div>
                    <div class="col-md-8">
                        <label for="address" class="form-label">Địa chỉ</label>
                        <input type="text" class="form-control" name="address" id="address" required>
                        <div id="addressFeedback" class="invalid-feedback">
                            Vui lòng nhập địa chỉ
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="role" class="d-block form-label">Vai trò</label>
                        <select id="role" required name="role">
                            <option value="role-1" selected>Nhân viên</option>
                            <option value="role-2">Admin</option>
                        </select>
                    </div>
                    <div class="col-12">
                        <div class="d-flex align-items-center justify-content-end gap-3">
                            <button type="button" class="danger-button" data-bs-dismiss="modal">Hủy</button>
                            <button class="primary-button" type="sumit">Lưu</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="/common/admin/script.jsp" %>

<script src="<c:url value="/assets/admin/js/staff.js"/>"></script>
<script src='<c:url value ="/assets/admin/js/tables/staff-table.js"/>'></script>

</body>
</html>
