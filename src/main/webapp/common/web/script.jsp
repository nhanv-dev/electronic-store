<%--
  Created by IntelliJ IDEA.
  User: nhanv
  Date: 14/04/2022
  Time: 8:19 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="<c:url value ="/assets/library/simple-notify-master/dist/simple-notify.min.js"/>"></script>
<script>
    const contextPath = '${pageContext.request.contextPath}'
</script>

<script type="text/javascript" src='<c:url value ="/assets/web/js/components.js"/>'></script>
<script type="text/javascript" src='<c:url value ="/assets/web/js/notify.js"/>'></script>
<script type="text/javascript" src='<c:url value ="/assets/web/js/events/cart-event.js"/>'></script>
<script type="text/javascript" src='<c:url value ="/assets/web/js/events/compare-event.js"/>'></script>
<script type="text/javascript" src='<c:url value ="/assets/web/js/events/quick-view-event.js"/>'></script>
<script type="text/javascript" src='<c:url value ="/assets/web/js/events/wishlist-event.js"/>'></script>
<script type="text/javascript" src='<c:url value ="/assets/web/js/index.js"/>'></script>
