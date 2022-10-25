package com.electronic.controller.admin;

import com.electronic.model.Product;
import com.electronic.model.User;
import com.electronic.service.IProductService;
import com.electronic.service.IUserService;
import com.electronic.service.implement.ProductService;
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
import java.util.List;

@WebServlet(name = "StaffServlet", value = "/admin/staff")
public class StaffServlet extends HttpServlet {
    private final IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/admin/staff/Table.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        JsonObject json = new JsonObject();
        String id = (String) jsonObject.get("id");
        User user = userService.findOne(id);
        if (user == null) {
            user = new User();
            user.setId(RandomStringGenerator.randomString(10));
            user.setName((String) jsonObject.get("name"));
            user.setUsername((String) jsonObject.get("username"));
            user.setAddress((String) jsonObject.get("address"));
            user.setPassword((String) jsonObject.get("phone"));
            user.setPhone((String) jsonObject.get("phone"));
            user.setEmail((String) jsonObject.get("email"));
            user.setRole(RoleUtils.admin);
            userService.insert(user);
            json.addProperty("success", "success");
            response.setStatus(200);
        } else {
            json.addProperty("error", "user valid");
        }
        request.setCharacterEncoding("UTF-8");
        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        response.getWriter().println(json);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        String id = (String) jsonObject.get("id");
        String action = (String) jsonObject.get("action");
        User user = userService.findOne(id);
        if (user != null) {
            if (action != null && action.equalsIgnoreCase("resetPassword")) {
                user.setPassword(user.getPhone());
                userService.update(user);
            } else {
                String name = (String) jsonObject.get("name");
                String address = (String) jsonObject.get("address");
                String phone = (String) jsonObject.get("phone");
                String email = (String) jsonObject.get("email");
                user.setName(name);
                user.setAddress(address);
                user.setPhone(phone);
                user.setEmail(email);
                userService.update(user);
            }
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        String id = (String) jsonObject.get("id");
        if (id != null) {
            userService.delete(id);
        }
    }
}
