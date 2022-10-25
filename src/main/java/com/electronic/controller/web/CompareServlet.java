package com.electronic.controller.web;

import com.electronic.model.Product;
import com.electronic.service.IProductService;
import com.electronic.service.implement.ProductService;
import com.electronic.utils.ReadUtils;
import com.electronic.utils.SessionUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "Compare", value = "/compare")
public class CompareServlet extends HttpServlet {
    private static final Gson GSON = new GsonBuilder().setPrettyPrinting().create();
    private final IProductService productService = new ProductService();
    private final String key = "compareProducts";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/web/Compare.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        String productId = (String) jsonObject.get("productId");
        List<Product> products = (List<Product>) SessionUtils.getInstance().getValue(request, key);
        if (products == null) products = new ArrayList<>();
        if (productId != null) {
            Product product = productService.findOne(productId);
            if (product != null && !isContain(products, product)) products.add(product);
        }
        SessionUtils.getInstance().putValue(request, key, products);
        response.setStatus(200);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        JsonObject json = new JsonObject();
        String productId = (String) jsonObject.get("productId");
        List<Product> products = (List<Product>) SessionUtils.getInstance().getValue(request, key);
        if (products == null) products = new ArrayList<>();
        if (productId != null) {
            for (Product product : products) {
                if (product.getId().equals(productId)) {
                    products.remove(product);
                    break;
                }
            }
        }
        SessionUtils.getInstance().putValue(request, key, products);
        json.addProperty("products", GSON.toJson(products));
        response.setStatus(200);
        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(json);
    }

    private boolean isContain(List<Product> list, Product item) {
        for (Product product : list)
            if (product.getId().equals(item.getId())) return true;
        return false;
    }
}
