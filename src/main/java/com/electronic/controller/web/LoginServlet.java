package com.electronic.controller.web;

import com.electronic.model.User;
import com.electronic.service.IUserService;
import com.electronic.service.implement.UserService;
import com.electronic.utils.AccountUtils;
import com.electronic.utils.ReadUtils;
import com.electronic.utils.SessionUtils;
import com.google.gson.JsonObject;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Login", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    private final IUserService userService = new UserService();


    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = (User) SessionUtils.getInstance().getValue(request, "user");
        String action = request.getParameter("action");
        if (action != null && action.equalsIgnoreCase("logout")) {
            AccountUtils.handleSuccessLogout(request);
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }
        if (user != null) response.sendRedirect(request.getContextPath() + "/home");
        else request.getRequestDispatcher("/view/web/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        JsonObject json = new JsonObject();
        String username = (String) jsonObject.get("username");
        String password = (String) jsonObject.get("password");
        User user = userService.authentication(username, new User().MD5(password));
        if (user != null) {
            SessionUtils.getInstance().putValue(request, "user", user);
            AccountUtils.handleSuccessLogin(request);
            json.addProperty("redirect", request.getContextPath() + "/home");
            response.setStatus(200);
        } else {
            if (userService.hasUsername(username)) json.addProperty("invalidPassword", "Mật khẩu sai");
            else json.addProperty("invalidUsername", "Tài khoản không tồn tại");
        }
        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(json);
    }
}