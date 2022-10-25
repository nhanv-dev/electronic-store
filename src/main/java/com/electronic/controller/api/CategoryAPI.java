package com.electronic.controller.api;

import com.electronic.model.Category;
import com.electronic.service.ICategoryService;
import com.electronic.service.IProductService;
import com.electronic.service.implement.CategoryService;
import com.electronic.service.implement.ProductService;
import com.electronic.utils.RandomStringGenerator;
import com.electronic.utils.ReadUtils;
import com.electronic.utils.SlugGeneratorUtils;
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

@WebServlet(name = "CategoryAPI", value = "/api/category/*")
public class CategoryAPI extends HttpServlet {
    private static final Gson GSON = new GsonBuilder().setPrettyPrinting().create();
    private final ICategoryService categoryService = new CategoryService();
    private final IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = categoryService.findAll();
        for (Category category : categories) {
            int count = productService.countByCategoryId(category.getId(), null);
            category.setNumberOfProduct(count);
        }
        String json = GSON.toJson(categories);

        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setStatus(200);
        response.getWriter().println(json);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        String name = (String) jsonObject.get("categoryName");
        JsonObject json = new JsonObject();
        if (name != null && !name.isEmpty()) {
            if (categoryService.findByName(name) == null) {
                Category category = new Category();
                category.setId(RandomStringGenerator.randomString(10));
                category.setName(name);
                category.setSlug(SlugGeneratorUtils.toSlug(category.getName()));
                categoryService.insert(category);
                response.setStatus(201);
                json.addProperty("category", GSON.toJson(category));
            }
            response.setHeader("Content-Type", "application/json");
            response.setContentType("application/json; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().println(json);
            response.setHeader("Content-Type", "application/json");
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        JsonObject json = new JsonObject();
        Category category = new Category();
        category.setId((String) jsonObject.get("categoryId"));
        category.setName((String) jsonObject.get("categoryName"));
        category.setSlug(SlugGeneratorUtils.toSlug(category.getName()));
        categoryService.update(category);
        response.setStatus(201);
        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(json);
        response.setHeader("Content-Type", "application/json");

    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        categoryService.delete((String) jsonObject.get("id"));
        response.setStatus(201);
    }
}
