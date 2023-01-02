<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 14/04/2022
  Time: 8:00 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <title>Tra cứu hóa đơn | Valex</title>
    <%@ include file="/common/web/style.jsp" %>
    <style>
        .order-message {
            font-weight: 500;
            text-align: center;
            margin: auto;
            width: 100%;
            background: white;
            border-radius: 5px;
            padding: 70px 24px;
            border: 1px solid #efefef;
            font-size: 20px;
        }

        .order-not-found {
            font-weight: 500;
            text-align: center;
            margin: auto;
            width: 100%;
            background: white;
            padding: 24px;
            font-size: 20px;
        }
    </style>
</head>
<body class="bg-light">
<c:import url="/components/web/header/Header.jsp"/>

<section class="container mt-4 mb-5">
    <div class="breadcrumb-container bg-white">
        <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/account/profile">Tài khoản</a>
        <a href="${pageContext.request.contextPath}/account/order">Tra cứu hóa đơn</a>
    </div>
</section>

<section class="mb-5">
    <div class="container">
        <div class="d-flex gap-4 flex-wrap">
            <c:import url="/components/web/sidebar/AccountSidebar.jsp"/>
            <div class="col">
                <ul class="nav nav-pills p-2 mb-4 bg-white" id="pills-tab" role="tablist">
                    <li class="nav-item col" role="presentation">
                        <button class="nav-link w-100 active" id="all-tab" data-bs-toggle="pill"
                                data-bs-target="#all" type="button" role="tab" aria-controls="all"
                                aria-selected="true">
                            Tất cả
                        </button>
                    </li>
                    <li class="nav-item col" role="presentation">
                        <button class="nav-link w-100" id="waiting-tab" data-bs-toggle="pill"
                                data-bs-target="#waiting" type="button" role="tab" aria-controls="waiting"
                                aria-selected="false">
                            Chờ xác nhận
                        </button>
                    </li>
                    <li class="nav-item col" role="presentation">
                        <button class="nav-link w-100" id="shipping-tab" data-bs-toggle="pill"
                                data-bs-target="#shipping" type="button" role="tab" aria-controls="shipping"
                                aria-selected="false">
                            Đã xác nhận
                        </button>
                    </li>
                    <li class="nav-item col" role="presentation">
                        <button class="nav-link w-100" id="done-tab" data-bs-toggle="pill"
                                data-bs-target="#done" type="button" role="tab" aria-controls="done"
                                aria-selected="false">
                            Đã hoàn tất
                        </button>
                    </li>
                </ul>
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
                        <c:choose>
                            <c:when test="${orders != null && orders.size() > 0}">
                                <c:forEach var="order" items="${orders}">
                                    <c:set var="order" value="${order}" scope="request"/>
                                    <c:import url="/components/web/cards/HistoryOrderCard.jsp"/>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p class="order-message">Không tìm thấy hóa đơn/đơn đặt hàng.</p>
                            </c:otherwise>
                        </c:choose>

                    </div>
                    <div class="tab-pane fade" id="waiting" role="tabpanel" aria-labelledby="waiting-tab">
                        <c:choose>
                            <c:when test="${waitingOrders != null && waitingOrders.size() > 0}">
                                <c:forEach var="order" items="${waitingOrders}">
                                    <c:set var="order" value="${order}" scope="request"/>
                                    <c:import url="/components/web/cards/HistoryOrderCard.jsp"/>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p class="order-message">Không tìm thấy hóa đơn/đơn đặt hàng.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="tab-pane fade" id="shipping" role="tabpanel" aria-labelledby="shipping-tab">
                        <c:choose>
                            <c:when test="${shippingOrders != null && shippingOrders.size() > 0}">
                                <c:forEach var="order" items="${shippingOrders}">
                                    <c:set var="order" value="${order}" scope="request"/>
                                    <c:import url="/components/web/cards/HistoryOrderCard.jsp"/>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p class="order-message">Không tìm thấy hóa đơn/đơn đặt hàng.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="tab-pane fade" id="done" role="tabpanel" aria-labelledby="done-tab">
                        <c:choose>
                            <c:when test="${doneOrders != null && doneOrders.size() > 0}">
                                <c:forEach var="order" items="${doneOrders}">
                                    <c:set var="order" value="${order}" scope="request"/>
                                    <c:import url="/components/web/cards/HistoryOrderCard.jsp"/>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <p class="order-message">Không tìm thấy hóa đơn/đơn đặt hàng.</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="/components/web/footer/Footer.jsp" %>
<c:import url="/components/web/modal/ProductModal.jsp"/>
<%@ include file="/common/web/script.jsp" %>
</body>
</html>