package com.electronic.controller.web;

import com.electronic.model.*;
import com.electronic.service.ICategoryService;
import com.electronic.service.IProductService;
import com.electronic.service.IWishListService;
import com.electronic.service.implement.CategoryService;
import com.electronic.service.implement.ProductService;
import com.electronic.service.implement.WishListService;
import com.electronic.utils.Paginable;
import com.electronic.utils.ReadUtils;
import com.electronic.utils.SessionUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "WishlistServlet", value = "/wishlist")
public class WishListServlet extends HttpServlet {
    private static final Gson GSON = new GsonBuilder().setPrettyPrinting().create();
    private final IProductService productService = new ProductService();
    private final ICategoryService categoryService = new CategoryService();
    private final IWishListService wishListService = new WishListService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Paginable pagination = new Paginable();
        pagination.setLimit(6);
        List<Product> products = productService.findAll(pagination, null,null);
        request.setAttribute("products", products);
        WishList wishList = (WishList) SessionUtils.getInstance().getValue(request, "wishList");
        if (wishList == null) {
            wishList = new WishList();
            SessionUtils.getInstance().putValue(request, "wishList", wishList);
        }
        request.getRequestDispatcher("/view/web/WishList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        String productId = (String) jsonObject.get("productId");
        Product product = productService.findOne(productId);
        WishList wishList = (WishList) SessionUtils.getInstance().getValue(request, "wishList");
        User user = (User) SessionUtils.getInstance().getValue(request, "user");
        if (wishList == null) wishList = new WishList();
        if (user != null) wishList.setUserId(user.getId());
        WishListItem item = new WishListItem();
        item.setProduct(product);
        wishList.addItem(item);
        SessionUtils.getInstance().putValue(request, "wishList", wishList);
        handleResponse(request, response);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        String id = (String) jsonObject.get("id");
        WishList wishList = (WishList) SessionUtils.getInstance().getValue(request, "wishList");
        if (id != null && !id.isEmpty() && wishList != null && wishList.getItems() != null) {
            wishList.removeItem(id);
            User user = (User) SessionUtils.getInstance().getValue(request, "user");
            if (user != null) wishListService.deleteItem(id);

            SessionUtils.getInstance().putValue(request, "wishList", wishList);
        }
        handleResponse(request, response);

    }

    private void handleResponse(HttpServletRequest request, HttpServletResponse response) throws IOException {
        WishList wishList = (WishList) SessionUtils.getInstance().getValue(request, "wishList");
        JsonObject json = new JsonObject();
        json.addProperty("wishList", GSON.toJson(wishList));
        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(json);
        response.setStatus(200);
    }
}
