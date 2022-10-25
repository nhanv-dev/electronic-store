<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 14/04/2022
  Time: 8:00 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN"/>
<!doctype html>
<html lang="en">
<head>
    <title>${product.name} | Valex</title>
    <%@ include file="/common/web/style.jsp" %>

</head>
<body>
<c:set var="item" value="${product}" scope="request"/>
<c:import url="/components/web/header/Header.jsp"/>

<section class="container mt-4 mb-5">
    <div class="breadcrumb-container">
        <a href="${pageContext.request.contextPath}">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/category">Danh mục</a>
        <a href="${pageContext.request.contextPath}/category/${item.category.slug}">${item.category.name}</a>
        <a href="${pageContext.request.contextPath}/product/${item.slug}">${item.name}</a>
    </div>
</section>
<section class="product-detail">
    <div class="container">
        <div class="row g-3 g-md-4">
            <div class="col-lg-6 col-12">
                <div class="mb-4">
                    <div class="product-detail__image">
                        <c:choose>
                            <c:when test="${item.images.size() > 0}">
                                <img src="${item.images[0].url}" alt="${item.name}"/>
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/assets/images/no-image.png"
                                     alt="${item.name}"/>
                            </c:otherwise>
                        </c:choose>
                        <c:if test="${item.discount != null && item.discount.active == true}">
                            <p class="product-detail__tag">
                                -<fmt:formatNumber type="percent" maxIntegerDigits="3" value="${item.discount.percent}"/>
                            </p>
                        </c:if>
                    </div>
                    <div class="product-detail__slide">
                        <c:choose>
                            <c:when test="${item.images.size() > 0}">
                                <button onclick="scrollImages('prev')">
                                    <i class="fa-solid fa-chevron-left"></i>
                                </button>
                                <div class="product-detail__slide__images">
                                    <c:forEach items="${item.images}" var="image">
                                        <div class="product-detail__slide__images__item">
                                            <img src="${image.url}" alt="${image.id}">
                                        </div>
                                    </c:forEach>
                                </div>
                                <button onclick="scrollImages('next')">
                                    <i class="fa-solid fa-chevron-right"></i>
                                </button>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
                <div class="product-detail__desc ">${item.desc}</div>
            </div>
            <div class="col-lg-6 col-12">
                <div class="product-detail__content">
                    <c:choose>
                        <c:when test="${item.inventory.quantity > 0}">
                            <p class="product-detail__status product-detail__status--available">
                                <i class="fa-regular fa-circle-check"></i> Còn hàng
                            </p>
                        </c:when>
                        <c:otherwise>
                            <p class="product-detail__status product-detail__status--warning">
                                <i class="fa-solid fa-circle-exclamation"></i> Hết hàng
                            </p>
                        </c:otherwise>
                    </c:choose>
                    <h5 class="product-detail__title">${item.name}</h5>
                    <div class="d-flex align-items-center justify-content-start gap-5">
                        <div class="product-detail__subtitle">
                            <span>Loại:</span>
                            <a href="${pageContext.request.contextPath}/category/${item.category.slug}">
                                ${item.category.name}
                            </a>
                        </div>
                        <div class="product-detail__subtitle">
                            <span>SKU:</span>
                            <span>${item.sku}</span>
                        </div>
                    </div>
                    <div class="product-detail__price">
                        <c:choose>
                            <c:when test="${item.discount != null && item.discount.active == true}">
                                <p class="product-detail__price--new">
                                    <fmt:formatNumber type="currency"
                                                      value="${item.price * (1 - item.discount.percent)}"/>
                                </p>
                                <p class="product-detail__price--old">
                                    <fmt:formatNumber value="${item.price}" type="currency"/>
                                </p>
                            </c:when>
                            <c:otherwise>
                                <fmt:formatNumber type="currency" value="${item.price}"/>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="product-detail__gift ">
                        <div class="product-detail__gift__header">
                            Ưu đãi khi mua ${item.category.name} tại cửa hàng.
                        </div>
                        <div class="d-flex gap-3 align-item-start mb-1">
                            <span class="icon-check"><i class="fa-solid fa-circle-check"></i></span>
                            Giảm ngay 1.000.000đ
                        </div>
                        <div class="d-flex gap-3 align-item-start mb-1">
                            <span class="icon-check"><i class="fa-solid fa-circle-check"></i></span>
                            Bàn phím cơ Predator Aethon 301 TKL trị giá 2.500.000đ
                        </div>
                        <div class="d-flex gap-3 align-item-start mb-1">
                            <span class="icon-check"><i class="fa-solid fa-circle-check"></i></span>
                            Mua chuột không dây LM115G Wireless chỉ với 100,000đ.
                        </div>
                        <div class="d-flex gap-3 align-item-start mb-1">
                            <span class="icon-check"><i class="fa-solid fa-circle-check"></i></span>
                            Thu cũ đổi mới trợ giá ngay 15% đến 3 triệu.
                        </div>
                    </div>

                    <c:choose>
                        <c:when test="${item.inventory.quantity <= 0}">
                            <p class="product-detail__quantity product-detail__quantity--out-of-stock ">
                                <i class="fa-regular fa-star"></i>
                                Còn lại ${item.inventory.quantity} sản phẩm.
                            </p>
                        </c:when>
                        <c:when test="${item.inventory.quantity <= 10}">
                            <p class="product-detail__quantity product-detail__quantity--warning">
                                <i class="fa-regular fa-star"></i>
                                Còn lại ${item.inventory.quantity} sản phẩm.
                            </p>
                        </c:when>
                        <c:otherwise>
                            <p class="product-detail__quantity product-detail__quantity--available">
                                <i class="fa-regular fa-star"></i>
                                Còn lại ${item.inventory.quantity} sản phẩm.
                            </p>
                        </c:otherwise>
                    </c:choose>

                    <div class="product-detail__button-container mb-4">
                        <div class="d-flex flex-wrap gap-3 align-items-center mb-4">
                            <div class="button-quantity button-product-quantity">
                                <button type="button"><i class="fa-solid fa-minus"></i></button>
                                <label>
                                    <input type="number" tabindex="-1" value="1" min="1"
                                           max="${item.inventory.quantity}"/>
                                </label>
                                <button type="button"><i class="fa-solid fa-plus"></i></button>
                            </div>
                            <button class="button-cart" onclick="handleAddToCart(this)" data-product-id='${item.id}'>
                                <i class="fa-solid fa-cart-arrow-down"></i>
                                Thêm vào giỏ hàng
                            </button>
                        </div>
                        <div class="d-flex flex-wrap gap-5 align-items-center">
                            <button class="button-options" onclick="handleFavoriteItem('${item.id}')">
                                <i class="fa-regular fa-heart"></i>
                                Thêm vào yêu thích
                            </button>
                            <button class="button-options" onclick="handleCompareItem('${item.id}')">
                                <i class="fa-solid fa-layer-group"></i>
                                So sánh
                            </button>
                        </div>
                    </div>
                    <div class="product-detail__info-container">
                        <i class="fa-solid fa-basket-shopping"></i>
                        <span>Hiện đang có <strong>15 người đã</strong> thêm sản phẩm này vào giỏ hàng.</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="my-5">
    <c:set value="${products}" var="items" scope="request"/>
    <c:set value="Có thể bạn quan tâm" var="title" scope="request"/>
    <c:set value="category/${item.category.slug}" var="slug" scope="request"/>
    <c:import url="/components/web/section/ProductsSection.jsp"/>
</section>
<%@include file="/components/web/footer/Footer.jsp" %>
<c:import url="/components/web/modal/ProductModal.jsp"/>
<%@ include file="/common/web/script.jsp" %>
<script>
    $('.product-detail__slide__images__item img').on('mouseover', function () {
        $('.product-detail__image img').attr('src', $(this).attr('src'))
    })

    function scrollImages(action) {
        const scrollLeft = $('.product-detail__slide__images').scrollLeft();
        if (action === 'next') {
            $('.product-detail__slide__images').scrollLeft(scrollLeft + 120)
        } else if (action === 'prev') {
            $('.product-detail__slide__images').scrollLeft(scrollLeft - 120)
        }
    }
</script>
</body>
</html>