<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 17/05/2022
  Time: 2:54 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="vi_VN"/>

<div class="small-vertical-card">
    <a tabindex="-1" href="product/${product.slug}" class="small-vertical-card__image">
        <c:choose>
            <c:when test="${product.images.size() > 0}">
                <img class="small-vertical-card__image--show" src="${product.images.get(0).url}" alt="${product.name}">
            </c:when>
            <c:otherwise>
                <img class="small-vertical-card__image--show" src="${pageContext.request.contextPath}/assets/images/no-image.png" alt="${product.name}">
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${product.inventory.quantity <= 0 }">
                <div class="small-vertical-card__tag small-vertical-card__tag--red">
                    <p>Hết hàng </p>
                </div>
            </c:when>
            <c:when test="${product.discount != null && product.discount.active == true}">
                <div class="small-vertical-card__tag small-vertical-card__tag--green">
                    <p>
                        -<fmt:formatNumber type="percent" maxIntegerDigits="3" value="${product.discount.percent}"/>
                    </p>
                </div>
            </c:when>
        </c:choose>
    </a>

    <div class="small-vertical-card__content">
        <a href="product/${product.slug}" class="small-vertical-card__title">${product.name}</a>
        <div class="d-flex gap-2 flex-wrap align-items-center justify-content-start">
            <c:choose>
                <c:when test="${product.discount != null && product.discount.active == true}">
                    <p class="small-vertical-card__price small-vertical-card__price--new">
                        <fmt:formatNumber value="${product.price * (1 - product.discount.percent)}"
                                          type="currency"/>
                    </p>
                    <p class="small-vertical-card__price--old">
                        <fmt:formatNumber value="${product.price}" type="currency"/>
                    </p>
                </c:when>
                <c:otherwise>
                    <p class="small-vertical-card__price">
                        <fmt:formatNumber type="currency" value="${product.price}"/>
                    </p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>