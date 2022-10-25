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
    <title>${category != null ? category.name : 'Danh mục'} | Valex</title>
    <%@ include file="/common/web/style.jsp" %>
    <script src="<c:url value="/assets/library/jquery-nice-select-1.1.0/css/nice-select.css"/>"></script>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css"
          integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body style="background: #fff">
<c:import url="/components/web/header/Header.jsp"/>

<section class="container my-4">
    <div class="breadcrumb-container">
        <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/category">Danh mục</a>
        <c:if test="${param.searching != null}">
            <a>Tìm kiếm</a>
        </c:if>
        <c:if test="${category != null}">
            <a>${category.name}</a>
        </c:if>
    </div>
</section>

<section class="mb-5">
    <div class="container">
        <div class="row g-4">
            <div class="col-12">
            </div>
            <div class="col-3">
                <c:import url="/components/web/sidebar/Sidebar.jsp"/>
                <img class="w-100"
                     src="https://images.fpt.shop/unsafe/fit-in/248x248/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/6/2/637897617621136223_F-H4_248x248.png"
                     alt="">
            </div>
            <div class="col-12 col-md-8 col-lg-9">
                <div class="header-list-card">
                    <div class="category-show">
                        <button class="category-show-grid"><i class="fa-solid fa-braille"></i></button>
                        <button class="category-show-list"><i class="fa-solid fa-list"></i></button>
                    </div>
                    <form class="category-right">
                        <%
                            if (request.getParameter("searching") != null)
                                out.println("<input type='hidden' name='searching' value='" + request.getParameter("searching") + "'>");
                            if (request.getParameter("price") != null)
                                out.println("<input type='hidden' name='price' value='" + request.getParameter("price") + "'>");
                            if (request.getParameter("status") != null)
                                out.println("<input type='hidden' name='status' value='" + request.getParameter("status") + "'>");
                            if (request.getParameter("discount") != null)
                                out.println("<input type='hidden' name='discount' value='" + request.getParameter("discount") + "'>");
                        %>
                        <label for="show">Hiển thị: </label>
                        <select id="show" name="show" onchange="this.form.submit()">
                            <option value="16"${param.show == "16" ? 'selected':''}>
                                16
                            </option>
                            <option value="24" ${param.show == "24" ? 'selected':''}>
                                24
                            </option>
                            <option value="32" ${param.show == "32" ? 'selected':''}>
                                32
                            </option>
                            <option value="48" ${param.show == "48" ? 'selected':''}>
                                48
                            </option>
                        </select>
                        <label for="sort"> Sắp xếp theo: </label>
                        <select id="sort" name="sort" onchange="this.form.submit()">
                            <option value="ten-tang-dan" ${param.sort == "ten-tang-dan" ? 'selected':''}>
                                Tên: A - Z
                            </option>
                            <option value="ten-giam-dan" ${param.sort == "ten-giam-dan" ? 'selected':''}>
                                Tên: Z - A
                            </option>
                            <option value="gia-tang-dan" ${param.sort == "gia-tang-dan" ? 'selected':''}>
                                Giá: tăng dần
                            </option>
                            <option value="gia-giam-dan" ${param.sort == "gia-giam-dan" ? 'selected':''}>
                                Giá: giảm dần
                            </option>
                        </select>
                    </form>
                </div>
                <c:choose>
                    <c:when test="${products != null && products.size() > 0}">
                        <div id="grid-product"
                             class="row row-cols-2 row-cols-sm-2 row-cols-md-2 row-cols-lg-3 row-cols-xl-4 g-0">
                            <c:forEach var="product" items="${products}">
                                <c:set var="product" value="${product}"
                                       scope="request"/>
                                <div class="col col-border col-border-sm-2 col-border-md-2 col-border-lg-3 col-border-xl-4">
                                    <c:import url="/components/web/cards/ProductCard.jsp"/>
                                </div>
                            </c:forEach>
                        </div>
                        <div id="list-product" class="d-none row row-cols-1 g-4">
                            <c:forEach var="product" items="${products}">
                                <c:set var="product" value="${product}" scope="request"/>
                                <div class="col-12">
                                    <c:import url="/components/web/cards/ProductCardList.jsp"/>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="list-product--not-found">
                            <div class="list-product--not-found__image">
                                <img src="https://cdni.iconscout.com/illustration/premium/thumb/sorry-item-not-found-3328225-2809510.png"
                                     alt="not found image"/>
                            </div>
                            <h5 class="list-product--not-found__message">Không tìm thấy sản phẩm</h5>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div class="data-container"></div>
                <div class="pagination">
                    <p class="pagination__message">
                        Hiển thị ${paginable.offset + 1} - ${paginable.offset + products.size()} sản phẩm
                        trong ${paginable.totalProduct} sản phẩm.
                    </p>
                    <%
                        String params = "";
                        if (request.getParameter("searching") != null)
                            params += "&searching=" + request.getParameter("searching");
                        if (request.getParameter("show") != null)
                            params += "&show=" + request.getParameter("show");
                        if (request.getParameter("sort") != null)
                            params += "&sort=" + request.getParameter("sort");
                        if (request.getParameter("price") != null)
                            params += "&price=" + request.getParameter("price");
                        if (request.getParameter("status") != null)
                            params += "&status=" + request.getParameter("status");
                        if (request.getParameter("discount") != null)
                            params += "&discount=" + request.getParameter("discount");
                    %>
                    <div class="pagination__container">
                        <ul>
                            <li>
                                <a href="${pageContext.request.contextPath}/category/${category.slug}?page=${paginable.page > 1 ? paginable.page - 1 : 1}<%=params%>">
                                    <i class="fa-solid fa-angle-left"></i>
                                </a>
                            </li>
                            <c:forEach begin="1" end="${paginable.totalPage}" var="page">
                                <li>
                                    <a href="${pageContext.request.contextPath}/category/${category.slug}?page=${page}<%=params%>"
                                       class="${page == paginable.page ? 'active':''}">
                                            ${page}
                                    </a>
                                </li>
                            </c:forEach>
                            <li>
                                <a href="${pageContext.request.contextPath}/category/${category.slug}?page=${paginable.page < paginable.totalPage ? paginable.page + 1 :  paginable.totalPage}<%=params%>">
                                    <i class="fa-solid fa-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="/components/web/footer/Footer.jsp" %>
<c:import url="/components/web/modal/ProductModal.jsp"/>
<%@ include file="/common/web/script.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"
        integrity="sha512-NqYds8su6jivy1/WLoW8x1tZMRD7/1ZfhWG/jcRQLOzV1k1rIODCpMgoBnar5QXshKJGV7vi0LXLNXPoFsM5Zg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    $(document).ready(function () {
        $('select').niceSelect()

        const list = $('#list-product')
        const grid = $('#grid-product')
        $('.category-show-grid').on('click', setGridLayout)
        $('.category-show-list').on('click', setListLayout)

        if (sessionStorage.getItem('layout') === 'list') setListLayout()
        else setGridLayout()

        function setGridLayout() {
            list.addClass('d-none')
            grid.removeClass('d-none')
            $('.category-show-grid').addClass('active')
            $('.category-show-list').removeClass('active')
            sessionStorage.setItem('layout', 'grid')
        }

        function setListLayout() {
            grid.addClass('d-none')
            list.removeClass('d-none')
            $('.category-show-list').addClass('active')
            $('.category-show-grid').removeClass('active')
            sessionStorage.setItem('layout', 'list')
        }
    })
</script>
</body>

</html>