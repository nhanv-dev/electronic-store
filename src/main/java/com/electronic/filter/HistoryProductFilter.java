package com.electronic.filter;

import com.electronic.model.Product;
import com.electronic.utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.Stack;

@WebFilter("/product/*")
public class HistoryProductFilter implements Filter {

    @SuppressWarnings("unchecked")
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        chain.doFilter(request, response);
        Product product = (Product) request.getAttribute("product");
        if (product != null) {
            Stack<Product> historyProducts = (Stack<Product>) SessionUtils.getInstance().getValue(request, "historyProducts");

            if (historyProducts == null)
                historyProducts = new Stack<>();


            for (Product _product : historyProducts)
                if (_product.getId().equals(product.getId())) {
                    historyProducts.remove(_product);
                    break;
                }

            historyProducts.push(product);
            SessionUtils.getInstance().putValue(request, "historyProducts", historyProducts);
            request.getRequestDispatcher("/view/web/Detail.jsp").forward(request, response);
        }
    }

}
