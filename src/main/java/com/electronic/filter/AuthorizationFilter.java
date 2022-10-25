package com.electronic.filter;

import com.electronic.model.User;
import com.electronic.utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {"/admin/*"})
public class AuthorizationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        User user = (User) SessionUtils.getInstance().getValue(request, "user");
        if (user != null && user.getRole().getName().equalsIgnoreCase("admin"))
            chain.doFilter(request, response);
        else
            ((HttpServletResponse) response).sendRedirect(((HttpServletRequest) request).getContextPath() + "/home");

    }
}
