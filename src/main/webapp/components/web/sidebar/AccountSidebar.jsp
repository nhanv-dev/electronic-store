<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 19/04/2022
  Time: 8:10 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="account-sidebar bg-white">
    <div class="account-sidebar__container">
        <div class="account-sidebar__info">
            <div class="account-sidebar__info__avatar">
                <img src="https://rbooks.vn/imgs/user-avt-comment.png" alt="avatar">
            </div>
            <div class="account-sidebar__info__content">
                <p>${sessionScope.user.name}</p>
                <a href="${pageContext.request.contextPath}/account/profile">
                    <i class="fa-solid fa-pen"></i>
                    <span>Chỉnh sửa hồ sơ</span>
                </a>
            </div>
        </div>
        <ul class="account-sidebar__list">
            <li>
                <a href="${pageContext.request.contextPath}/account/profile">
                    <i class="fa-solid fa-user"></i>
                    <span>Tài khoản của tôi</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/account/order">
                    <i class="fa-solid fa-credit-card"></i>
                    <span>Đơn mua</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/wishlist">
                    <i class="fa-solid fa-heart"></i>
                    <span>Danh sách yêu thích</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/account/change-password">
                    <i class="fa-solid fa-key"></i>
                    <span>Đổi mật khẩu</span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/login?action=logout" style="color: red">
                    <i class="fa-solid fa-arrow-right-from-bracket"></i>
                    <span>Đăng xuất</span>
                </a>
            </li>
        </ul>
    </div>
</div>
