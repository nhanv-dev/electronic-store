package com.electronic.controller.admin;

import com.electronic.service.IOrderService;
import com.electronic.service.IUserService;
import com.electronic.service.implement.OrderService;
import com.electronic.service.implement.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomerServlet", value = "/admin/customer")
public class CustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/admin/customer/Table.jsp").forward(request, response);
    }

}
