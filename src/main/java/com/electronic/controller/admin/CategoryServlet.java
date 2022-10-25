package com.electronic.controller.admin;

import com.electronic.service.ICategoryService;
import com.electronic.service.implement.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminCategory", value = "/admin/category")
public class CategoryServlet extends HttpServlet {
    private final ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/admin/category/Category.jsp").forward(request, response);

    }

}
