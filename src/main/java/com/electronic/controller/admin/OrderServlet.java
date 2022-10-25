package com.electronic.controller.admin;

import com.electronic.model.Order;
import com.electronic.model.User;
import com.electronic.service.IOrderService;
import com.electronic.service.IUserService;
import com.electronic.service.implement.OrderService;
import com.electronic.service.implement.UserService;
import com.electronic.utils.RandomStringGenerator;
import com.electronic.utils.ReadUtils;
import com.electronic.utils.RoleUtils;
import com.google.gson.JsonObject;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "OrderServlet", value = "/admin/order")
public class OrderServlet extends HttpServlet {
    private final IOrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/view/admin/order/Table.jsp").forward(request, response);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        JsonObject json = new JsonObject();
        String id = (String) jsonObject.get("id");
        Order order = orderService.findOne(id);
        order.setStatus((String) jsonObject.get("orderStatus"));
        orderService.update(order);
        json.addProperty("success", "success");
        response.setStatus(200);
        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(json);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        String id = (String) jsonObject.get("id");
        orderService.delete(id);
    }
}
