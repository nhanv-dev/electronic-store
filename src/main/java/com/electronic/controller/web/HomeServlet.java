package com.electronic.controller.web;

import com.electronic.model.Category;
import com.electronic.model.Product;
import com.electronic.service.ICategoryService;
import com.electronic.service.IProductService;
import com.electronic.service.implement.CategoryService;
import com.electronic.service.implement.ProductService;
import com.electronic.utils.Paginable;
import com.electronic.utils.SessionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Home", urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {
    private final IProductService productService = new ProductService();
    private final ICategoryService categoryService = new CategoryService();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Category> categories = categoryService.findAll();

        Paginable pagination = new Paginable();
        pagination.setLimit(5);
        pagination.setOffset(0);
        List<Product> products = productService.findAll(pagination, null, null);

        List<List<Product>> lists = new ArrayList<>();
        int count = 0;
        for (Category category : categories) {
            if (count < 4) {
                List<Product> temp = productService.findByCategoryId(category.getId(), pagination, null, null);
                if (temp.size() > 0) {
                    lists.add(temp);
                    count++;
                }
            } else {
                break;
            }
        }

        SessionUtils.getInstance().putValue(request, "categories", categories);

        request.setAttribute("products", products);
        request.setAttribute("lists", lists);
        request.getRequestDispatcher("/view/web/Home.jsp").forward(request, response);
    }

}