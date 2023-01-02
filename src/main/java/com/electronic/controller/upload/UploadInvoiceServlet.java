package com.electronic.controller.upload;

import com.electronic.model.Order;
import com.electronic.model.OrderItem;
import com.electronic.model.User;
import com.electronic.service.IOrderService;
import com.electronic.service.IUserService;
import com.electronic.service.implement.OrderService;
import com.electronic.service.implement.UserService;
import com.electronic.utils.ReadUtils;
import com.electronic.utils.SessionUtils;
import com.electronic.utils.digital_signature.DSASignature;
import com.electronic.utils.pdf.FilePDF;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.json.simple.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.PublicKey;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UploadInvoiceServlet", value = "/upload-invoice-sign")
public class UploadInvoiceServlet extends HttpServlet {
    private final IOrderService orderService = new OrderService();
    private final IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
