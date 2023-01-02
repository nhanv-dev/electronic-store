package com.electronic.controller.download;

import com.electronic.model.Order;
import com.electronic.model.OrderItem;
import com.electronic.model.User;
import com.electronic.service.IOrderService;
import com.electronic.service.IUserService;
import com.electronic.service.implement.OrderService;
import com.electronic.service.implement.UserService;
import com.electronic.utils.SessionUtils;
import com.electronic.utils.pdf.FilePDF;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.KeyPair;
import java.util.ArrayList;

@WebServlet(name = "DownloadInvoiceServlet", value = "/download-invoice/*")
public class DownloadInvoiceServlet extends HttpServlet {
    private final IUserService userService = new UserService();
    private final IOrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) SessionUtils.getInstance().getValue(request, "user");

        String pathInfo = request.getPathInfo();
        String id = pathInfo.substring(1);

        String fileName = "invoice-" + id + ".pdf";
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + "assets/invoices";
        File storeFile = new File(savePath + File.separator + fileName);

        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) fileSaveDir.mkdir();
        if (!storeFile.exists()) {
            Order order = orderService.findOne(id);
            FilePDF.createPdf(storeFile.getPath(), user.getName(), user.getAddress(), order.getTotal(), (ArrayList<OrderItem>) order.getItems());
        }

        Path path = Paths.get(storeFile.getPath());
        byte[] data = Files.readAllBytes(path);

        response.setContentType("application/octet-stream");
        response.setHeader("Content-disposition", "attachment; filename=" + fileName);
        response.setContentLength(data.length);


        InputStream inputStream = new BufferedInputStream(new ByteArrayInputStream(data));
        OutputStream outStream = response.getOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
        inputStream.close();
        outStream.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
