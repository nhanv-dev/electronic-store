package com.electronic.controller.api;

import com.electronic.model.Order;
import com.electronic.model.Product;
import com.electronic.service.IDiscountService;
import com.electronic.service.IOrderService;
import com.electronic.service.implement.DiscountService;
import com.electronic.service.implement.OrderService;
import com.electronic.utils.ReadUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderAPI", value = "/api/order/*")
public class OrderAPI extends HttpServlet {
    private static final Gson GSON = new GsonBuilder().setPrettyPrinting().create();
    private final IOrderService orderService = new OrderService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setStatus(200);
        response.getWriter().println(GSON.toJson(orderService.findAll()));
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
