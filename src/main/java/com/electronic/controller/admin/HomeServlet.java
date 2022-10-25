package com.electronic.controller.admin;

import com.electronic.model.Product;
import com.electronic.service.ICartService;
import com.electronic.service.ICategoryService;
import com.electronic.service.IProductService;
import com.electronic.service.IUserService;
import com.electronic.service.implement.CartService;
import com.electronic.service.implement.CategoryService;
import com.electronic.service.implement.ProductService;
import com.electronic.service.implement.UserService;
import com.electronic.utils.RoleUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Admin Home", urlPatterns = {"/admin/home"})
public class HomeServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/view/admin/Home.jsp").forward(request, response);
    }

}