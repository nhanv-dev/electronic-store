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
    <title>Yêu thích | Valex</title>
    <%@ include file="/common/web/style.jsp" %>
</head>
<body style="background: #F5F8FAFF">
<c:import url="/components/web/header/Header.jsp"/>

<section class="my-5">
    <div class="container" id="wishlist-container">
        <c:choose>
            <c:when test="${wishList != null && wishList.items.size() > 0}">
                <div class="wishlist">
                    <div class="wishlist__header">
                        <div class="row g-4 align-items-center">
                            <p style="width: 40px"></p>
                            <p class="col">Sản phẩm</p>
                            <p class="col-2 text-end">Giá</p>
                            <p class="col-2 text-end">Loại</p>
                            <p class="col-2 text-end">Thao tác</p>
                        </div>
                    </div>
                    <div class="wishlist__container">
                        <c:forEach var="item" items="${wishList.items}">
                            <div class="wishlist-item w-100">
                                <div class="row g-4 align-items-center">
                                    <div style="width: 40px">
                                        <button class="button-delete"
                                                onclick="handleRemoveFavoriteItem(this, '${item.id}')" type="button">
                                            <i class="fa-solid fa-xmark"></i>
                                        </button>
                                    </div>
                                    <div class="col">
                                        <div class="d-flex gap-3">
                                            <a href="${pageContext.request.contextPath}/product/${item.product.slug}"
                                               class="wishlist-item__image">
                                                <c:choose>
                                                    <c:when test="${item.product.images != null && item.product.images.size() > 0}">
                                                        <img src="${item.product.images.get(0).url}"
                                                             alt="${item.product.name}"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="${pageContext.request.contextPath}/assets/images/no-image.png"
                                                             alt="${item.product.name}"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </a>
                                            <div class="d-flex flex-column gap-2">
                                                <a href="${pageContext.request.contextPath}/product/${item.product.slug}"
                                                   class="wishlist-item__name">
                                                        ${item.product.name}
                                                </a>
                                                <p style="font-size: 13px;font-weight: 500;color: #666">
                                                    Sku: ${item.product.sku}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-2 text-end">
                                        <div class="wishlist-item__price">
                                            <c:choose>
                                                <c:when test="${item.product.discount != null && item.product.discount.active == true}">
                                                    <p class="wishlist-item__price--old">
                                                        <fmt:formatNumber value="${item.product.price}"
                                                                          type="currency"/>
                                                    </p>
                                                    <p class="wishlist-item__price--new">
                                                        <fmt:formatNumber type="currency"
                                                                          value="${item.product.price * (1 - item.product.discount.percent)}"/>
                                                    </p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p>
                                                        <fmt:formatNumber type="currency"
                                                                          value="${item.product.price}"/>
                                                    </p>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="col-2 text-end">
                                        <a href="${pageContext.request.contextPath}/category/ ${item.product.category.slug}"
                                           class="wishlist-item__category">
                                                ${item.product.category.name}
                                        </a>
                                    </div>
                                    <div class="col-2 text-end">
                                        <button class="wishlist-item__button-addToCart"
                                                onclick="addToCart('${item.product.id}')" type="button">
                                            <span>Thêm vào giỏ hàng</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="d-flex align-items-center justify-content-between py-4">
                            <p id="span-amount-footer" style="font-weight: 500; font-size: 15px">
                                Hiện có ${wishList.items.size()} sản phẩm được yêu thích.
                            </p>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <section class="py-5">
                    <div class="container text-center">
                        <div class="list-product--not-found">
                            <div class="list-product--not-found__image">
                                <img src="https://cdni.iconscout.com/illustration/premium/thumb/sorry-item-not-found-3328225-2809510.png"
                                     alt="not found image"/>
                            </div>
                            <h5 class="list-product--not-found__message">Bạn chưa yêu thích sản phẩm nào.</h5>
                            <a class="list-product--not-found__link"
                               href="${pageContext.request.contextPath}/category/">
                                Tiếp tục mua sắm
                            </a>
                        </div>
                    </div>
                </section>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<section class="py-5" style="background: white">
    <div class="container">
        <div class="d-flex align-items-end justify-content-between my-4 py-3 border-bottom">
            <h5 class="mb-0">Có thể bạn quan tâm</h5>
            <a href="${pageContext.request.contextPath}/category/${item.category.slug}"
               class="d-flex align-items-center justify-items-end gap-2"
               style="font-size: 14px; font-weight: 500; letter-spacing: 0.5px;">
                <span>Xem tất cả</span>
                <i class="fa-solid fa-arrow-right" style="font-size: 12px"></i>
            </a>
        </div>
        <div class="row row-cols-2 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 g-0">
            <c:forEach var="product" items="${products}" end="4">
                <c:set var="product" value="${product}" scope="request"/>
                <div class="col">
                    <c:import url="/components/web/cards/ProductCard.jsp"/>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<%@include file="/components/web/footer/Footer.jsp" %>
<c:import url="/components/web/modal/ProductModal.jsp"/>
<%@ include file="/common/web/script.jsp" %>
<script>
    function addToCart(id) {
        axios({method: "post", url: `${pageContext.request.contextPath}/cart`, data: {productId: id, quantity: "1"}})
            .then((response) => {
                handleUpdateCart(response.data)
                showSuccessToast("Đã thêm vào giỏ hàng")
            })
            .catch(() => showFailToast("Vui lòng thử lại"))
    }
</script>
</body>
</html>