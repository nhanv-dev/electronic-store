package com.electronic.controller.web;

import com.electronic.model.User;
import com.electronic.service.IUserService;
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

@WebServlet(name = "Register", value = "/signup")
public class RegisterServlet extends HttpServlet {
    private final IUserService userService = new UserService();


    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/view/web/Register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jasonObject = ReadUtils.parseFromJSON(request);
        JsonObject json = new JsonObject();
        String username = (String) jasonObject.get("username");
        if (userService.hasUsername(username)) {
            json.addProperty("error", "existUsername");
            response.setStatus(409);
        } else {
            User user = new User();
            user.setId(RandomStringGenerator.randomString(10));
            user.setName((String) jasonObject.get("name"));
            user.setUsername(username);
            user.setPassword((String) jasonObject.get("password"));
            user.setAddress((String) jasonObject.get("address"));
            user.setPhone((String) jasonObject.get("phone"));
            user.setEmail((String) jasonObject.get("email"));
            user.setRole(RoleUtils.customer);
            userService.insert(user);
            json.addProperty("redirect", request.getContextPath() + "/login");
            response.setStatus(200);
        }
        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(json);
    }
}