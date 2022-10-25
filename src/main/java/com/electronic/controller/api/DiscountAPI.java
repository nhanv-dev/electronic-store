package com.electronic.controller.api;

import com.electronic.model.Category;
import com.electronic.model.Discount;
import com.electronic.service.IDiscountService;
import com.electronic.service.implement.DiscountService;
import com.electronic.utils.RandomStringGenerator;
import com.electronic.utils.ReadUtils;
import com.electronic.utils.SessionUtils;
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

@WebServlet(name = "DiscountAPI", value = "/api/discount/*")
public class DiscountAPI extends HttpServlet {
    private static final Gson GSON = new GsonBuilder().setPrettyPrinting().create();
    private final IDiscountService discountService = new DiscountService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String json = GSON.toJson(discountService.findAll());

        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setStatus(200);
        response.getWriter().println(json);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        JsonObject json = new JsonObject();
        try {
            Discount discount = new Discount();
            discount.setId(RandomStringGenerator.randomString(10));
            discount.setName((String) jsonObject.get("discountName"));
            discount.setDesc((String) jsonObject.get("discountDesc"));
            discount.setPercent(Float.parseFloat((String) jsonObject.get("discountPercent")));
            discount.setActive(((String) jsonObject.get("discountStatus")).equalsIgnoreCase("active"));
            discount = discountService.insert(discount);
            response.setStatus(201);
            json.addProperty("discount", GSON.toJson(discount));
        } catch (Exception e) {
            json.addProperty("error", e.getMessage());
        }
        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(json);
        response.setStatus(200);
        response.setHeader("Content-Type", "application/json");
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        JsonObject json = new JsonObject();
        try {
            String id = (String) jsonObject.get("id");
            Discount discount = discountService.findOne(id);
            discount.setName((String) jsonObject.get("discountName"));
            discount.setDesc((String) jsonObject.get("discountDesc"));
            discount.setPercent(Float.parseFloat((String) jsonObject.get("discountPercent")));
            discount.setActive(((String) jsonObject.get("discountStatus")).equalsIgnoreCase("active"));
            discountService.update(discount);
            response.setStatus(201);
            json.addProperty("discount", GSON.toJson(discount));
        } catch (Exception e) {
            json.addProperty("error", e.getMessage());
        }
        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(json);
        response.setStatus(200);
        response.setHeader("Content-Type", "application/json");
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);

        discountService.delete((String) jsonObject.get("id"));
        response.setStatus(201);

    }
}
