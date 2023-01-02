package com.electronic.controller.web;

import com.electronic.model.*;
import com.electronic.service.ICartService;
import com.electronic.service.IOrderService;
import com.electronic.service.IProductService;
import com.electronic.service.IUserService;
import com.electronic.service.implement.CartService;
import com.electronic.service.implement.OrderService;
import com.electronic.service.implement.ProductService;
import com.electronic.service.implement.UserService;
import com.electronic.utils.RandomStringGenerator;
import com.electronic.utils.SessionUtils;
import com.electronic.utils.digital_signature.DSASignature;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.PublicKey;
import java.util.List;

@WebServlet(name = "Confirm Payment", urlPatterns = {"/confirm-payment/*"})
public class InvoiceConfirmationServlet extends HttpServlet {
    private final IOrderService orderService = new OrderService();
    private final IUserService userService = new UserService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String slug = request.getPathInfo();
        if (slug == null || slug.substring(1).isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/");
        }
        Order order = orderService.findOne(slug.substring(1));

        request.setAttribute("order", order);
        request.getRequestDispatcher("/view/web/InvoiceConfirmation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Upload invoices");
        User user = (User) SessionUtils.getInstance().getValue(request, "user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        try {
            ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
            servletFileUpload.setHeaderEncoding("UTF-8");
            List<FileItem> multipart = servletFileUpload.parseRequest(request);

            String appPath = request.getServletContext().getRealPath("");
            String savePath = appPath + File.separator + "assets/invoices-sign";
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) fileSaveDir.mkdir();
            String id = null;
            for (FileItem item : multipart) {
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    InputStream stream = item.getInputStream();
                    if (name.equalsIgnoreCase("id")) id = Streams.asString(stream, "UTF-8");
                }
            }
            String src = appPath + File.separator + "assets/invoices/invoice-" + id + ".pdf";
            String sign = null;
            for (FileItem item : multipart) {
                if (!item.isFormField()) {
                    String fileName = "invoice-sign-" + id + ".pdf";
                    File storeFile = new File(savePath + File.separator + fileName);
                    if (storeFile.exists()) storeFile.delete();
                    item.write(storeFile);
                    sign = storeFile.getPath();
                    System.out.println(storeFile.getPath());
                }
            }
            PublicKey publicKey = userService.findKey(user.getId()).getPublic();
            Order order = orderService.findOne(id);
            boolean isCorrect = DSASignature.verify(src, sign, publicKey);
            System.out.println(isCorrect);
            if (isCorrect && order != null) {
                order.setStatus("OS02");
                orderService.update(order);
                response.sendRedirect(request.getContextPath() + "/account/order");
            } else {
                throw new Exception("Verify failed");
            }
            return;
        } catch (Exception e) {
            String slug = request.getPathInfo();
            if (slug == null || slug.substring(1).isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/");
            }
            Order order = orderService.findOne(slug.substring(1));
            request.setAttribute("order", order);
            request.setAttribute("success", false);
            request.getRequestDispatcher("/view/web/InvoiceConfirmation.jsp").forward(request, response);
            e.printStackTrace();
        }
    }
}