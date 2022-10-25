package com.electronic.controller.web;

import com.electronic.model.*;
import com.electronic.service.ICartService;
import com.electronic.service.IOrderService;
import com.electronic.service.IProductService;
import com.electronic.service.IUserService;
import com.electronic.service.implement.CartService;
import com.electronic.service.implement.OrderService;
import com.electronic.service.implement.ProductService;
import com.electronic.service.implement.UserService;
import com.electronic.utils.RandomStringGenerator;
import com.electronic.utils.SessionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Payment", urlPatterns = {"/payment"})
public class PaymentServlet extends HttpServlet {
    private final IOrderService orderService = new OrderService();
    private final ICartService cartService = new CartService();
    private final IProductService productService = new ProductService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Cart cart = (Cart) SessionUtils.getInstance().getValue(request, "cart");
        Order order = generateOrder(request);
        if (cart != null && cart.getItems().size() > 0 && request.getAttribute("outOfStock") == null) {
            request.setAttribute("order", order);
            request.getRequestDispatcher("/view/web/Payment.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/cart");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) SessionUtils.getInstance().getValue(request, "user");
        String[] ids = request.getParameterValues("id[]");
        if (user != null && ids != null) {
            Cart cart = (Cart) SessionUtils.getInstance().getValue(request, "cart");
            cartService.delete(cart.getId());
            Order order = new Order();
            order.setId(RandomStringGenerator.randomString(10));
            order.setUserId(user.getId());
            order.setStatus("OS01");
            double total = 0;
            for (String id : ids) {
                for (CartItem item : cart.getItems()) {
                    if (item.getQuantity() <= item.getProduct().getInventory().getQuantity() && item.getProduct().getId().equals(id)) {
                        OrderItem orderItem = new OrderItem();
                        orderItem.setId(RandomStringGenerator.randomString(10));
                        orderItem.setOrderId(order.getId());
                        orderItem.setQuantity(item.getQuantity());
                        orderItem.setProduct(item.getProduct());
                        order.addItem(orderItem);
                        total += item.getTotal();
                        Product product = item.getProduct();
                        product.getInventory().setQuantity(product.getInventory().getQuantity() - item.getQuantity());
                        productService.update(product);
                    }
                }
            }
            order.setTotal(total);
            orderService.insert(order);
            cart = new Cart();
            cart.setUserId(user.getId());
            SessionUtils.getInstance().putValue(request, "cart", cart);
        }
        response.sendRedirect(request.getContextPath() + "/account/order");
    }

    private Order generateOrder(HttpServletRequest request) {
        Cart cart = (Cart) SessionUtils.getInstance().getValue(request, "cart");
        User user = (User) SessionUtils.getInstance().getValue(request, "user");
        Order order = new Order();
        order.setId(RandomStringGenerator.randomString(10));
        order.setUserId(user.getId());
        for (CartItem item : cart.getItems()) {
            if (item.getQuantity() <= item.getProduct().getInventory().getQuantity()) {
                OrderItem orderItem = new OrderItem();
                orderItem.setId(RandomStringGenerator.randomString(10));
                orderItem.setOrderId(order.getId());
                orderItem.setQuantity(item.getQuantity());
                orderItem.setProduct(item.getProduct());
                order.addItem(orderItem);
            } else {
                request.setAttribute("outOfStock", true);
                break;
            }
        }
        order.setStatus("OS01");
        order.setTotal(cart.getTotal());
        return order;
    }
}