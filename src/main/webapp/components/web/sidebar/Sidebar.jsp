<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 19/04/2022
  Time: 8:10 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form method="get" class="category-sidebar">
    <div class="category-sidebar__container">
        <h5 class="category-sidebar__title">Mức Giá</h5>
        <div class="category-sidebar__content">
            <div class="form-check d-flex align-items-start gap-2 mb-2">
                <input class="form-check-input" type="radio"
                       onchange="this.form.submit()" ${param.price == 'duoi-10-trieu' ? 'checked' : ''} name="price"
                       value="duoi-10-trieu" id="price-1">
                <label class="form-check-label  category-sidebar__content__link" for="price-1">
                    Dưới 10 triệu
                </label>
            </div>
            <div class="form-check d-flex align-items-start gap-2 mb-2">
                <%
                    if (request.getParameter("searching") != null)
                        out.println("<input type='hidden' name='searching' value='" + request.getParameter("searching") + "'>");
                    if (request.getParameter("show") != null)
                        out.println("<input type='hidden' name='show' value='" + request.getParameter("show") + "'>");
                    if (request.getParameter("sort") != null)
                        out.println("<input type='hidden' name='sort' value='" + request.getParameter("sort") + "'>");
                %>
                <input class="form-check-input" type="radio"
                       onchange="this.form.submit()" ${param.price == 'tu-10-15-trieu' ? 'checked' : ''} name="price"
                       value="tu-10-15-trieu" id="price-2">
                <label class="form-check-label  category-sidebar__content__link" for="price-2">
                    Từ 10 - 15 triệu
                </label>
            </div>
            <div class="form-check d-flex align-items-start gap-2 mb-2">
                <input class="form-check-input" type="radio"
                       onchange="this.form.submit()"  ${param.price == 'tu-15-20-trieu' ? 'checked' : ''} name="price"
                       value="tu-15-20-trieu" id="price-3">
                <label class="form-check-label  category-sidebar__content__link" for="price-3">
                    Từ 15 - 20 triệu
                </label>
            </div>
            <div class="form-check d-flex align-items-start gap-2 mb-2">
                <input class="form-check-input" type="radio"
                       onchange="this.form.submit()" ${param.price == 'tu-20-25-trieu' ? 'checked' : ''} name="price"
                       value="tu-20-25-trieu" id="price-4">
                <label class="form-check-label  category-sidebar__content__link" for="price-4">
                    Từ 20 - 25 triệu
                </label>
            </div>
            <div class="form-check d-flex align-items-start gap-2 mb-2">
                <input class="form-check-input" type="radio" onchange="this.form.submit()" name="price"
                ${param.price == 'tren-25-trieu' ? 'checked' : ''} value="tren-25-trieu" id="price-5">
                <label class="form-check-label  category-sidebar__content__link" for="price-5">
                    Trên 25 triệu
                </label>
            </div>
        </div>
    </div>
    <div class="category-sidebar__container">
        <h5 class="category-sidebar__title">Trạng thái</h5>
        <div class="category-sidebar__content">
            <div class="form-check d-flex align-items-start gap-2 mb-2">
                <input class="form-check-input" onchange="this.form.submit()"
                       type="checkbox" ${param.status == 'con-hang' ? 'checked' : ''} name="status" value="con-hang"
                       id="status-1">
                <label class="form-check-label  category-sidebar__content__link" for="status-1">
                    Còn hàng
                </label>
            </div>
            <div class="form-check d-flex align-items-start gap-2 mb-2">
                <input class="form-check-input" onchange="this.form.submit()"
                       type="checkbox" ${param.discount == 'giam-gia' ? 'checked' : ''} name="discount" value="giam-gia"
                       id="status-2">
                <label class="form-check-label  category-sidebar__content__link" for="status-2">
                    Giảm giá
                </label>
            </div>
        </div>
    </div>
</form>
