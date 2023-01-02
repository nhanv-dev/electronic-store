<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 14/04/2022
  Time: 8:00 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <title>Tài khoản của tôi | Valex</title>
    <%@ include file="/common/web/style.jsp" %>
</head>
<body style="background: #f7f8f9">
<c:import url="/components/web/header/Header.jsp"/>

<section class="container mt-4 mb-5">
    <div class="breadcrumb-container bg-white">
        <a href="${pageContext.request.contextPath}/home">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/account/profile">Tài khoản của tôi</a>
    </div>
</section>
<section class="mb-5">
    <div class="container">
        <div class="d-flex gap-4 flex-wrap">
            <c:import url="/components/web/sidebar/AccountSidebar.jsp"/>
            <div class="col">
                <div class="profile">
                    <form id="profile-form">
                        <div class="mb-4 row align-items-center">
                            <label for="username" class="col-sm-2 col-form-label">Tên đăng nhập:</label>
                            <div class="col-sm-10">
                                <input type="text" readonly id="username" value="${user.username}">
                            </div>
                        </div>
                        <div class="mb-4 row align-items-center">
                            <label for="name" class="col-sm-2 col-form-label">Họ & Tên:</label>
                            <div class="col-sm-10">
                                <input type="text" id="name" name="name" value="${user.name}">
                            </div>
                        </div>
                        <div class="mb-4 row align-items-center">
                            <label for="email" class="col-sm-2 col-form-label">Email:</label>
                            <div class="col-sm-10">
                                <input type="email" id="email" name="email" value="${user.email}">
                            </div>
                        </div>
                        <div class="mb-4 row align-items-center">
                            <label for="address" class="col-sm-2 col-form-label">Địa chỉ:</label>
                            <div class="col-sm-10">
                                <input type="text" id="address" name="address" value="${user.address}">
                            </div>
                        </div>
                        <div class="mb-4 row align-items-center">
                            <label for="phone" class="col-sm-2 col-form-label">Số điện thoại:</label>
                            <div class="col-sm-10">
                                <input type="tel" id="phone" name="phone" value="${user.phone}">
                            </div>
                        </div>
                        <div class="row align-items-center">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">
                                <div class="d-flex align-items-center gap-3">
                                    <button class="button-primary" type="submit">Lưu</button>
                                    <button class="button-light" type="reset">Hủy</button>
                                    <button onclick="getKey()" class="button-primary"
                                            type="button">Tải khóa
                                    </button>
                                    <button class="button-primary" type="button" onclick="resetKey()">Reset khóa</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="/components/web/footer/Footer.jsp" %>
<c:import url="/components/web/modal/ProductModal.jsp"/>
<%@ include file="/common/web/script.jsp" %>
<script>
    function getKey() {
        axios({method: 'get', url: `${pageContext.request.contextPath}/download-key`, responseType: 'blob'})
            .then(response => {
                console.log(response)
                const href = URL.createObjectURL(response.data);

                // create "a" HTML element with href to file & click
                const link = document.createElement('a');
                link.href = href;
                link.setAttribute('download', 'key.txt'); //or any other extension
                document.body.appendChild(link);
                link.click();

                // clean up "a" element & remove ObjectURL
                document.body.removeChild(link);
                URL.revokeObjectURL(href);
            })
            .catch(err => showFailToast("Đã xảy ra lỗi"))
    }

    function resetKey() {
        axios({method: 'get', url: `${pageContext.request.contextPath}/api/reset-key`})
            .then(response => {
                console.log(response)
                showSuccessToast("Đã cài đặt lại khóa")
            })
            .catch(err => showFailToast("Đã xảy ra lỗi"))
    }

    $('#profile-form').submit(function (event) {
        event.preventDefault()
        const form = document.getElementById('profile-form');
        const formData = new FormData(form);
        let data = {};
        formData.forEach(function (value, key) {
            data[key] = value;
        });
        axios({method: 'post', url: `${pageContext.request.contextPath}/account/profile`, data: data})
            .then(response => showSuccessToast("Cập nhật thành công"))
            .catch(err => showFailToast("Đã xảy ra lỗi"))
    })
</script>
</body>
</html>