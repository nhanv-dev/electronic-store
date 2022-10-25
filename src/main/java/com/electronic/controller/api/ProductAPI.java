package com.electronic.controller.api;

import com.electronic.model.*;
import com.electronic.service.IProductService;
import com.electronic.service.implement.ProductService;
import com.electronic.utils.RandomStringGenerator;
import com.electronic.utils.ReadUtils;
import com.electronic.utils.SlugGeneratorUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductAPI", value = "/api/product/*")
public class ProductAPI extends HttpServlet {
    private static final Gson GSON = new GsonBuilder().setPrettyPrinting().create();
    private IProductService productService;
    private final String SAVE_DIR = "assets/uploadFiles";

    public ProductAPI() {
        productService = new ProductService();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pathInfo = request.getPathInfo();
        String json = null;
        if (pathInfo == null) {
            json = GSON.toJson(productService.findAll(null, null, null));
        } else {
            String id = pathInfo.substring(1);
            if (id.isEmpty()) {
                json = GSON.toJson(productService.findAll(null, null, null));
            } else {
                json = GSON.toJson(productService.findOne(id));
            }
        }
        response.setHeader("Content-Type", "application/json");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setStatus(200);
        response.getWriter().println(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
            servletFileUpload.setHeaderEncoding("UTF-8");
            List<FileItem> multipart = servletFileUpload.parseRequest(request);
            Product product = mapperProduct(multipart);
            String appPath = request.getServletContext().getRealPath("");
            String savePath = appPath + File.separator + SAVE_DIR;
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) fileSaveDir.mkdir();
            for (FileItem item : multipart) {
                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    String url = (request.getContextPath() + File.separator + SAVE_DIR + File.separator + fileName)
                            .replace("\\", "/");
                    if (!fileName.isEmpty()) {
                        File storeFile = new File(savePath + File.separator + fileName);
                        if (!storeFile.exists()) item.write(storeFile);
                        Image image = new Image();
                        image.setId(RandomStringGenerator.randomString(10));
                        image.setUrl(url);
                        image.setProductId(product.getId());
                        product.getImages().add(image);
                    }
                }
            }
            if (productService.findOne(product.getId()) == null)
                productService.insert(product);
            else
                productService.update(product);
            String json = GSON.toJson(productService.findOne(product.getId()));
            response.setHeader("Content-Type", "application/json");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.setStatus(201);
            response.getWriter().println(json);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) {
        JSONObject jsonObject = ReadUtils.parseFromJSON(request);
        String action = (String) jsonObject.get("action");
        if (action.equalsIgnoreCase("deleteImage")) {
            String id = (String) jsonObject.get("id");
            if (id != null) productService.deleteImage(id);
        } else {
            String id = (String) jsonObject.get("id");
            Product product = productService.findOne(id);
            if (product != null) productService.delete(id);
        }
    }

    private Product mapperProduct(List<FileItem> multipart) throws IOException {
        Product product = new Product();
        Discount discount = new Discount();
        Category category = new Category();
        Inventory inventory = new Inventory();
        product.setDiscount(discount);
        product.setCategory(category);
        product.setInventory(inventory);
        for (FileItem item : multipart) {
            String name = item.getFieldName();
            InputStream stream = item.getInputStream();
            String value = Streams.asString(stream, "UTF-8");
            if (name.equalsIgnoreCase("id")) product.setId(value);
            else if (name.equalsIgnoreCase("name")) product.setName(value);
            else if (name.equalsIgnoreCase("sku")) product.setSku(value);
            else if (name.equalsIgnoreCase("desc")) product.setDesc(value);
            else if (name.equalsIgnoreCase("discountId")) discount.setId(value);
            else if (name.equalsIgnoreCase("categoryId")) category.setId(value);
            else if (name.equalsIgnoreCase("inventoryId")) inventory.setId(value);
            else if (name.equalsIgnoreCase("quantity")) inventory.setQuantity(Integer.parseInt(value));
            else if (name.equalsIgnoreCase("price")) product.setPrice(new BigDecimal(value));
        }
        if (product.getId() == null || product.getId().isEmpty()) {
            inventory.setId(RandomStringGenerator.randomString(10));
            product.setId(RandomStringGenerator.randomString(10));
        }
        if (product.getDiscount().getId().equalsIgnoreCase("no-discount")) product.setDiscount(null);
        product.setSlug(SlugGeneratorUtils.toSlug(product.getName()));
        return product;
    }
}
