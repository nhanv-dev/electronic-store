<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 21/04/2022
  Time: 9:48 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<!doctype html>
<html lang="en">
<head>
    <title>Xác nhận thanh toán | Valex</title>
    <%@ include file="/common/web/style.jsp" %>
</head>
<body>
<c:import url="/components/web/header/Header.jsp"/>
<section class="container mt-4 mb-5">
    <div class="breadcrumb-container">
        <a href="${pageContext.request.contextPath}">Trang chủ</a>
        <a href="${pageContext.request.contextPath}/account/order">Đơn đặt hàng</a>
        <a href="">Xác nhận đơn đặt hàng</a>
    </div>
</section>

<div class="mb-5" id="payment-page">
    <div class="container">
        <div class="mx-auto card-container" style="width: 600px">
            <div class="card-container__header">
                <h3>Xác nhận đơn đặt hàng</h3>
            </div>
            <div class="card-container__content">
                <div class="payment-list">
                    <c:forEach var="item" items="${order.items}">
                        <input type="hidden" name="id[]" value="${item.product.id}">
                        <div class="payment-list__item">
                            <div class="payment-list__item__content w-100 d-flex gap-3 align-items-center justify-content-between">
                                <a href="${pageContext.request.contextPath}/product/${item.product.slug}"
                                   class="payment-list__item__name d-block" style="width: 300px">
                                        ${item.product.name}
                                </a>
                                <p class="payment-list__item__quantity">
                                    Số lượng: ${item.quantity}
                                </p>
                                <p class="payment-list__item__total" style="width: 100px; text-align: end">
                                    <fmt:formatNumber type="currency"
                                                      value="${item.product.price * (1 - item.product.discount.percent)}"/>
                                </p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="payment-resume">
                    <div class="payment-resume__left">Tổng tiền:</div>
                    <div class="payment-resume__right">
                        <fmt:formatNumber value="${order.total}" type="currency"/>
                    </div>
                </div>
                <div class="payment-resume">
                    <div class="payment-resume__left">Phí vận chuyển:</div>
                    <div class="payment-resume__right">
                        <fmt:formatNumber value="0" type="currency"/>
                    </div>
                </div>
                <div class="payment-resume">
                    <div class="payment-resume__left">Cần thanh toán:</div>
                    <div class="payment-resume__right" style="color: #d70000;font-size: 18px">
                        <fmt:formatNumber value="${order.total}" type="currency"/>
                    </div>
                </div>
                <div class="d-flex items-center mt-3 gap-3">
                    <button type="button" onclick="downloadPDF()" class="primary-button flex-1">
                        Tải đơn hàng
                    </button>
                    <form id="form-pdf" class="flex justify-items-center align-items-center gap-3" method="post"
                          enctype="multipart/form-data"
                          action="${pageContext.request.contextPath}/confirm-payment/${order.id}">
                        <input type="file" name="file" id="pdf-file"/>
                        <input type="hidden" value="${order.id}" name="id" id=id"/>
                        <button type="submit" class="primary-button flex-1">Xác thực đơn hàng</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="/components/web/footer/Footer.jsp" %>
<%@ include file="/common/web/script.jsp" %>
<script>
    <c:if test="${success==false}">
        showFailToast("Bạn vừa xác thực thất bại")
    </c:if>
    function downloadPDF() {
        axios({
            method: 'get',
            url: `${pageContext.request.contextPath}/download-invoice/${order.id}`,
            responseType: 'blob'
        }).then(response => {
            console.log(response)
            const href = URL.createObjectURL(response.data);

            // create "a" HTML element with href to file & click
            const link = document.createElement('a');
            link.href = href;
            let filename = "hoa-don.pdf";
            link.setAttribute('download', filename); //or any other extension
            document.body.appendChild(link);
            link.click();

            // clean up "a" element & remove ObjectURL
            document.body.removeChild(link);
            URL.revokeObjectURL(href);
        }).catch(err => showFailToast("Đã xảy ra lỗi"))
    }
</script>
</body>
</html>