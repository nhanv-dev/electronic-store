package com.electronic.controller.web;

import com.electronic.model.Category;
import com.electronic.model.Product;
import com.electronic.utils.ProductFilter;
import com.electronic.service.ICategoryService;
import com.electronic.service.IProductService;
import com.electronic.service.implement.CategoryService;
import com.electronic.service.implement.ProductService;
import com.electronic.utils.Paginable;
import com.electronic.utils.Sortable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryServlet", value = "/category/*")
public class CategoryServlet extends HttpServlet {
    private final IProductService productService = new ProductService();
    private final ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        List<Product> products = null;
        Category category = null;
        ProductFilter productFilter = new ProductFilter();
        productFilter.setPrice(request.getParameter("price"));
        productFilter.setStatus(request.getParameter("status")); 
        productFilter.setDiscount(request.getParameter("discount"));
        request.setAttribute("productFilter", productFilter);
        Paginable paginable = setPaginable(request);
        Sortable sortable = new Sortable();
        sortable.setSortBy(request.getParameter("sort"));
        if (pathInfo == null) {
            products = productService.findAll(paginable, productFilter, sortable);
        } else {
            String slug = pathInfo.substring(1);
            if (slug.isEmpty()) {
                products = productService.findAll(paginable, productFilter, sortable);
            } else {
                category = categoryService.findBySlug(slug);
                if (category != null) {
                    products = productService.findByCategoryId(category.getId(), paginable, productFilter, sortable);
                    request.setAttribute("category", category);
                }
            }
        }
        request.setAttribute("category", category);
        request.setAttribute("products", products);
        request.getRequestDispatcher("/view/web/Category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private Paginable setPaginable(HttpServletRequest request) {
        String pathInfo = request.getPathInfo();
        String page = request.getParameter("page");
        String amount = request.getParameter("show");
        ProductFilter productFilter = (ProductFilter) request.getAttribute("productFilter");
        int total = productService.count(productFilter);
        if (page == null) page = "1";
        if (amount == null) amount = "16";
        if (pathInfo != null) {
            Category category = categoryService.findBySlug(pathInfo.substring(1));
            if (category != null) total = productService.countByCategoryId(category.getId(), productFilter);
        }
        Paginable paginable = new Paginable(Integer.parseInt(amount), total, Integer.parseInt(page));
        request.setAttribute("paginable", paginable);
        return paginable;
    }
}
