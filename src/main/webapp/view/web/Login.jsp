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
        <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
    </div>
</section>
<section class="mb-5">
    <div class="container">
        <div id="login-form-container">
            <div class="form-wrapper">
                <p class="form-title">Đăng nhập</p>
                <form id="login-form">
                    <div class="form-field">
                        <label for="username">Tài khoản</label>
                        <input type="text" name="username" id="username"/>
                        <div class="invalid-message">Tài khoản không tồn tại.</div>
                    </div>
                    <div class="form-field">
                        <div class="d-flex align-center justify-content-between ">
                            <label for="password">Mật khẩu</label>
                        </div>
                        <input type="password" name="password" id="password"/>
                        <div class="invalid-message">Mật khẩu sai. Vui lòng kiểm tra lại mật khẩu</div>
                    </div>
                    <div class="form-field">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="field-checkbox">
                                <label for="checkbox">
                                    <input type="checkbox" name="checkbox" id="checkbox">
                                    Lưu mật khẩu
                                </label>
                            </div>
                            <a href="${pageContext.request.contextPath}/account/reset-password">Quên mật khẩu?</a>
                        </div>
                    </div>
                    <div class="form-field mb-0">
                        <input type="submit" name="submit" value="Đăng nhập" style="height: 40px">
                    </div>
                </form>
                <p class="mt-3 text-center">
                    Chưa có tài khoản ?
                    <a href="${pageContext.request.contextPath}/signup">
                        Đăng ký ngay
                    </a>
                </p>
            </div>
        </div>
    </div>
</section>

<%@include file="/components/web/footer/Footer.jsp" %>
<c:import url="/components/web/modal/ProductModal.jsp"/>
<%@ include file="/common/web/script.jsp" %>
<script>
    const form = document.getElementById('login-form');
    const usernameInput = $('#login-form input#username')
    const passwordInput = $('#login-form input#password')
    usernameInput.change(function () {
        usernameInput.removeClass('is-invalid')
    })
    passwordInput.change(function () {
        usernameInput.removeClass('is-invalid')
    })
    form.addEventListener('submit', function (event) {
        event.preventDefault()
        const formData = new FormData(form);
        let data = {};
        formData.forEach((value, key) => data[key] = value)
        axios({method: "post", url: `${pageContext.request.contextPath}/login`, data: data})
            .then((response) => handleSuccessLogin(response))
            .catch((error) => console.log(error));
    })

    function handleSuccessLogin(response) {
        if (response.data.invalidUsername) usernameInput.addClass('is-invalid')
        if (response.data.invalidPassword) passwordInput.addClass('is-invalid')
        if (response.status === 200 && response.data.redirect)
            window.location.href = response.data.redirect
    }
</script>
</body>
</html>