package com.electronic.controller.admin;

import com.electronic.model.Discount;
import com.electronic.model.Product;
import com.electronic.service.IDiscountService;
import com.electronic.service.IProductService;
import com.electronic.service.implement.DiscountService;
import com.electronic.service.implement.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DiscountServlet", value = "/admin/discount")
public class DiscountServlet extends HttpServlet {
    private final IDiscountService discountService = new DiscountService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/admin/discount/Discount.jsp").forward(request, response);

    }

}
