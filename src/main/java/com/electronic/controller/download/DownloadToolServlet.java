package com.electronic.controller.download;

import com.electronic.model.User;
import com.electronic.service.IUserService;
import com.electronic.service.implement.UserService;
import com.electronic.utils.SessionUtils;

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

@WebServlet(name = "DownloadToolServlet", value = "/download-tool")
public class DownloadToolServlet extends HttpServlet {
    private final IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setHeader("Content-Disposition", "filename=\"tool.exe\"");
        OutputStream os = response.getOutputStream();
        String fileName = "finish.exe";
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + "assets";
        File storeFile = new File(savePath + File.separator + fileName);

        Path path = Paths.get(storeFile.getPath());
        byte[] data = Files.readAllBytes(path);

        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "filename=\"tool.exe\"");
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
