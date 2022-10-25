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
<div class="view-recently__container">
    <div class="view-recently__wrapper">
        <c:choose>
            <c:when test="${sessionScope.historyProducts != null && sessionScope.historyProducts.size() > 0}">
                <c:set var="size_history" value="${fn:length(sessionScope.historyProducts)}"/>
                <c:forEach items="${sessionScope.historyProducts}" var="historyProduct" varStatus="status">
                    <c:set var="historyProduct"
                           value="${sessionScope.historyProducts.get(size_history - status.index - 1)}"/>
                    <div class="history-card">
                        <a href="${pageContext.request.contextPath}/product/${historyProduct.slug}"
                           class="history-card__image">
                            <c:choose>
                                <c:when test="${historyProduct.images.size() > 0}">
                                    <img src="${historyProduct.images[0].url}"
                                         alt="${historyProduct.name}"/>
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/assets/images/no-image.png"
                                         alt="${historyProduct.name}"/>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${product.inventory.quantity <= 0 }">
                                    <span class="history-card__tag history-card__tag--sold-out">Hết hàng                                     </span>
                                </c:when>
                                <c:when test="${product.discount != null && product.discount.active == true}">
                                    <span class="history-card__tag history-card__tag--sale">
                                        -<fmt:formatNumber type="percent" maxIntegerDigits="3"
                                                           value="${product.discount.percent}"/>
                                    </span>
                                </c:when>
                            </c:choose>
                        </a>
                        <div class="history-card__content">
                            <a href="${pageContext.request.contextPath}/category/${historyProduct.category.slug}"
                               class="history-card__category">${historyProduct.category.name}</a>
                            <a href="${pageContext.request.contextPath}/product/${historyProduct.slug}"
                               class="history-card__name">${historyProduct.name}</a>
                            <div class="d-flex justify-content-start align-items-center gap-2">
                                <c:choose>
                                    <c:when test="${historyProduct.discount != null && historyProduct.discount.active == true}">
                                        <p class="history-card__price history-card__price--new">
                                            <fmt:formatNumber type="currency"
                                                              value="${historyProduct.price * (1 - historyProduct.discount.percent)}"/>
                                        </p>
                                        <p class="history-card__price--old">
                                            <fmt:formatNumber value="${historyProduct.price}" type="currency"/>
                                        </p>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="history-card__price">
                                            <fmt:formatNumber type="currency" value="${historyProduct.price}"/>
                                        </p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <h5 class="view-recently__status">Bạn chưa xem sản phẩm</h5>
            </c:otherwise>
        </c:choose>
    </div>
</div>