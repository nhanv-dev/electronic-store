<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 15/04/2022
  Time: 7:09 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>

<div class="product-card">
    <div class="product-card--hover"></div>
    <a href="${pageContext.request.contextPath}/product/${product.slug}"
       class="product-card__image">
        <c:choose>
            <c:when test="${product.images.size() == 1}">
                <img class="product-card__image--show"
                     src="${product.images.get(0).url}" alt="${product.name}"/>
                <img class="product-card__image--hover"
                     src="${product.images.get(0).url}" alt="${product.name}"/>
            </c:when>
            <c:when test="${product.images.size() <= 0}">
                <img class="product-card__image--show"
                     src="${pageContext.request.contextPath}/assets/images/no-image.png"
                     alt="${product.name}"/>
                <img class="product-card__image--hover"
                     src="${pageContext.request.contextPath}/assets/images/no-image.png"
                     alt="${product.name}"/>
            </c:when>
            <c:otherwise>
                <img class="product-card__image--show"
                     src="${product.images.get(0).url}" alt="${product.name}"/>
                <img class="product-card__image--hover"
                     src="${product.images.get(1).url}" alt="${product.name}"/>
            </c:otherwise>
        </c:choose>
    </a>
    <c:choose>
        <c:when test="${product.inventory.quantity <= 0 }">
            <div class="product-card__tag product-card__tag--red">
                <p>Hết hàng </p>
            </div>
        </c:when>
        <c:when test="${product.discount != null && product.discount.active == true}">
            <div class="product-card__tag product-card__tag--green">
                <p>
                    -<fmt:formatNumber type="percent" maxIntegerDigits="3"
                                       value="${product.discount.percent}"/>
                </p>
            </div>
        </c:when>
    </c:choose>

    <div class="product-card__button-options">
        <button onclick="handleFavoriteItem('${product.id}')" type="button"
                data-bs-toggle="tooltip" data-bs-html="true"
                title="<span class='tooltip-title'>Yêu thích</span>"
                data-bs-placement="left">
            <i class="fa-regular fa-heart"></i>
        </button>
        <button onclick="handleQuickView('${product.id}')" type="button"
                data-bs-toggle="tooltip" data-bs-html="true"
                title="<span class='tooltip-title'>Xem chi tiết</span>"
                data-bs-placement="left">
            <i class="fa-regular fa-eye"></i>
        </button>
        <button onclick="handleCompareItem('${product.id}')" type="button"
                data-bs-toggle="tooltip" data-bs-html="true"
                title="<span class='tooltip-title'>So sánh</span>"
                data-bs-placement="left">
            <i class="fa-solid fa-right-left"></i>
        </button>
    </div>
    <div class="product-card__content">
        <a href="${pageContext.request.contextPath}/category/${product.category.slug}"
           class="product-card__category">${product.category.name}</a>
        <a href="${pageContext.request.contextPath}/product/${product.slug}"
           class="product-card__title">${product.name}</a>
        <div class="d-flex gap-2 flex-wrap align-items-end">
            <c:choose>
                <c:when test="${product.discount != null && product.discount.active == true}">
                    <p class="product-card__price product-card__price--new">
                        <fmt:formatNumber
                                value="${product.price * (1 - product.discount.percent)}"
                                type="currency"/>
                    </p>
                    <p class="product-card__price--old">
                        <fmt:formatNumber value="${product.price}" type="currency"/>
                    </p>
                </c:when>
                <c:otherwise>
                    <p class="product-card__price">
                        <fmt:formatNumber type="currency" value="${product.price}"/>
                    </p>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="product-card__button-cart">
            <div class="product-card__button-cart__quantity button-product-quantity">
                <button type="button"><i class="fa-solid fa-minus"></i></button>
                <label>
                    <input type="number" tabindex="-1" value="1" min="1"
                           max="${product.inventory.quantity}" step="1"/>
                </label>
                <button type="button"><i class="fa-solid fa-plus"></i></button>
            </div>
            <button class="product-card__button-cart__submit button-add-to-cart"
                    type="button" tabindex="-1"
                    onclick="handleAddToCart(this)" data-product-id='${product.id}'>
                <i class="fa-solid fa-cart-arrow-down"></i>
            </button>
        </div>
    </div>
</div>