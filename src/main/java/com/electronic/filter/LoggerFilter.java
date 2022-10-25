package com.electronic.filter;

import com.electronic.model.User;
import com.electronic.utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter("/*")
public class LoggerFilter implements Filter {
    private FilterConfig filterConfig = null;


    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        long start = System.currentTimeMillis();
        String address = request.getRemoteAddr();
        String file = ((HttpServletRequest) request).getRequestURI();
        chain.doFilter(request, response);
        filterConfig.getServletContext().log(" User IP: " + address + " Resource: " + file
                + " Milliseconds used: " + (System.currentTimeMillis() - start));
    }

    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

}
