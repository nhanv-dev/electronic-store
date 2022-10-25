package com.electronic.controller.web;

import com.electronic.model.*;
import com.electronic.service.ICartService;
import com.electronic.service.IProductService;
import com.electronic.service.implement.CartService;
import com.electronic.service.implement.ProductService;
import com.electronic.utils.Paginable;
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
import java.util.List;

@WebServlet(name = "Cart", value = "/cart")
public class CartServlet extends HttpServlet {
    private static final Gson GSON = new GsonBuilder().setPrettyPrinting().create();
    private final IProductService productService = new ProductService();
    private final ICartService cartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cart cart = (Cart) SessionUtils.getInstance().getValue(request, "cart");
        User user = (User) SessionUtils.getInstance().getValue(request, "user");

        if (cart == null) {
            cart = new Cart();
            if (user != null) cart.setUserId(user.getId());
            SessionUtils.getInstance().putValue(request, "cart", cart);
        }
        if (!cart.getItems().isEmpty()) {
            Category category = cart.getItems().get(0).getProduct().getCategory();
            Paginable pagination = new Paginable();
            pagination.setLimit(5);
            pagination.setOffset(0);
            List<Product> products = productService.findByCategoryId(category.getId(), pagination, null, null);
            request.setAttribute("products", products);
        }

        request.getRequestDispatcher("/view/web/Cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        String quantity = (String) jsonObject.get("quantity");
        Product product = productService.findOne((String) jsonObject.get("productId"));
        User user = (User) SessionUtils.getInstance().getValue(request, "user");
        if (product != null) {
            Cart cart = (Cart) SessionUtils.getInstance().getValue(request, "cart");
            if (cart == null) cart = new Cart();
            CartItem item = new CartItem(product, Integer.parseInt(quantity));
            cart.addItem(item);
            if (user != null) {
                Cart savedCart = cartService.findByUserId(user.getId());
                int index = cart.containItem(item);
                if (savedCart != null) cartService.insertItem(cart.getItems().get(index));
            }
            SessionUtils.getInstance().putValue(request, "cart", cart);
            handleSuccessResponse(request, response);
        }
    }


    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        String id = (String) jsonObject.get("id");
        String quantity = (String) jsonObject.get("quantity");
        Cart cart = (Cart) SessionUtils.getInstance().getValue(request, "cart");
        User user = (User) SessionUtils.getInstance().getValue(request, "user");
        Cart savedCart = null;
        if (user != null)
            savedCart = cartService.findByUserId(user.getId());
        if (id != null && cart != null) {
            for (CartItem item : cart.getItems()) {
                if (item.getId().equals(id)) {
                    item.setQuantity(Integer.parseInt(quantity));
                    cart.updateAmount();
                    cart.updateTotal();
                    if (savedCart != null) cartService.updateItem(item);
                    break;
                }
            }
            SessionUtils.getInstance().putValue(request, "cart", cart);
            handleSuccessResponse(request, response);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {

        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        String id = (String) jsonObject.get("id");
        String action = (String) jsonObject.get("action");
        Cart cart = (Cart) SessionUtils.getInstance().getValue(request, "cart");
        if (action != null && action.equalsIgnoreCase("clear")) {
            for (CartItem item : cart.getItems()) {
                if (SessionUtils.getInstance().getValue(request, "user") != null)
                    cartService.deleteItemById(item.getId());
                cart.removeItem(item.getId());
            }
            handleSuccessResponse(request, response);
        } else if (id != null && cart != null) {
            cart.removeItem(id);
            if (SessionUtils.getInstance().getValue(request, "user") != null) cartService.deleteItemById(id);
            handleSuccessResponse(request, response);
        }
        SessionUtils.getInstance().putValue(request, "cart", cart);
    }

    private void handleSuccessResponse(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JsonObject json = new JsonObject();
        json.addProperty("cart", GSON.toJson(SessionUtils.getInstance().getValue(request, "cart")));
        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(json);
        response.setStatus(200);
    }
}
