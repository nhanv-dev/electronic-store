package com.electronic.controller.api;

import com.electronic.model.Product;
import com.electronic.service.IUserService;
import com.electronic.service.implement.UserService;
import com.electronic.utils.ReadUtils;
import com.electronic.utils.RoleUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserAPI", value = "/api/user/*")
public class UserAPI extends HttpServlet {
    private static final Gson GSON = new GsonBuilder().setPrettyPrinting().create();

    private final IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getPathInfo().substring(1);
        String json = null;
        if (!id.isEmpty()) {
            json = GSON.toJson(userService.findOne(id));
        } else {
            String role = request.getParameter("role");
            if (role != null) {
                if (role.equalsIgnoreCase("admin")) {
                    json = GSON.toJson(userService.findByRole(RoleUtils.admin.getId()));
                } else if (role.equalsIgnoreCase("customer")) {
                    json = GSON.toJson(userService.findByRole(RoleUtils.customer.getId()));
                }
            } else {
                json = GSON.toJson(userService.findAll(null));
            }
        }
        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setStatus(200);
        response.getWriter().println(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String json = ReadUtils.readInputStream(request.getInputStream());

        Product product = GSON.fromJson(json, Product.class);

        response.setStatus(201);
        response.setHeader("Content-Type", "application/json");
        response.getWriter().println(GSON.toJson(product));
    }
}
