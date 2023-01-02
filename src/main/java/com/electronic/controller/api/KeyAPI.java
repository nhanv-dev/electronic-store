package com.electronic.controller.api;

import com.electronic.model.Discount;
import com.electronic.model.User;
import com.electronic.service.IDiscountService;
import com.electronic.service.IUserService;
import com.electronic.service.implement.DiscountService;
import com.electronic.service.implement.UserService;
import com.electronic.utils.RandomStringGenerator;
import com.electronic.utils.ReadUtils;
import com.electronic.utils.SessionUtils;
import com.electronic.utils.digital_signature.KeyPairUtils;
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
import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.PublicKey;

@WebServlet(name = "KeyAPI", value = "/api/reset-key")
public class KeyAPI extends HttpServlet {
    private final IUserService userService = new UserService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        User user = (User) SessionUtils.getInstance().getValue(request, "user");
        KeyPair keyPair = new KeyPairUtils().getKeyPair();
        userService.updateKey(keyPair.getPublic(), keyPair.getPrivate(), user.getId());
        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setStatus(200);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
