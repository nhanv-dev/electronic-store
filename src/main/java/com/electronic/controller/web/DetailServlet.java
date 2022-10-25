package com.electronic.controller.web;

import com.electronic.model.Product;
import com.electronic.service.IProductService;
import com.electronic.service.implement.ProductService;
import com.electronic.utils.Paginable;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailServlet", value = "/product/*")
public class DetailServlet extends HttpServlet {
    private final IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String slug = request.getPathInfo();
        Product product = null;
        List<Product> products = null;
        if (slug == null || slug.substring(1).isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/");
        } else {
            product = productService.findBySlug(slug.substring(1));
            if (product != null) {
                Paginable paginable = new Paginable();
                paginable.setOffset(0);
                paginable.setLimit(5);
                products = productService.findByCategoryId(product.getCategory().getId(), paginable, null,null);
            }
            request.setAttribute("product", product);
            request.setAttribute("products", products);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
