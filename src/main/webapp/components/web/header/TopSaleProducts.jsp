<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 13/05/2022
  Time: 9:54 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setLocale value="vi_VN"/>
<div class="view-top-sale-products__container">
    <div class="view-top-sale-products__wrapper">
        <c:choose>
            <c:when test="${topSaleProducts != null && topSaleProducts.size() > 0}">
                <h5 class="view-top-sale-products__title">
                    Khuyến Mãi Hot
                </h5>
                <p class="view-top-sale-products__subtitle">Giảm giá lên đến
                    <fmt:formatNumber type="percent" maxIntegerDigits="3"
                                      value="${topSaleProducts.get(0).discount.percent}"/>
                </p>
                <div class="row row-cols-2 row-cols-sm-2 row-cols-md-2 row-cols-lg-3 row-cols-xl-6 g-0">
                    <c:forEach items="${topSaleProducts}" var="product" end="5">
                        <c:set var="product" value="${product}" scope="request"/>
                        <div class="col">
                            <c:import url="/components/web/cards/ProductCard.jsp"/>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <h5 class="view-top-sale-products__status text-center">Hiện không có sản phẩm giảm giá</h5>
            </c:otherwise>
        </c:choose>
    </div>
</div>
