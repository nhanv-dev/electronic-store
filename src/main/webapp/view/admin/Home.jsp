<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 24/04/2022
  Time: 6:15 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="vi_VN"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Tổng quan</title>
    <%@ include file="/common/admin/style.jsp" %>
</head>
<body>
<%@ include file="/components/admin/Sidebar.jsp" %>
<div class="main-content">
    <%@ include file="/components/admin/Header.jsp" %>
    <div class="container px-3 py-5">
        <div class="row g-4 mb-4">
            <div class="col-6 col-lg-3">
                <div class="container-card">
                    <div class="container-card__header mb-0">
                        <div class="container-card__header__title">
                            Quản lý sản phẩm
                        </div>
                        <a href="${pageContext.request.contextPath}/admin/product"
                           class="container-card__header__link">
                            <i class="fa-solid fa-chevron-right"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="container-card">
                    <div class="container-card__header mb-0">
                        <div class="container-card__header__title">
                            Quản lý hóa đơn
                        </div>
                        <a href="${pageContext.request.contextPath}/admin/customer"
                           class="container-card__header__link">
                            <i class="fa-solid fa-chevron-right"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="container-card">
                    <div class="container-card__header mb-0">
                        <div class="container-card__header__title">
                            Quản lý nhân viên
                        </div>
                        <a href="${pageContext.request.contextPath}/admin/staff"
                           class="container-card__header__link">
                            <i class="fa-solid fa-chevron-right"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-6 col-lg-3">
                <div class="container-card">
                    <div class="container-card__header mb-0">
                        <div class="container-card__header__title">
                            Quản lý người dùng
                        </div>
                        <a href="${pageContext.request.contextPath}/admin/customer"
                           class="container-card__header__link">
                            <i class="fa-solid fa-chevron-right"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row g-4">
            <div class="col-12 col-lg-9">
                <div class="row g-4">
                    <div class="col-12">
                        <div class="container-card">
                            <div class="container-card__header">
                                <div class="container-card__header__title">
                                    Sự kiện & Giảm giá
                                </div>
                                <a href="${pageContext.request.contextPath}/admin/discount"
                                   class="container-card__header__link">
                                    <i class="fa-solid fa-chevron-right"></i>
                                </a>
                            </div>
                            <div id="carouselDiscount" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-indicators">
                                    <div class="container-discount__header__group-button">
                                        <button type="button" data-bs-target="#carouselDiscount"
                                                data-bs-slide-to="0"
                                                class="active" aria-current="true"
                                                aria-label="Slide 1"></button>
                                        <button type="button" data-bs-target="#carouselDiscount"
                                                data-bs-slide-to="1"
                                                aria-label="Slide 2"></button>
                                        <button type="button" data-bs-target="#carouselDiscount"
                                                data-bs-slide-to="2"
                                                aria-label="Slide 3"></button>
                                    </div>
                                </div>
                                <div class="carousel-inner">
                                    <div class="carousel-item active" data-bs-interval="5000">
                                        <div class="container-discount__image">
                                            <img src="https://images.fpt.shop/unsafe/fit-in/1200x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/6/2/637897617765668201_F-C1_1200x300.png">
                                        </div>
                                    </div>
                                    <div class="carousel-item" data-bs-interval="5000">
                                        <div class="container-discount__image">
                                            <img src="https://images.fpt.shop/unsafe/fit-in/1200x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/6/13/637907395094926862_F-C1_1200x300-4.png">
                                        </div>
                                    </div>
                                    <div class="carousel-item" data-bs-interval="5000">
                                        <div class="container-discount__image">
                                            <img src="https://images.fpt.shop/unsafe/fit-in/1200x300/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2022/6/14/637908007106474980_F-C1_1200x300.jpg">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="container-card">
                            <div class="container-card__header">
                                <div class="container-card__header__title">
                                    Thống kê doanh thu
                                </div>
                                <a href="${pageContext.request.contextPath}/admin/staff"
                                   class="container-card__header__link">
                                    <i class="fa-solid fa-ellipsis"></i>
                                </a>
                            </div>
                            <div>
                                <canvas id="chartCategory"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-3">
                <div class="row g-4">
                    <div class="col-12">
                        <div class="container-card">
                            <div class="container-card__header">
                                <div class="container-card__header__title">Hoạt động gần đây</div>
                            </div>
                            <div class="container-activities">
                                <div class="container-activities__item">
                                    <div class="container-activities__item__left">
                                        <i class="fa-regular fa-circle"></i>
                                    </div>
                                    <p class="container-activities__item__right">
                                        Trần Thanh Nhân - vừa truy cập vào trang quản trị.
                                    </p>
                                </div>
                                <div class="container-activities__item">
                                    <div class="container-activities__item__left">
                                        <i class="fa-regular fa-circle"></i>
                                    </div>
                                    <p class="container-activities__item__right">
                                        Trần Thanh Nhân - vừa truy cập vào trang quản trị.
                                    </p>
                                </div>
                                <div class="container-activities__item">
                                    <div class="container-activities__item__left">
                                        <i class="fa-regular fa-circle"></i>
                                    </div>
                                    <p class="container-activities__item__right">
                                        Trần Thanh Nhân - vừa truy cập vào trang quản trị.
                                    </p>
                                </div>
                                <div class="container-activities__item">
                                    <div class="container-activities__item__left">
                                        <i class="fa-regular fa-circle"></i>
                                    </div>
                                    <p class="container-activities__item__right">
                                        Trần Thanh Nhân - vừa truy cập vào trang quản trị.
                                    </p>
                                </div>
                                <div class="container-activities__item">
                                    <div class="container-activities__item__left">
                                        <i class="fa-regular fa-circle"></i>
                                    </div>
                                    <p class="container-activities__item__right">
                                        Trần Thanh Nhân - vừa truy cập vào trang quản trị.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="container-web">
                            <div class="container-web__wrapper--top">
                                Giao diện <br>trang mua sắm
                            </div>
                            <div class="container-web__wrapper--bottom">
                                <a href="${pageContext.request.contextPath}/home">
                                    trang chủ
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                         viewBox="0 0 24 24"
                                         fill="none">
                                        <rect opacity="0.5" x="18" y="13" width="13" height="2" rx="1"
                                              transform="rotate(-180 18 13)" fill="currentColor"></rect>
                                        <path d="M15.4343 12.5657L11.25 16.75C10.8358 17.1642 10.8358 17.8358 11.25 18.25C11.6642 18.6642 12.3358 18.6642 12.75 18.25L18.2929 12.7071C18.6834 12.3166 18.6834 11.6834 18.2929 11.2929L12.75 5.75C12.3358 5.33579 11.6642 5.33579 11.25 5.75C10.8358 6.16421 10.8358 6.83579 11.25 7.25L15.4343 11.4343C15.7467 11.7467 15.7467 12.2533 15.4343 12.5657Z"
                                              fill="currentColor"></path>
                                    </svg>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/common/admin/script.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/assets/admin/js/chart.js"/>"></script>
</body>
</html>
