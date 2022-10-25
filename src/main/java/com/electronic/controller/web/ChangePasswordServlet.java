package com.electronic.controller.web;

import com.electronic.model.User;
import com.electronic.service.IUserService;
import com.electronic.service.implement.UserService;
import com.electronic.utils.ReadUtils;
import com.electronic.utils.SessionUtils;
import com.google.gson.JsonObject;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ChangePassword", urlPatterns = {"/account/change-password"})
public class ChangePasswordServlet extends HttpServlet {
    private final IUserService userService = new UserService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = (User) SessionUtils.getInstance().getValue(request, "user");
        if (user == null) response.sendRedirect(request.getContextPath() + "/login");
        else request.getRequestDispatcher("/view/web/ChangePassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        JsonObject json = new JsonObject();
        User user = (User) SessionUtils.getInstance().getValue(request, "user");
        if (user != null) {
            boolean check = true;
            String password = (String) jsonObject.get("password");
            String newPassword = (String) jsonObject.get("newPassword");
            String repeatPassword = (String) jsonObject.get("repeatPassword");
            check = repeatPassword.equals(newPassword);
            if (!check) json.addProperty("incorrectRepeatPassword", "Nhập lại mật khẩu không chính xác");

            if (check) {
                user.setPassword(newPassword);
                userService.update(user);
                json.addProperty("redirect", request.getContextPath() + "/account/profile");
                response.setStatus(200);
            }
            SessionUtils.getInstance().putValue(request, "user", user);
            response.setStatus(200);
        }
        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(json);
    }
}