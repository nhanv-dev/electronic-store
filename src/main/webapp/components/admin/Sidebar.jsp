<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 26/04/2022
  Time: 11:15 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<aside class="sidebar">
    <div class="sidebar-primary">
        <a href="${pageContext.request.contextPath}/admin/home" class="sidebar__logo">
            <img src="<c:url value="/assets/images/logo-sm.png"/>" alt="logo">
        </a>
        <ul class="sidebar__list col">
            <li class="sidebar__item">
                <a href="${pageContext.request.contextPath}/admin/home"
                   class="sidebar__link ${page == 'home' ? 'active' : ''}">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                         viewBox="0 0 24 24" fill="none">
                        <rect x="2" y="2" width="9" height="9" rx="2"
                              fill="currentColor"></rect>
                        <rect opacity="0.3" x="13" y="2" width="9" height="9" rx="2"
                              fill="currentColor"></rect>
                        <rect opacity="0.3" x="13" y="13" width="9" height="9" rx="2"
                              fill="currentColor"></rect>
                        <rect opacity="0.3" x="2" y="13" width="9" height="9" rx="2"
                              fill="currentColor"></rect>
                    </svg>
                    <p>Tổng quan</p>
                </a>
            </li>
            <li class="sidebar__item">
                <a href="${pageContext.request.contextPath}/admin/product" class="sidebar__link">
                    <span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <path opacity="0.3"
                                  d="M21.25 18.525L13.05 21.825C12.35 22.125 11.65 22.125 10.95 21.825L2.75 18.525C1.75 18.125 1.75 16.725 2.75 16.325L4.04999 15.825L10.25 18.325C10.85 18.525 11.45 18.625 12.05 18.625C12.65 18.625 13.25 18.525 13.85 18.325L20.05 15.825L21.35 16.325C22.35 16.725 22.35 18.125 21.25 18.525ZM13.05 16.425L21.25 13.125C22.25 12.725 22.25 11.325 21.25 10.925L13.05 7.62502C12.35 7.32502 11.65 7.32502 10.95 7.62502L2.75 10.925C1.75 11.325 1.75 12.725 2.75 13.125L10.95 16.425C11.65 16.725 12.45 16.725 13.05 16.425Z"
                                  fill="currentColor"></path>
                            <path d="M11.05 11.025L2.84998 7.725C1.84998 7.325 1.84998 5.925 2.84998 5.525L11.05 2.225C11.75 1.925 12.45 1.925 13.15 2.225L21.35 5.525C22.35 5.925 22.35 7.325 21.35 7.725L13.05 11.025C12.45 11.325 11.65 11.325 11.05 11.025Z"
                                  fill="currentColor"></path>
                        </svg>
                    </span>
                    <p>Sản phẩm</p>
                </a>
            </li>
            <li class="sidebar__item">
                <a href="${pageContext.request.contextPath}/admin/category" class="sidebar__link">
                    <span>
                       <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M11.2929 2.70711C11.6834 2.31658 12.3166 2.31658 12.7071 2.70711L15.2929 5.29289C15.6834 5.68342 15.6834 6.31658 15.2929 6.70711L12.7071 9.29289C12.3166 9.68342 11.6834 9.68342 11.2929 9.29289L8.70711 6.70711C8.31658 6.31658 8.31658 5.68342 8.70711 5.29289L11.2929 2.70711Z" fill="currentColor"></path>
                            <path d="M11.2929 14.7071C11.6834 14.3166 12.3166 14.3166 12.7071 14.7071L15.2929 17.2929C15.6834 17.6834 15.6834 18.3166 15.2929 18.7071L12.7071 21.2929C12.3166 21.6834 11.6834 21.6834 11.2929 21.2929L8.70711 18.7071C8.31658 18.3166 8.31658 17.6834 8.70711 17.2929L11.2929 14.7071Z" fill="currentColor"></path>
                            <path opacity="0.3" d="M5.29289 8.70711C5.68342 8.31658 6.31658 8.31658 6.70711 8.70711L9.29289 11.2929C9.68342 11.6834 9.68342 12.3166 9.29289 12.7071L6.70711 15.2929C6.31658 15.6834 5.68342 15.6834 5.29289 15.2929L2.70711 12.7071C2.31658 12.3166 2.31658 11.6834 2.70711 11.2929L5.29289 8.70711Z" fill="currentColor"></path>
                            <path opacity="0.3" d="M17.2929 8.70711C17.6834 8.31658 18.3166 8.31658 18.7071 8.70711L21.2929 11.2929C21.6834 11.6834 21.6834 12.3166 21.2929 12.7071L18.7071 15.2929C18.3166 15.6834 17.6834 15.6834 17.2929 15.2929L14.7071 12.7071C14.3166 12.3166 14.3166 11.6834 14.7071 11.2929L17.2929 8.70711Z" fill="currentColor"></path>
                        </svg>
                    </span>
                    <p>Danh mục</p>
                </a>
            </li>
            <li class="sidebar__item">
                <a href="${pageContext.request.contextPath}/admin/order" class="sidebar__link">
                    <span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <path opacity="0.3"
                                  d="M19 22H5C4.4 22 4 21.6 4 21V3C4 2.4 4.4 2 5 2H14L20 8V21C20 21.6 19.6 22 19 22ZM16 13.5L12.5 13V10C12.5 9.4 12.6 9.5 12 9.5C11.4 9.5 11.5 9.4 11.5 10L11 13L8 13.5C7.4 13.5 7 13.4 7 14C7 14.6 7.4 14.5 8 14.5H11V18C11 18.6 11.4 19 12 19C12.6 19 12.5 18.6 12.5 18V14.5L16 14C16.6 14 17 14.6 17 14C17 13.4 16.6 13.5 16 13.5Z"
                                  fill="currentColor"></path>
                            <rect x="11" y="19" width="10" height="2" rx="1" transform="rotate(-90 11 19)"
                                  fill="currentColor"></rect>
                            <rect x="7" y="13" width="10" height="2" rx="1" fill="currentColor"></rect>
                            <path d="M15 8H20L14 2V7C14 7.6 14.4 8 15 8Z" fill="currentColor"></path>
                        </svg>
                    </span>
                    <p>Hóa đơn</p>
                </a>
            </li>
            <li class="sidebar__item">
                <a href="${pageContext.request.contextPath}/admin/staff" class="sidebar__link">
                    <span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <path opacity="0.3"
                                  d="M20 15H4C2.9 15 2 14.1 2 13V7C2 6.4 2.4 6 3 6H21C21.6 6 22 6.4 22 7V13C22 14.1 21.1 15 20 15ZM13 12H11C10.5 12 10 12.4 10 13V16C10 16.5 10.4 17 11 17H13C13.6 17 14 16.6 14 16V13C14 12.4 13.6 12 13 12Z"
                                  fill="currentColor"></path>
                            <path d="M14 6V5H10V6H8V5C8 3.9 8.9 3 10 3H14C15.1 3 16 3.9 16 5V6H14ZM20 15H14V16C14 16.6 13.5 17 13 17H11C10.5 17 10 16.6 10 16V15H4C3.6 15 3.3 14.9 3 14.7V18C3 19.1 3.9 20 5 20H19C20.1 20 21 19.1 21 18V14.7C20.7 14.9 20.4 15 20 15Z"
                                  fill="currentColor"></path>
                        </svg>
                    </span>
                    <p>Nhân viên</p>
                </a>
            </li>
            <li class="sidebar__item">
                <a href="${pageContext.request.contextPath}/admin/customer" class="sidebar__link">
                    <span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <path d="M6.28548 15.0861C7.34369 13.1814 9.35142 12 11.5304 12H12.4696C14.6486 12 16.6563 13.1814 17.7145 15.0861L19.3493 18.0287C20.0899 19.3618 19.1259 21 17.601 21H6.39903C4.87406 21 3.91012 19.3618 4.65071 18.0287L6.28548 15.0861Z"
                                  fill="currentColor"></path>
                            <rect opacity="0.3" x="8" y="3" width="8"
                                  height="8" rx="4"
                                  fill="currentColor"></rect>
                        </svg>
                    </span>
                    <p>Khách hàng</p>
                </a>
            </li>
            <li class="sidebar__item">
                <a href="${pageContext.request.contextPath}/admin/discount" class="sidebar__link">
                    <span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                             viewBox="0 0 24 24" fill="none">
                            <rect x="8" y="9" width="3" height="10" rx="1.5"
                                  fill="currentColor"></rect>
                            <rect opacity="0.5" x="13" y="5" width="3" height="14" rx="1.5"
                                  fill="currentColor"></rect>
                            <rect x="18" y="11" width="3" height="8" rx="1.5"
                                  fill="currentColor"></rect>
                            <rect x="3" y="13" width="3" height="6" rx="1.5"
                                  fill="currentColor"></rect>
                        </svg>
                    </span>
                    <p>Sự kiện</p>
                </a>
            </li>
        </ul>
        <ul class="sidebar__list ">
            <li class="sidebar__item">
                <a href="${pageContext.request.contextPath}/" class="sidebar__link">
                    <span>
                       <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                            viewBox="0 0 24 24" fill="none">
                            <rect x="2" y="2" width="9" height="9" rx="2"
                                  fill="currentColor"></rect>
                            <rect opacity="0.3" x="13" y="2" width="9" height="9" rx="2"
                                  fill="currentColor"></rect>
                            <rect opacity="0.3" x="13" y="13" width="9" height="9" rx="2"
                                  fill="currentColor"></rect>
                            <rect opacity="0.3" x="2" y="13" width="9" height="9" rx="2"
                                  fill="currentColor"></rect>
                        </svg>
                    </span>
                    <p>Trang mua sắm</p>
                </a>

            </li>
        </ul>
        <button class="sidebar__button-expand">
            <svg class="rotate-180" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                 fill="none">
                <rect opacity="0.5" x="6" y="11" width="13" height="2" rx="1"
                      fill="currentColor"></rect>
                <path d="M8.56569 11.4343L12.75 7.25C13.1642 6.83579 13.1642 6.16421 12.75 5.75C12.3358 5.33579 11.6642 5.33579 11.25 5.75L5.70711 11.2929C5.31658 11.6834 5.31658 12.3166 5.70711 12.7071L11.25 18.25C11.6642 18.6642 12.3358 18.6642 12.75 18.25C13.1642 17.8358 13.1642 17.1642 12.75 16.75L8.56569 12.5657C8.25327 12.2533 8.25327 11.7467 8.56569 11.4343Z"
                      fill="currentColor"></path>
            </svg>
        </button>
    </div>
    <div class="sidebar-expand">
        <div class="sidebar-expand__container">
            <div class="accordion" id="sidebarTab">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="sidebarTab1">
                        <button class="accordion-button collapsed d-flex align-items-center gap-2" type="button"
                                data-bs-toggle="collapse" data-bs-target="#sidebarTabContent1" aria-expanded="true"
                                aria-controls="sidebarTabContent1">
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                                     fill="none">
                                <rect x="2" y="2" width="9" height="9" rx="2" fill="currentColor"></rect>
                                <rect opacity="0.3" x="13" y="2" width="9" height="9" rx="2" fill="currentColor"></rect>
                                <rect opacity="0.3" x="13" y="13" width="9" height="9" rx="2"
                                      fill="currentColor"></rect>
                                <rect opacity="0.3" x="2" y="13" width="9" height="9" rx="2" fill="currentColor"></rect>
                                </svg>
                            </span>
                            Quản lý sản phẩm
                        </button>
                    </h2>
                    <div id="sidebarTabContent1" class="accordion-collapse collapse" aria-labelledby="sidebarTab1"
                         data-bs-parent="#sidebarTab">
                        <div class="accordion-body">
                            <a href="${pageContext.request.contextPath}/admin/product">
                                <i class="fa-solid fa-circle"></i> Danh sách sản phẩm
                            </a>

                            <a href="${pageContext.request.contextPath}/admin/product?action=add">
                                <i class="fa-solid fa-circle"></i> Thêm sản phẩm
                            </a>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="sidebarTab2">
                        <button class="accordion-button collapsed d-flex align-items-center gap-2" type="button"
                                data-bs-toggle="collapse" data-bs-target="#sidebarTabContent2" aria-expanded="false"
                                aria-controls="sidebarTabContent2">
                           <span>
                               <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                                    fill="none">
                                    <path d="M6.28548 15.0861C7.34369 13.1814 9.35142 12 11.5304 12H12.4696C14.6486 12 16.6563 13.1814 17.7145 15.0861L19.3493 18.0287C20.0899 19.3618 19.1259 21 17.601 21H6.39903C4.87406 21 3.91012 19.3618 4.65071 18.0287L6.28548 15.0861Z"
                                          fill="currentColor"></path>
                                    <rect opacity="0.3" x="8" y="3" width="8" height="8" rx="4"
                                          fill="currentColor"></rect>
                                </svg>
                           </span>
                            Quản lý nhân viên
                        </button>
                    </h2>
                    <div id="sidebarTabContent2" class="accordion-collapse collapse" aria-labelledby="sidebarTab2"
                         data-bs-parent="#sidebarTab">
                        <div class="accordion-body">
                            <a href="${pageContext.request.contextPath}/admin/staff">
                                <i class="fa-solid fa-circle"></i> Danh sách nhân viên
                            </a>
                        </div>
                    </div>
                </div>

                <div class="accordion-item">
                    <h2 class="accordion-header" id="sidebarTab3">
                        <button class="accordion-button collapsed d-flex align-items-center gap-2" type="button"
                                data-bs-toggle="collapse" data-bs-target="#sidebarTabContent3" aria-expanded="false"
                                aria-controls="sidebarTabContent3">
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                                     fill="none">
                                    <path opacity="0.3"
                                          d="M20 15H4C2.9 15 2 14.1 2 13V7C2 6.4 2.4 6 3 6H21C21.6 6 22 6.4 22 7V13C22 14.1 21.1 15 20 15ZM13 12H11C10.5 12 10 12.4 10 13V16C10 16.5 10.4 17 11 17H13C13.6 17 14 16.6 14 16V13C14 12.4 13.6 12 13 12Z"
                                          fill="currentColor"></path>
                                    <path d="M14 6V5H10V6H8V5C8 3.9 8.9 3 10 3H14C15.1 3 16 3.9 16 5V6H14ZM20 15H14V16C14 16.6 13.5 17 13 17H11C10.5 17 10 16.6 10 16V15H4C3.6 15 3.3 14.9 3 14.7V18C3 19.1 3.9 20 5 20H19C20.1 20 21 19.1 21 18V14.7C20.7 14.9 20.4 15 20 15Z"
                                          fill="currentColor"></path>
                                </svg>
                            </span>
                            Quản lý khách hàng
                        </button>
                    </h2>
                    <div id="sidebarTabContent3" class="accordion-collapse collapse" aria-labelledby="sidebarTab3"
                         data-bs-parent="#sidebarTab">
                        <div class="accordion-body">
                            <a href="${pageContext.request.contextPath}/admin/customer">
                                <i class="fa-solid fa-circle"></i> Danh sách người dùng
                            </a>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="sidebarTab4">
                        <button class="accordion-button collapsed d-flex align-items-center gap-2" type="button"
                                data-bs-toggle="collapse" data-bs-target="#sidebarTabContent4" aria-expanded="false"
                                aria-controls="sidebarTabContent4">
                            <span>
                               <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"
                                    fill="none">
                                    <path opacity="0.3"
                                          d="M18.041 22.041C18.5932 22.041 19.041 21.5932 19.041 21.041C19.041 20.4887 18.5932 20.041 18.041 20.041C17.4887 20.041 17.041 20.4887 17.041 21.041C17.041 21.5932 17.4887 22.041 18.041 22.041Z"
                                          fill="currentColor"></path>
                                    <path opacity="0.3"
                                          d="M6.04095 22.041C6.59324 22.041 7.04095 21.5932 7.04095 21.041C7.04095 20.4887 6.59324 20.041 6.04095 20.041C5.48867 20.041 5.04095 20.4887 5.04095 21.041C5.04095 21.5932 5.48867 22.041 6.04095 22.041Z"
                                          fill="currentColor"></path>
                                    <path opacity="0.3"
                                          d="M7.04095 16.041L19.1409 15.1409C19.7409 15.1409 20.141 14.7409 20.341 14.1409L21.7409 8.34094C21.9409 7.64094 21.4409 7.04095 20.7409 7.04095H5.44095L7.04095 16.041Z"
                                          fill="currentColor"></path>
                                    <path d="M19.041 20.041H5.04096C4.74096 20.041 4.34095 19.841 4.14095 19.541C3.94095 19.241 3.94095 18.841 4.14095 18.541L6.04096 14.841L4.14095 4.64095L2.54096 3.84096C2.04096 3.64096 1.84095 3.04097 2.14095 2.54097C2.34095 2.04097 2.94096 1.84095 3.44096 2.14095L5.44096 3.14095C5.74096 3.24095 5.94096 3.54096 5.94096 3.84096L7.94096 14.841C7.94096 15.041 7.94095 15.241 7.84095 15.441L6.54096 18.041H19.041C19.641 18.041 20.041 18.441 20.041 19.041C20.041 19.641 19.641 20.041 19.041 20.041Z"
                                          fill="currentColor"></path>
                                </svg>
                            </span>
                            Quản lý Hóa đơn
                        </button>
                    </h2>
                    <div id="sidebarTabContent4" class="accordion-collapse collapse" aria-labelledby="sidebarTab4"
                         data-bs-parent="#sidebarTab">
                        <div class="accordion-body">
                            <a href="${pageContext.request.contextPath}/admin/order">
                                <i class="fa-solid fa-circle"></i> Danh sách hóa đơn
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</aside>