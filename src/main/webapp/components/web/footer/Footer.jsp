<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 10/05/2022
  Time: 12:03 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<a class="button-scroll-to-top" href="#">
    <i class="fa-solid fa-angle-up"></i>
</a>
<footer class="footer">
    <div class="footer__center">
        <div class="container">
            <div class="row justify-content-start align-items-start g-lg-5">
                <div class="col-4">
                    <div class="footer__center__logo">
                        <img src="<c:url value="/assets/images/logo-light.png"/>" alt="logo">
                    </div>
                    <div class="footer__center__intro">
                        Ứng dụng mua sắm trực tuyến thú vị, tin cậy, an toàn và miễn phí! Valex là nền tảng giao dịch
                        trực tuyến hàng đầu. Với sự đảm bảo của Valex, bạn sẽ mua hàng trực tuyến an tâm và nhanh
                        chóng
                        hơn bao giờ hết!
                    </div>

                </div>
                <div class="col">
                    <h5 class="footer__center__header">Cửa hàng</h5>
                    <ul class="footer__center__list">
                        <li class="footer__center__item">
                            <a href="${pageContext.request.contextPath}/">Trang chủ</a>
                        </li>
                        <li class="footer__center__item">
                            <a href="${pageContext.request.contextPath}/about">Về chúng tôi</a>
                        </li>
                        <li class="footer__center__item">
                            <a href="${pageContext.request.contextPath}/">Chính sách bán hàng</a>
                        </li>
                        <li class="footer__center__item">
                            <a href="${pageContext.request.contextPath}/contact">Liên hệ</a>
                        </li>
                    </ul>
                </div>
                <div class="col">
                    <h5 class="footer__center__header">Tài khoản</h5>
                    <ul class="footer__center__list">
                        <li class="footer__center__item">
                            <a href="${pageContext.request.contextPath}/account/">Thông tin</a>
                        </li>
                        <li class="footer__center__item">
                            <a href="${pageContext.request.contextPath}/account/">Hóa đơn</a>
                        </li>
                        <li class="footer__center__item">
                            <a href="${pageContext.request.contextPath}/account/">Giỏ hàng</a>
                        </li>
                        <li class="footer__center__item">
                            <a href="${pageContext.request.contextPath}/account/">Sản phẩm yêu thích</a>
                        </li>
                    </ul>
                </div>
                <div class="col-3">
                    <h5 class="footer__center__header">Thông tin liên Hệ</h5>
                    <ul class="footer__center__list">
                        <li class="footer__center__item">
                            <i class="fa-solid fa-location-dot"></i>
                            <span>
                                Khu phố 6, Phường Linh Trung, TP. Thủ Đức, TP. Hồ Chí Minh
                            </span>
                        </li>
                        <li class="footer__center__item">
                            <i class="fa-solid fa-phone"></i>
                            <span>(+800) 123 456 7890</span>
                        </li>
                        <li class="footer__center__item">
                            <i class="fa-regular fa-envelope-open"></i>
                            <span>customer_support@example.com</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="footer__bottom ">
        <div class="container">
            <div class="footer__bottom__tags">
                <h5 class="footer__bottom__tags__title">Danh mục:</h5>
                <div class="footer__bottom__tags__container">
                    <c:forEach items="${sessionScope.categories}" var="category">
                        <a href="${pageContext.request.contextPath}/category/${category.slug}">
                            <span>${category.name}</span>
                        </a>
                    </c:forEach>
                </div>
            </div>
            <div class="d-flex align-items-center justify-content-between gap-3">
                <div class="footer__bottom__left">
                    <span>Copyright © 2021.</span>
                    <span class="d-flex gap-3 align-items-center justify-content-center">
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-twitter"></i>
                        <i class="fa-brands fa-instagram"></i>
                        <i class="fa-brands fa-pinterest"></i>
                    </span>
                </div>
                <div class="footer__bottom__logo">
                    <img src="<c:url value="/assets/images/logo-light.png"/>" alt="logo">
                </div>
                <div class="footer__bottom__right">
                    <img src="<c:url value="/assets/images/footer1_img2.png"/>" alt="footer-right">
                </div>
            </div>
        </div>
    </div>
</footer>
