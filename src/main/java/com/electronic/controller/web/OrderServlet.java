package com.electronic.controller.web;

import com.electronic.model.Order;
import com.electronic.model.User;
import com.electronic.service.IOrderService;
import com.electronic.service.implement.OrderService;
import com.electronic.utils.SessionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Order", urlPatterns = {"/account/order"})
public class OrderServlet extends HttpServlet {
    private final String WAITING_ORDER = "OS01";
    private final String SHIPPING_ORDER = "OS02";
    private final String DONE_ORDER = "OS03";
    private final IOrderService orderService = new OrderService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = (User) SessionUtils.getInstance().getValue(request, "user");
        List<Order> orders = orderService.findAll();
        List<Order> waitingOrders = orderService.findByUserAndStatus(user.getId(), WAITING_ORDER);
        List<Order> shippingOrders = orderService.findByUserAndStatus(user.getId(), SHIPPING_ORDER);
        List<Order> doneOrders = orderService.findByUserAndStatus(user.getId(), DONE_ORDER);
        request.setAttribute("orders", orders);
        request.setAttribute("waitingOrders", waitingOrders);
        request.setAttribute("shippingOrders", shippingOrders);
        request.setAttribute("doneOrders", doneOrders);
        request.getRequestDispatcher("/view/web/Order.jsp").forward(request, response);
    }

}