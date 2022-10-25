<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 16/05/2022
  Time: 7:30 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN"/>
<div class="products-section">
  <div class="container">
    <div class="products-section__header">
      <h5 class="products-section__title">${title}</h5>
      <a href="${pageContext.request.contextPath}/${slug}"
         class="products-section__link">
        <span>Xem tất cả</span>
        <i class="fa-solid fa-angle-right"></i>
      </a>
    </div>
    <div class="row row-cols-2 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 g-4">
      <c:forEach var="product" items="${items}">
        <c:set var="product" value="${product}" scope="request"/>
        <div class="col">
          <c:import url="/components/web/cards/ProductCard.jsp"/>
        </div>
      </c:forEach>
    </div>
  </div>
</div>
