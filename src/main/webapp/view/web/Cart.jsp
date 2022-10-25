<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 14/04/2022
  Time: 8:00 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Giỏ hàng | Digitaz</title>
    <%@ include file="/common/web/style.jsp" %>
</head>
<body style="background: #f8f9fa">
<c:import url="/components/web/header/Header.jsp"/>

<section class="container my-4">
    <div class="breadcrumb-container bg-white">
        <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/category">Giỏ hàng</a>
    </div>
</section>
<c:choose>
    <c:when test="${cart != null && cart.items.size() > 0}">
        <section id="section-cart-page" class="mb-5">
            <div class="container">
                <div class="row g-4">
                    <div class="col-12 col-md-8 col-lg-8">
                        <div id="cart-list">
                            <div class="cart-header align-items-end">
                                <h3>Giỏ hàng (<span class="cart-quantity">${cart.amount} sản phẩm</span>)</h3>
                                <button onclick="handleDeleteAll()">Xóa tất cả</button>
                            </div>
                            <c:forEach var="item" items="${cart.items}" varStatus="status">
                                <c:set var="item" value="${cart.items.get(cart.items.size() - status.index - 1)}"/>
                                <div class="cart-item gap-4">
                                    <button onclick="handleDeleteCartItem(this)" data-id="${item.id}"
                                            class="cart-item__button-remove">
                                        <i class="fa-solid fa-xmark"></i>
                                    </button>
                                    <div class="col d-flex gap-3">
                                        <a href="${pageContext.request.contextPath}/product/${item.product.slug}"
                                           class="cart-item__image">
                                            <c:choose>
                                                <c:when test="${item.product.images != null && item.product.images.size() > 0}">
                                                    <img class="cart-item__image--show"
                                                         src="${item.product.images.get(0).url}"
                                                         alt="${item.product.name}"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="cart-item__image--show"
                                                         src="${pageContext.request.contextPath}/assets/images/no-image.png"
                                                         alt="${item.product.name}"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </a>
                                        <div class="mt-1">
                                            <a href="${pageContext.request.contextPath}/product/${item.product.slug}"
                                               class="cart-item__title"
                                               style="max-width: 100%; width: 100%; min-width: auto">${item.product.name}</a>
                                            <div class="d-flex flex-wrap align-items-center justify-content-start gap-3">
                                                <c:choose>
                                                    <c:when test="${item.product.discount != null && item.product.discount.active == true}">
                                                        <span class="cart-item__price cart-item__price--new">
                                                            <fmt:formatNumber
                                                                    value="${item.product.price * (1 - item.product.discount.percent)}"
                                                                    type="currency"/>
                                                        </span>
                                                        <span class="cart-item__price cart-item__price--old">
                                                            <fmt:formatNumber value="${item.product.price}"
                                                                              type="currency"/>
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="cart-item__price">
                                                            <fmt:formatNumber type="currency"
                                                                              value="${item.product.price}"/>
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>

                                            <c:if test="${item.quantity > item.product.inventory.quantity}">
                                                <p class="mt-2 warning-quantity">
                                                    * Số lượng đặt mua vượt quá lượng hàng tồn kho
                                                </p>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="cart-item__button-cart me-3">
                                        <div class="button-quantity button-cart-item-quantity" data-id="${item.id}">
                                            <button onclick="handleUpdateQuantityCartItem(this, -1)"
                                                    data-id="${item.id}" type="button">
                                                <i class="fa-solid fa-minus"></i>
                                            </button>
                                            <label>
                                                <input id="input-quantity-product" type="number" tabindex="-1"
                                                       value="${item.quantity}"
                                                       min="0" max="${item.product.inventory.quantity}"/>
                                            </label>
                                            <button onclick="handleUpdateQuantityCartItem(this, 1)" data-id="${item.id}"
                                                    type="button">
                                                <i class="fa-solid fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <p class="cart-item__total">
                                        <fmt:formatNumber value="${item.total}" type="currency"/>
                                    </p>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="cart-detail">
                            <div class="cart-detail__header">
                                <h3> Thông tin giỏ hàng</h3>
                            </div>
                            <div class="cart-detail__content">
                                <div class="cart-detail__content__line">
                                    <p>Số lượng:</p>
                                    <p class="cart-quantity">${cart.amount} sản phẩm</p>
                                </div>
                                <div class="cart-detail__content__line">
                                    <p>Tổng tiền:</p>
                                    <p class="cart-total"><fmt:formatNumber value="${cart.total}" type="currency"/></p>
                                </div>
                                <div class="cart-detail__content__line">
                                    <p>Phí giao hàng dự kiến:</p>
                                    <p><fmt:formatNumber value="0" type="currency"/></p>
                                </div>
                                <div class="cart-detail__content__line pb-3" style="border-bottom: 1px solid #efefef">
                                    <p style="color: #121212; font-size: 18px">Cần thanh toán</p>
                                    <p class="cart-total" style="color: #EF262C; font-size: 18px; font-weight: bold">
                                        <fmt:formatNumber value="${cart.total}" type="currency"/>
                                    </p>
                                </div>
                                <a href="${pageContext.request.contextPath}/payment" class="button-payment">
                                    Thanh toán
                                </a>
                                <p style="margin-top: 12px; font-size: 14px; font-weight: 500; color: #7E8299; text-align: center">
                                    Bằng cách đặt hàng bạn đồng ý với Điều khoản sử dụng và các chính sách của chúng tôi
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <c:if test="${products!=null && products.size() >0}">
            <section class="py-5">
                <div class="container">
                    <div class="d-flex align-items-end justify-content-between my-4 py-3 border-bottom">
                        <h5 class="mb-0">Có thể bạn quan tâm</h5>
                        <a href="${pageContext.request.contextPath}/category/${category.slug}"
                           class="d-flex align-items-center justify-items-end gap-2"
                           style="font-size: 14px; font-weight: 500; letter-spacing: 0.5px;">
                            <span>Xem tất cả</span>
                            <i class="fa-solid fa-arrow-right" style="font-size: 12px"></i>
                        </a>
                    </div>
                    <div class="row row-cols-2 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 g-4">
                        <c:forEach var="item" items="${products}">
                            <c:set var="product" value="${item}" scope="request"/>
                            <div class="col">
                                <c:import url="/components/web/cards/ProductCard.jsp"/>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </c:if>
    </c:when>
    <c:otherwise>
        <section class="mb-5">
            <div class="container text-center">
                <div class="list-product--not-found">
                    <div class="list-product--not-found__image">
                        <img src="https://cdni.iconscout.com/illustration/premium/thumb/sorry-item-not-found-3328225-2809510.png"
                             alt="not found image"/>
                    </div>
                    <h5 class="list-product--not-found__message">Bạn chưa thêm sản phẩm vào giỏ hàng.</h5>
                    <a class="list-product--not-found__link" href="${pageContext.request.contextPath}/category/">
                        Tiếp tục mua sắm
                    </a>
                </div>
            </div>
        </section>
    </c:otherwise>
</c:choose>

<%@include file="/components/web/footer/Footer.jsp" %>
<c:import url="/components/web/modal/ProductModal.jsp"/>
<%@ include file="/common/web/script.jsp" %>

</body>
</html>