<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 15/04/2022
  Time: 7:09 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="vi_VN"/>

<div class="product-card--list">
    <a href="${pageContext.request.contextPath}/product/${product.slug}" class="product-card--list__image">
        <c:choose>
            <c:when test="${product.images.size() == 1}">
                <img class="product-card--list__image--show"
                     src="${product.images.get(0).url}" alt="${product.name}"/>
                <img class="product-card--list__image--hover"
                     src="${product.images.get(0).url}" alt="${product.name}"/>
            </c:when>
            <c:when test="${product.images.size() <= 0}">
                <img class="product-card--list__image--show"
                     src="${pageContext.request.contextPath}/assets/images/no-image.png"
                     alt="${product.name}"/>
                <img class="product-card--list__image--hover"
                     src="${pageContext.request.contextPath}/assets/images/no-image.png"
                     alt="${product.name}"/>
            </c:when>
            <c:otherwise>
                <img class="product-card--list__image--show"
                     src="${product.images.get(0).url}" alt="${product.name}"/>
                <img class="product-card--list__image--hover"
                     src="${product.images.get(1).url}" alt="${product.name}"/>
            </c:otherwise>
        </c:choose>
    </a>
    <c:choose>
        <c:when test="${product.inventory.quantity <= 0 }">
            <div class="product-card--list__tag product-card--list__tag--red">
                <p>Hết hàng </p>
            </div>
        </c:when>
        <c:when test="${product.discount != null && product.discount.active == true}">
            <div class="product-card--list__tag product-card--list__tag--green">
                <p>
                    -<fmt:formatNumber type="percent" maxIntegerDigits="3" value="${product.discount.percent}"/>
                </p>
            </div>
        </c:when>
    </c:choose>

    <div class="product-card--list__content col">
        <a href="${pageContext.request.contextPath}/category/${product.category.slug}"
           class="product-card--list__category">${product.category.name}</a>
        <a href="${pageContext.request.contextPath}/product/${product.slug}" class="product-card--list__title">${product.name}</a>
        <c:choose>
            <c:when test="${product.discount != null && product.discount.active == true}">
                <div class="d-flex gap-3 align-items-center">
                    <p class="product-card--list__price product-card--list__price--new">
                        <fmt:formatNumber value="${product.price * (1 - product.discount.percent)}"
                                          type="currency"/>
                    </p>
                    <p class="product-card--list__price--old">
                        <fmt:formatNumber value="${product.price}" type="currency"/>
                    </p>
                </div>
            </c:when>
            <c:otherwise>
                <p class="product-card--list__price">
                    <fmt:formatNumber type="currency" value="${product.price}"/>
                </p>
            </c:otherwise>
        </c:choose>
        <div class="product-card--list__desc">
            ${product.desc}
        </div>
    </div>
    <div class="col-3 p-3">
        <div class="product-card--list__button-cart">
            <div class="product-card--list__button-cart__quantity button-product-quantity">
                <button type="button"><i class="fa-solid fa-minus"></i></button>
                <label>
                    <input type="number" tabindex="-1" value="1" min="0" max="${product.inventory.quantity}"/>
                </label>
                <button type="button"><i class="fa-solid fa-plus"></i></button>
            </div>
            <button onclick="handleAddToCart(this)" data-product-id="${product.id}" class="product-card--list__button-cart__submit button-add-to-cart" type="button" tabindex="-1">
                <i class="fa-solid fa-cart-arrow-down"></i>
            </button>
        </div>
        <div class="product-card--list__button-options">
            <button onclick="handleFavoriteItem('${product.id}')">
                <span><i class="fa-regular fa-heart"></i></span>
                Thêm vào yêu thích
            </button>
            <button onclick="handleQuickView('${product.id}')">
                <span><i class="fa-regular fa-eye"></i> </span>
                Xem nhanh
            </button>
            <button onclick="handleCompareItem('${product.id}')">
                <span> <i class="fa-solid fa-right-left"></i> </span>
                So sánh
            </button>
        </div>
    </div>
</div>
