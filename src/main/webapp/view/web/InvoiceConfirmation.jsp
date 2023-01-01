<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 21/04/2022
  Time: 9:48 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<!doctype html>
<html lang="en">
<head>
    <title>Xác nhận thanh toán | Valex</title>
    <%@ include file="/common/web/style.jsp" %>
</head>
<body>
<c:import url="/components/web/header/Header.jsp"/>
<section class="container mt-4 mb-5">
    <div class="breadcrumb-container">
        <a href="${pageContext.request.contextPath}">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/login">Thanh toán</a>
    </div>
</section>
<c:choose>
    <c:when test="${action == 'success'}">

    </c:when>
    <c:otherwise>
        <form class="mb-5" id="payment-page" method="post">
            <div class="container">
                <div class="mx-auto card-container" style="width: 900px">
                    <div class="card-container__header">
                        <h3>Thanh toán</h3>
                    </div>
                    <div class="card-container__content">
                        <div class="payment-list">
                            <c:forEach var="item" items="${order.items}">
                                <input type="hidden" name="id[]" value="${item.product.id}">
                                <div class="payment-list__item">
                                    <div class="payment-list__item__image">
                                        <c:choose>
                                            <c:when test="${item.product.images.size() > 0 }">
                                                <img src="${item.product.images.get(0).url}" alt="my-item">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="<c:url value="/assets/images/no-image.png"/>"
                                                     alt="my-item">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="payment-list__item__content w-100">
                                        <a href="${pageContext.request.contextPath}/product/${item.product.slug}"
                                           class="payment-list__item__name">
                                                ${item.product.name}
                                        </a>
                                        <div class="d-flex align-items-center justify-content-between">
                                            <p class="payment-list__item__quantity">
                                                Số lượng: ${item.quantity}
                                            </p>
                                            <p class="payment-list__item__total">
                                                <fmt:formatNumber type="currency"
                                                                  value="${item.product.price * (1 - item.product.discount.percent)}"/>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="payment-resume">
                            <div class="payment-resume__left">Tổng tiền:</div>
                            <div class="payment-resume__right">
                                <fmt:formatNumber value="${order.total}" type="currency"/>
                            </div>
                        </div>
                        <div class="payment-resume">
                            <div class="payment-resume__left">Phí vận chuyển:</div>
                            <div class="payment-resume__right">
                                <fmt:formatNumber value="0" type="currency"/>
                            </div>
                        </div>
                        <div class="payment-resume">
                            <div class="payment-resume__left">Cần thanh toán:</div>
                            <div class="payment-resume__right" style="color: #d70000;font-size: 18px">
                                <fmt:formatNumber value="${order.total}" type="currency"/>
                            </div>
                        </div>
                        <button type="submit" class="primary-button mt-3 w-100">
                            Hoàn Tất Thanh Toán
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </c:otherwise>
</c:choose>
<%@include file="/components/web/footer/Footer.jsp" %>
<c:import url="/components/web/modal/ProductModal.jsp"/>
<%@ include file="/common/web/script.jsp" %>
</body>
</html>