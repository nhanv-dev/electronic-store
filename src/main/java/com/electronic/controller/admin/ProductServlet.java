package com.electronic.controller.admin;

import com.electronic.model.Category;
import com.electronic.model.Discount;
import com.electronic.model.Product;
import com.electronic.service.ICategoryService;
import com.electronic.service.IDiscountService;
import com.electronic.service.IProductService;
import com.electronic.service.implement.CategoryService;
import com.electronic.service.implement.DiscountService;
import com.electronic.service.implement.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/admin/product")
public class ProductServlet extends HttpServlet {
    private final IProductService productService = new ProductService();
    private final ICategoryService categoryService = new CategoryService();
    private final IDiscountService discountService = new DiscountService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        List<Product> products = productService.findAll(null, null,null);
        List<Category> categories = categoryService.findAll();
        List<Discount> discounts = discountService.findAll();

        request.setAttribute("products", products);
        request.setAttribute("categories", categories);
        request.setAttribute("discounts", discounts);

        if (action == null) {
            request.getRequestDispatcher("/view/admin/product/Table.jsp").forward(request, response);
        } else if (action.equalsIgnoreCase("add")) {
            request.getRequestDispatcher("/view/admin/product/Product.jsp").forward(request, response);
        } else if (action.equalsIgnoreCase("edit")) {
            String id = request.getParameter("id");
            request.setAttribute("product", productService.findOne(id));
            request.getRequestDispatcher("/view/admin/product/Product.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/view/admin/product/Table.jsp").forward(request, response);
        }
    }
}
