<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 26/04/2022
  Time: 11:15 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <nav class="navbar px-3">
        <div class="container px-3 py-2">
            <div class="navbar__search">
                <i class="fa-solid fa-magnifying-glass"></i>
                <label for="navbar-search">
                    <input type="text" id="navbar-search" placeholder="Tìm kiếm..."/>
                </label>
            </div>
            <div class="navbar__user">
                <a class="navbar__user__link" href="#">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJxA5cTf-5dh5Eusm0puHbvAhOrCRPtckzjA&usqp=CAU"
                         alt="avatar"/>
                    <p>${user.name}</p>
                </a>
                <div class="navbar__user__options">
                    <div class="arrow"></div>
                    <a href="${pageContext.request.contextPath}/home">
                        <i class="fa-solid fa-person-walking-arrow-right"></i> Giao diện bán hàng
                    </a>
                    <a href="${pageContext.request.contextPath}/login?action=logout">
                        <i class="fa-solid fa-arrow-right-from-bracket"></i> Đăng xuất
                    </a>
                </div>
            </div>
        </div>
    </nav>
</header>