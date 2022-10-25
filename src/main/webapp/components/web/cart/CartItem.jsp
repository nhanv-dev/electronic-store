<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 15/05/2022
  Time: 5:20 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>

<div class="cart-item gap-4">
    <button class="cart-item__button-remove"><i class="fa-solid fa-xmark"></i></button>
    <div class="col d-flex gap-3">
        <a href="${pageContext.request.contextPath}/product/${item.product.slug}" class="cart-item__image">
            <img class="cart-item__image--show" src="${item.product.images.get(0).url}" alt="${item.product.name}"/>
        </a>
        <div>
            <a href="${pageContext.request.contextPath}/product/${item.product.slug}"
               class="cart-item__title">${item.product.name}</a>
            <div class="d-flex flex-wrap align-items-center justify-content-start gap-3">
                <c:choose>
                    <c:when test="${item.product.discount != null && item.product.discount.active == true}">
                    <span class="cart-item__price cart-item__price--new">
                        <fmt:formatNumber value="${item.product.price * (1 - item.product.discount.percent)}"
                                          type="currency"/>
                    </span>
                        <span class="cart-item__price cart-item__price--old">
                        <fmt:formatNumber value="${item.product.price}" type="currency"/>
                    </span>
                    </c:when>
                    <c:otherwise>
                    <span class="cart-item__price">
                        <fmt:formatNumber type="currency" value="${item.product.price}"/>
                    </span>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <div class="cart-item__button-cart">
        <div class="button-quantity button-cart-item-quantity" data-id="${item.id}">
            <button type="button"><i class="fa-solid fa-minus"></i></button>
            <label>
                <input id="input-quantity-product" type="number" tabindex="-1" value="1" min="0"
                       max="${item.product.inventory.quantity}"/>
            </label>
            <button type="button"><i class="fa-solid fa-plus"></i></button>
        </div>
    </div>
    <p class="cart-item__total">
        <fmt:formatNumber value="${item.product.price * (1 - item.product.discount.percent)}" type="currency"/>
    </p>
    <div class="cart-item__button-options">
        <button onclick="handleFavoriteItem('${item.product.id}')">
            <i class="fa-regular fa-heart"></i>
        </button>
        <button onclick="handleCompareItem('${item.product.id}')">
            <i class="fa-solid fa-right-left"></i>
        </button>
    </div>
</div>
