<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 21/04/2022
  Time: 9:48 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <title>Đăng nhập | Valex</title>
    <%@ include file="/common/web/style.jsp" %>
</head>
<body>
<c:import url="/components/web/header/Header.jsp"/>
<section class="container mt-4 mb-5">
    <div class="breadcrumb-container">
        <a href="${pageContext.request.contextPath}">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/account">Tài khoản</a>
        <a href="${pageContext.request.contextPath}/account/change-password">Đổi mật khẩu</a>
    </div>
</section>
<section class="mb-5">
    <div class="container">
        <div id="login-form-container">
            <div class="form-wrapper">
                <p class="form-title">Đổi mật khẩu</p>
                <form id="change-password-form">
                    <div class="form-field">
                        <label for="password">Mật khẩu cũ</label>
                        <input type="password" name="password" id="password"/>
                    </div>
                    <div class="form-field">
                        <div class="d-flex align-center justify-content-between ">
                            <label for="newPassword">Mật khẩu mới</label>
                        </div>
                        <input type="password" name="newPassword" id="newPassword"/>
                    </div>
                    <div class="form-field">
                        <div class="d-flex align-center justify-content-between ">
                            <label for="repeatPassword">Nhập lại mật khẩu</label>
                        </div>
                        <input type="password" name="repeatPassword" id="repeatPassword"/>
                    </div>
                    <div class="form-field mb-0">
                        <input type="submit" name="submit" value="Đổi mật khẩu">
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<%@include file="/components/web/footer/Footer.jsp" %>
<c:import url="/components/web/modal/ProductModal.jsp"/>
<%@ include file="/common/web/script.jsp" %>
<script>
    const form = document.getElementById('change-password-form');
    form.addEventListener('submit', function (event) {
        event.preventDefault()
        const formData = new FormData(form);
        let data = {};
        formData.forEach((value, key) => data[key] = value)
        axios({method: "post", url: `${pageContext.request.contextPath}/account/change-password`, data: data})
            .then((response) => handleSuccessLogin(response))
            .catch((error) => console.log(error));
    })

    function handleSuccessLogin(response) {
        if (response.status === 200) window.location.href = response.data.redirect
    }
</script>

</body>
</html>