<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 15/04/2022
  Time: 1:04 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN"/>

<button class="header-center__options__button" type="button" data-bs-toggle="offcanvas"
        data-bs-target="#cart-sidebar" aria-controls="offcanvasRight">
    <span class="header-center__options__button__icon">
        <svg viewBox="-69 0 512 512">
            <path d="m330.507812 128.976562c-7.527343-72.367187-68.875-128.976562-143.199218-128.976562-74.324219 0-135.671875 56.609375-143.195313 128.976562h-44.113281v383.023438h374.617188v-383.023438zm-143.199218-98.976562c57.761718 0 105.621094 43.195312 112.988281 98.976562h-69.363281l-1.527344 13.289063c-2.453125 21.359375-20.550781 37.46875-42.097656 37.46875-21.542969 0-39.640625-16.105469-42.09375-37.46875l-1.527344-13.289063h-69.367188c7.367188-55.78125 55.226563-98.976562 112.988282-98.976562zm157.308594 452h-314.617188v-323.023438h88.210938c9.242187 29.703126 36.921874 50.757813 69.097656 50.757813 32.179687 0 59.855468-21.054687 69.097656-50.757813h88.210938zm0 0">
            </path>
            <path d="m101.15625 415.570312h172.308594v30h-172.308594zm0 0">
            </path>
        </svg>
        <span id="header-amount-cart"
              class="header-center__options__button__quantity">${sessionScope.cart != null ? sessionScope.cart.amount : 0}</span>
    </span>
    <span class="header-center__options__button__text d-none d-lg-flex">
        <span class="header-center__options__button__text__title">Giỏ hàng</span>
        <span id="header-total-cart"
              class="header-center__options__button__text__subtitle header-center__options__button__text__subtitle--total">
             <fmt:formatNumber value="${sessionScope.cart != null ? sessionScope.cart.total : 0}" type="currency"/>
        </span>
    </span>
</button>
<div class="offcanvas offcanvas-end" tabindex="-1" id="cart-sidebar">
    <div class="offcanvas-header">
        <h5 class="offcanvas-header__title">Giỏ hàng</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <c:choose>
            <c:when test="${sessionScope.cart == null || sessionScope.cart.items.size() <= 0 }">
                <div class="cart-message">
                    <img src="https://cdni.iconscout.com/illustration/premium/thumb/sorry-item-not-found-3328225-2809510.png"
                         alt="cart-message">
                    <h5>Giỏ hàng của bạn rỗng</h5>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="cartItem" items="${cart.items}" varStatus="status">
                    <c:set var="cartItem" value="${cart.items.get(cart.items.size() - status.index - 1)}"
                           scope="request"/>
                    <div class="cart-item">
                        <a href="${pageContext.request.contextPath}/product/${cartItem.product.slug}"
                           class="cart-item__image">
                            <c:choose>
                                <c:when test="${cartItem.product.images != null && cartItem.product.images.size() > 0}">
                                    <img src="${cartItem.product.images[0].url}" alt="${cartItem.product.id}"/>
                                </c:when>
                                <c:otherwise>
                                    <img src="<c:url value="/assets/images/no-image.png"/>"
                                         alt="${cartItem.product.id}"/>
                                </c:otherwise>
                            </c:choose>
                        </a>
                        <div class="cart-item__content">
                            <a href="${pageContext.request.contextPath}/product/${cartItem.product.slug}"
                               class="cart-item__title">
                                    ${cartItem.product.name}
                            </a>
                            <div class="d-flex align-items-end gap-3 mb-1">
                                <c:choose>
                                    <c:when test="${cartItem.product.discount != null && cartItem.product.discount.active == true}">
                                        <p class="cart-item__price cart-item__price--new">
                                            <fmt:formatNumber type="currency"
                                                              value="${cartItem.product.price * (1 - cartItem.product.discount.percent)}"/>
                                        </p>
                                        <p class="cart-item__price cart-item__price--old">
                                            <fmt:formatNumber value="${cartItem.product.price}" type="currency"/>
                                        </p>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="cart-item__price">
                                            <fmt:formatNumber type="currency" value="${cartItem.product.price}"/>
                                        </p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="button-quantity">
                                <button onclick="handleUpdateQuantityCartItem(this, -1)" type="button"
                                        data-id="${cartItem.id}">
                                    <i class="fa-solid fa-minus"></i>
                                </button>
                                <label>
                                    <input type="number" tabindex="-1" value="${cartItem.quantity}" min="0"
                                           max="${cartItem.product.inventory.quantity}"/>
                                </label>
                                <button onclick="handleUpdateQuantityCartItem(this, 1)" type="button"
                                        data-id="${cartItem.id}">
                                    <i class="fa-solid fa-plus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="cart-item__button-remove">
                            <button onclick="handleRemoveCartItem(this, '${cartItem.id}')">
                                <i class="fa-solid fa-xmark"></i>
                            </button>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="offcanvas-footer">
        <div class="offcanvas-footer__total">
            <h5>Tổng:</h5>
            <p id="header-total-cart-sidebar">
                <fmt:formatNumber type="currency" value="${cart == null || cart.total == 0 ? 0: cart.total}"/>
            </p>
        </div>
        <div class="offcanvas-footer__buttons">
            <a href="${pageContext.request.contextPath}/cart">Giỏ hàng</a>
            <a href="${pageContext.request.contextPath}/payment">Thanh toán</a>
        </div>
    </div>
</div>
