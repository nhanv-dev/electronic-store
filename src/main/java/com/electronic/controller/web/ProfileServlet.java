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

@WebServlet(name = "Profile", urlPatterns = {"/account/profile"})
public class ProfileServlet extends HttpServlet {
    private final IUserService userService = new UserService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/view/web/Profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        JsonObject json = new JsonObject();
        User user = (User) SessionUtils.getInstance().getValue(request, "user");
        if (user != null) {
            user.setName((String) jsonObject.get("name"));
            user.setAddress((String) jsonObject.get("address"));
            user.setPhone((String) jsonObject.get("phone"));
            user.setEmail((String) jsonObject.get("email"));
            userService.update(user);
            SessionUtils.getInstance().putValue(request, "user", user);
            response.setStatus(200);
        }else {
            json.addProperty("error", "notFoundUser");
            response.setStatus(409);
        }
        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(json);
    }
}