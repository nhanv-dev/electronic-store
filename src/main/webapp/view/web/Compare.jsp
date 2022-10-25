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
    <title>So sánh | Digitaz</title>
    <%@ include file="/common/web/style.jsp" %>

</head>
<body style="background: #fff">
<c:import url="/components/web/header/Header.jsp"/>

<div id="compare">
    <section class="container mt-4 mb-5">
        <div class="breadcrumb-container">
            <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
            <a href="${pageContext.request.contextPath}/compare">So sánh</a>
        </div>
    </section>
    <section class="mb-5">
        <div class="container">
            <c:choose>
                <c:when test="${sessionScope.compareProducts != null && sessionScope.compareProducts.size() > 0}">
                    <div class="header-compare-list ">
                        <div class="header-compare-list__message">
                            <p>Hiện đang so sánh ${sessionScope.compareProducts.size()} sản phẩm.</p>
                        </div>
                        <div class="d-flex align-items-center gap-2">
                            <button id="scroll-left-btn"><i class="fa-solid fa-angle-left"></i></button>
                            <button id="scroll-right-btn"><i class="fa-solid fa-angle-right"></i></button>
                        </div>
                    </div>
                    <div class="row g-0">
                        <div class="col-2">
                            <div class="compare-sidebar">
                                <div class="compare-item__container compare-item__container__image"></div>
                                <div class="compare-item__container compare-item__container__name">
                                    <h5>Tên</h5>
                                </div>
                                <div class="compare-item__container compare-item__container__price">
                                    <h5>Giá</h5>
                                </div>
                                <div class="compare-item__container compare-item__container__options">
                                    <h5>Thao tác</h5>
                                </div>
                                <div class="compare-item__container compare-item__container__desc">
                                    <h5>Thông tin</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-10">
                            <div id="compare-list" class="h-100">
                                <c:forEach var="product" items="${sessionScope.compareProducts}">
                                    <div class="compare-item-container col-6 col-md-4 col-lg-4 col-xl-3 col-border h-100">
                                        <div class="compare-item h-100">
                                            <div class="compare-item__container compare-item__container__image">
                                                <div class="position-relative">
                                                    <a href="${pageContext.request.contextPath}/product/${product.slug}"
                                                       class="compare-item__image">
                                                        <img src="${product.images[0].url}" alt="${product.name}">
                                                    </a>
                                                    <c:if test="${product.discount != null && product.discount.active == true}">
                                                        <p class="compare-item__tag">
                                                            -<fmt:formatNumber type="percent" maxIntegerDigits="3"
                                                                               value="${product.discount.percent}"/>
                                                        </p>
                                                    </c:if>
                                                    <c:choose>
                                                        <c:when test="${product.inventory.quantity <= 0 }">
                                                            <div class="d-flex align-items-center justify-content-center">
                                                                <div class="compare-item__inventory compare-item__inventory--red">
                                                                    Hết hàng
                                                                </div>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="d-flex align-items-center justify-content-center">
                                                                <div class="compare-item__inventory compare-item__inventory--green">
                                                                    Còn hàng
                                                                </div>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                            <div class="compare-item__container compare-item__container__name">
                                                <a href="${pageContext.request.contextPath}/product/${product.slug}"
                                                   class="compare-item__name">${product.name}</a>
                                            </div>
                                            <div class="compare-item__container compare-item__container__price">
                                                <div class="d-flex gap-2 align-items-end justify-content-start flex-wrap">
                                                    <c:choose>
                                                        <c:when test="${product.discount != null && product.discount.active == true}">
                                                        <span class="compare-item__price--new">
                                                            <fmt:formatNumber
                                                                    value="${product.price * (1 - product.discount.percent)}"
                                                                    type="currency"/>
                                                        </span>
                                                            <span class="compare-item__price--old">
                                                            <fmt:formatNumber value="${product.price}" type="currency"/>
                                                        </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <span class="compare-item__price">
                                                            <fmt:formatNumber type="currency" value="${product.price}"/>
                                                        </span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                            <div class="compare-item__container compare-item__container__options">
                                                <div class="compare-item__options">
                                                    <button onclick="handleFavoriteItem('${product.id}')" type="button">
                                                        <i class="fa-regular fa-heart"></i>
                                                    </button>
                                                    <button onclick="addToCart('${product.id}')" type="button">
                                                        <i class="fa-solid fa-cart-arrow-down"></i>
                                                    </button>
                                                    <button onclick="removeFromCompare(this, '${product.id}')"
                                                            type="button">
                                                        <i class="fa-solid fa-trash-can"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="compare-item__container compare-item__container__desc">
                                                <div class="compare-item__desc">${product.desc}</div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="list-product--not-found">
                        <div class="list-product--not-found__image">
                            <img src="https://cdni.iconscout.com/illustration/premium/thumb/sorry-item-not-found-3328225-2809510.png"
                                 alt="not found image"/>
                        </div>
                        <h5 class="list-product--not-found__message">Bạn chưa thêm sản phẩm vào danh sách so sánh.</h5>
                        <a href="${pageContext.request.contextPath}/category" class="list-product--not-found__message">
                            Tiếp tục mua sắm
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </section>
</div>
<%@include file="/components/web/footer/Footer.jsp" %>
<c:import url="/components/web/modal/ProductModal.jsp"/>
<%@ include file="/common/web/script.jsp" %>
<script>
    function removeFromCompare(element, id) {
        axios({method: "delete", url: `${pageContext.request.contextPath}/compare`, data: {productId: id}})
            .then((response) => {
                const products = JSON.parse(response.data.products)
                if (products.length <= 0) {
                    $(element).closest('.container').html(`
                        <div class="list-product--not-found">
                            <div class="list-product--not-found__image">
                                <img src="https://cdni.iconscout.com/illustration/premium/thumb/sorry-item-not-found-3328225-2809510.png"
                                     alt="not found image"/>
                            </div>
                            <h5 class="list-product--not-found__message">Bạn chưa thêm sản phẩm vào danh sách so sánh.</h5>
                            <a href="${pageContext.request.contextPath}/category" class="list-product--not-found__message">
                                Tiếp tục mua sắm
                            </a>
                        </div>
                    `)
                } else {
                    $(element).closest('.compare-item-container').remove()
                    $('.header-compare-list__message p').html('Hiện đang so sánh ' + products.length + ' sản phẩm.')
                }
                showSuccessToast("Đã xóa sản phẩm so sánh")
            })
            .catch((err) => {
                console.log(err)
                showFailToast("Vui lòng thử lại")
            })
    }

    function addToCart(id) {
        axios({method: "post", url: `${pageContext.request.contextPath}/cart`, data: {productId: id, quantity: "1"}})
            .then((response) => {
                handleUpdateCart(response.data)
                showSuccessToast("Đã thêm vào giỏ hàng")
            })
            .catch(() => showFailToast("Vui lòng thử lại"))
    }

    $(document).ready(function () {
        const compareList = $('#compare-list')
        $('#scroll-left-btn').click(function () {
            const width = $('#compare-list div').width()
            compareList.scrollLeft(compareList.scrollLeft() - width * 2)
        })

        $('#scroll-right-btn').click(function () {
            const width = $('#compare-list div').width()
            compareList.scrollLeft(compareList.scrollLeft() + width * 2)
        })
    })
</script>
</body>
</html>