<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 14/04/2022
  Time: 8:00 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <title>Trang chủ | Valex</title>
    <%@ include file="/common/web/style.jsp" %>
    <style>
        .banner-title {
            font-size: 28px;
            font-weight: 700;
            line-height: 32px;
            color: #121212;
            text-transform: capitalize;
        }

        .banner-subtitle {
            color: #5e5e5e;
            font-size: 17px;
            letter-spacing: 1px;
            line-height: 30px;
            font-weight: 600;
            text-transform: capitalize;
            margin: 1rem 0;
        }

        .banner-link {
            font-size: 14px;
            color: #3079f1;
            font-weight: 700;
            border-bottom: 2px solid #c2d0f1;
            margin: 25px 0 0 0;
            display: inline-block;
            text-transform: uppercase;
        }
    </style>
</head>
<body>
<c:import url="/components/web/header/Header.jsp"/>
<section class="pt-5">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-4">
                <div class="banner">
                    <img src="http://opencart.templatemela.com/OPCADD3/OPC071/image/catalog/Category-banner1.jpg"
                         alt="banner">
                    <div class="position-absolute p-4" style="left: 0;top: 0">
                        <p style="font-size: 16px;font-weight: bold;text-transform: capitalize;color: #f50000;margin-bottom: 10px;">
                            Giảm giá 30%
                        </p>
                        <h5 class="banner-title mb-0">Digital Watch</h5>
                        <a href="${pageContext.request.contextPath}/category" class="banner-link">Mua ngay</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="row g-4">
                    <div class="col-12">
                        <div class="banner">
                            <img src="http://opencart.templatemela.com/OPCADD3/OPC071/image/catalog/Category-banner2.jpg"
                                 alt="banner">
                            <div class="position-absolute p-4" style="left: 0;top: 0">
                                <p style="font-size: 16px;font-weight: bold;text-transform: capitalize;color: #f50000;margin-bottom: 10px;">
                                    sản phẩm mới
                                </p>
                                <h5 class="banner-title mb-0">Audio System</h5>
                                <a href="${pageContext.request.contextPath}/category" class="banner-link">Xem ngay</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="banner">
                            <img src="http://opencart.templatemela.com/OPCADD3/OPC071/image/catalog/Category-banner3.jpg"
                                 alt="banner">
                            <div class="position-absolute p-4 text-end" style="right: 0;top: 0">
                                <p style="font-size: 16px;font-weight: bold;text-transform: capitalize;color: #f50000;margin-bottom: 10px;">
                                    sản phẩm mới
                                </p>
                                <h5 class="banner-title mb-0">Earphone</h5>
                                <a href="${pageContext.request.contextPath}/category" class="banner-link">Xem ngay</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="banner">
                    <img src="http://opencart.templatemela.com/OPCADD3/OPC071/image/catalog/Category-banner4.jpg"
                         alt="banner">
                    <div class="position-absolute p-4 text-center"
                         style="left: 50%; top: 0; transform: translateX(-50%)">
                        <p style="font-size: 16px;font-weight: bold;text-transform: capitalize;color: #f50000;margin-bottom: 10px;">
                            sắp về
                        </p>
                        <h5 class="banner-title mb-0" style="min-width: max-content">New collection</h5>
                        <a href="${pageContext.request.contextPath}/category" class="banner-link">Xem ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<c:if test="${topSaleProducts != null && topSaleProducts.size() >=8}">
    <section class="pt-5">
        <div class="container">
            <div id="special-products" class="special-products">
                <div class="special-products__banner">
                    <img src="https://demo2wpopal.b-cdn.net/digitaz/wp-content/uploads/2022/04/h4_image-special.png"
                         alt="banner">
                </div>
                <div class="special-products__container ms-0 ms-lg-5">
                    <div class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active" data-bs-interval="3000">
                                <div class="row row-cols-1 row-cols-lg-3 g-4">
                                    <c:forEach items="${topSaleProducts}" var="product" end="2">
                                        <c:set var="product" value="${product}" scope="request"/>
                                        <div class="col">
                                            <c:import url="/components/web/cards/SmallVerticalCard.jsp"/>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="carousel-item" data-bs-interval="3000">
                                <div class="row row-cols-3">
                                    <c:forEach items="${topSaleProducts}" var="product" begin="3" end="5">
                                        <c:set var="product" value="${product}" scope="request"/>
                                        <div class="col">
                                            <c:import url="/components/web/cards/SmallVerticalCard.jsp"/>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="carousel-item" data-bs-interval="3000">
                                <div class="row row-cols-3">
                                    <c:forEach items="${topSaleProducts}" var="product" begin="6" end="8">
                                        <c:set var="product" value="${product}" scope="request"/>
                                        <div class="col">
                                            <c:import url="/components/web/cards/SmallVerticalCard.jsp"/>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</c:if>
<section class="py-5">
    <div class="container">
        <div id="bestseller">
            <nav class="bestseller__nav">
                <h5 class="bestseller__title">Bán chạy</h5>
                <div class="nav nav-pills bestseller__nav-pills" id="nav-tab" role="tablist">
                    <c:forEach var="products" items="${lists}" varStatus="status">
                        <c:set var="category" value="${products.get(0).category}"/>
                        <button class="nav-link ${status.index == 0 ? 'active' :''}" id="nav-${category.id}-tab"
                                data-bs-toggle="tab" data-bs-target="#nav-${category.id}"
                                type="button" role="tab" aria-controls="nav-${category.id}" aria-selected="true">
                                ${category.name}
                        </button>
                    </c:forEach>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <c:forEach var="products" items="${lists}" varStatus="status">
                    <c:set var="category" value="${products.get(0).category}"/>
                    <div class="tab-pane fade ${status.index == 0 ? 'show active' : ''}" id="nav-${category.id}"
                         role="tabpanel" aria-labelledby="nav-${category.id}-tab">
                        <div class="row row-cols-2 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 g-0">
                            <c:forEach var="product" items="${products}">
                                <c:set var="product" value="${product}" scope="request"/>
                                <div class="col col-border col-border-sm-2 col-border-md-2 col-border-lg-3 col-border-xl-5">
                                    <c:import url="/components/web/cards/ProductCard.jsp"/>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>



<%@include file="/components/web/footer/Footer.jsp" %>
<c:import url="/components/web/modal/ProductModal.jsp"/>
<%@ include file="/common/web/script.jsp" %>

</body>
</html>