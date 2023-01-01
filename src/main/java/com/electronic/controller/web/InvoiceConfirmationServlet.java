package com.electronic.controller.web;

import com.electronic.model.*;
import com.electronic.service.ICartService;
import com.electronic.service.IOrderService;
import com.electronic.service.IProductService;
import com.electronic.service.implement.CartService;
import com.electronic.service.implement.OrderService;
import com.electronic.service.implement.ProductService;
import com.electronic.utils.RandomStringGenerator;
import com.electronic.utils.SessionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Confirm Payment", urlPatterns = {"/confirm-payment/*"})
public class InvoiceConfirmationServlet extends HttpServlet {
    private final IOrderService orderService = new OrderService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String slug = request.getPathInfo();
        if (slug == null || slug.substring(1).isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/");
        }
        Order order = orderService.findOne(slug.substring(1));

        request.setAttribute("order", order);
        request.getRequestDispatcher("/view/web/InvoiceConfirmation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}