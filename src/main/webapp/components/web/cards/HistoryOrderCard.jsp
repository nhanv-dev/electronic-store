<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 17/05/2022
  Time: 2:54 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="vi_VN"/>

<div class="history-order-card bg-white">
    <div class="history-order-card__header">
        <div class="d-flex align-items-center gap-4">
            <span>Trạng thái: ${order.status}</span>
        </div>
        <p>
            Ngày: <fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${order.createdAt}"/>
        </p>
    </div>
    <c:choose>
        <c:when test="${order.items.size() > 0}">
            <div class="history-order-card__content">
                <ul>
                    <c:forEach var="item" items="${order.items}">
                        <li>
                            <div class="history-order-card__item">
                                <div class="d-flex gap-3 align-items-start col">
                                    <a href="${pageContext.request.contextPath}/product/${item.product.slug}"
                                       class="history-order-card__item__image">
                                        <c:choose>
                                            <c:when test="${item.product.images.size() > 0}">
                                                <img src="${item.product.images.get(0).url}" alt="item"/>
                                            </c:when>
                                            <c:otherwise>
                                                <img src="<c:url value="/assets/images/no-image.png"/>" alt="item"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </a>
                                    <div class="history-order-card__item__content">
                                        <a href="${pageContext.request.contextPath}/product/${item.product.slug}"
                                           class="history-order-card__item__name">
                                                ${item.product.name}
                                        </a>
                                        <a href="${pageContext.request.contextPath}/category/${item.product.category.name}"
                                           class="history-order-card__item__category">${item.product.category.name}</a>
                                        <div class="d-flex flex-wrap align-items-center justify-content-start gap-2">
                                            <c:if test="${item.product.inventory.quantity > 0}">
                                                <p class="history-order-card__item__message history-order-card__item__message--green">
                                                    Còn hàng
                                                </p>
                                            </c:if>
                                            <c:if test="${item.product.inventory.quantity <= 0}">
                                                <p class="history-order-card__item__message history-order-card__item__message--red">
                                                    Hết hàng
                                                </p>
                                            </c:if>
                                            <c:if test="${item.product.discount != null && item.product.discount.active == true}">
                                                <p class="history-order-card__item__message history-order-card__item__message--green">
                                                    Đang giảm giá
                                                </p>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="history-order-card__item__quantity">Số lượng: ${item.quantity}</div>
                                <div>
                                    <p class="history-order-card__item__total">
                                        <fmt:formatNumber value="${item.total}" type="currency"/>
                                    </p>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:when>
        <c:otherwise>
            <p class="order-not-found">Không tìm thấy dữ liệu</p>
        </c:otherwise>
    </c:choose>
    <div class="history-order-card__footer">
        <div style="font-size: 14px; font-weight: 500; color: #5E6278;">Mã hóa đơn: ${order.id}</div>
        <div class="d-flex gap-3 align-items-center">
            <span>Tổng tiền:</span>
            <span><fmt:formatNumber value="${order.total}" type="currency"/></span>
        </div>
    </div>
</div>