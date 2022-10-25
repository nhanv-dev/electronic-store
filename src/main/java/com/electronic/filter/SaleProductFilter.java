package com.electronic.filter;

import com.electronic.model.Product;
import com.electronic.service.ICategoryService;
import com.electronic.service.IProductService;
import com.electronic.service.implement.CategoryService;
import com.electronic.service.implement.ProductService;
import com.electronic.utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.List;

@WebFilter("/*")
public class SaleProductFilter implements Filter {
    private final IProductService productService = new ProductService();
    private final ICategoryService categoryService = new CategoryService();

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        List<Product> products = productService.findByTopSale(9, null, null);
        request.setAttribute("topSaleProducts", products);
        SessionUtils.getInstance().putValue(request, "categories", categoryService.findAll());
        chain.doFilter(request, response);
    }

}
