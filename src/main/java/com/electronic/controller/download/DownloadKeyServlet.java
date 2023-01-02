package com.electronic.controller.download;

import com.electronic.model.User;
import com.electronic.service.IUserService;
import com.electronic.service.implement.UserService;
import com.electronic.utils.SessionUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.security.KeyPair;

@WebServlet(name = "DownloadKeyServlet", value = "/download-key")
public class DownloadKeyServlet extends HttpServlet {
    private final IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) SessionUtils.getInstance().getValue(request, "user");
        KeyPair keyPair = userService.findKey(user.getId());
        response.setContentType("Application/octet-stream");
        response.setHeader("Content-Disposition", "filename=\"key.txt\"");
        OutputStream os = response.getOutputStream();
        try {
            os.write(keyPair.getPrivate().getEncoded(), 0, keyPair.getPrivate().getEncoded().length);
        } catch (Exception e) {
            //handle error
        } finally {
            os.close();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
