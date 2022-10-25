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
    <title>Đăng kí | Valex</title>
    <%@ include file="/common/web/style.jsp" %>
</head>
<body>
<c:import url="/components/web/header/Header.jsp"/>
<section class="container mt-4 mb-5">
    <div class="breadcrumb-container">
        <a href="${pageContext.request.contextPath}">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/login">Đăng ký</a>
    </div>
</section>
<section class="mb-5">
    <div class="container">
        <div id="register-form-container">
            <div class="form-wrapper">
                <p class="form-title">Đăng ký</p>
                <form id="register-form">
                    <div class="form-field">
                        <div class="d-flex align-center justify-content-between ">
                            <label for="name">Họ & tên</label>
                        </div>
                        <input type="text" name="name" id="name"/>
                    </div>
                    <div class="row g-3">
                        <div class="col-6">
                            <div class="form-field">
                                <div class="d-flex align-center justify-content-between ">
                                    <label for="email">Email</label>
                                </div>
                                <input type="email" name="email" id="email"/>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-field">
                                <div class="d-flex align-center justify-content-between ">
                                    <label for="phone">Số điện thoại</label>
                                </div>
                                <input type="text" name="phone" id="phone"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-field">
                        <label for="address">Địa chỉ</label>
                        <input type="text" name="address" id="address"/>
                    </div>
                    <div class="form-field">
                        <label for="username">Tài khoản</label>
                        <input type="text" name="username" id="username"/>
                    </div>
                    <div class="form-field">
                        <div class="d-flex align-center justify-content-between ">
                            <label for="password">Mật khẩu</label>
                        </div>
                        <input type="password" name="password" id="password"/>
                    </div>
                    <div class="form-field mb-0 mt-3">
                        <input type="submit" name="submit" value="Đăng ký" style="height: 40px">
                    </div>
                </form>
                <p class="mt-3 text-center">
                    Đã có tài khoản ?
                    <a href="${pageContext.request.contextPath}/login">
                        Đăng nhập
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
    const form = document.getElementById('register-form')
    form.addEventListener('submit', function (event) {
        event.preventDefault()
        const formData = new FormData(form);
        let data = {};
        formData.forEach((value, key) => data[key] = value)
        axios({method: "post", url: "${pageContext.request.contextPath}/signup", data: data,})
            .then(function (response) {
                if (response.status === 200) window.location.href = response.data.redirect
            })
            .catch(function (response) {
                console.log(response);
            });
    })
</script>
</body>
</html>