<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/16/2022
  Time: 6:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN"/>
<a href="${pageContext.request.contextPath}/wishlist" class="header-center__options__button">
    <span class="header-center__options__button__icon">
       <i class="fa-regular fa-heart"></i>
        <span class="header-center__options__button__quantity" id="header-amount-wishlist">
            ${wishList != null &&  wishList.items.size() > 0 ? wishList.items.size() : 0}
        </span>
    </span>
</a>

