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
    <title>Valex | Hóa Đơn</title>
    <%@ include file="/common/admin/style.jsp" %>
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
                                   placeholder="Tìm kiếm hóa đơn...">
                        </label>
                    </div>
                    <div class="toolbar__options">

                    </div>
                </div>
            </div>
            <table id="order-table"></table>
        </div>
    </div>
</div>

<%@ include file="/common/admin/script.jsp" %>
<script src='<c:url value ="/assets/admin/js/order.js"/>'></script>
<script src='<c:url value ="/assets/admin/js/tables/order-table.js"/>'></script>


</body>
</html>
