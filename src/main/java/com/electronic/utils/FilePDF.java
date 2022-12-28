package com.electronic.utils;

import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.text.Document;


import java.io.*;
import java.util.ArrayList;

public class FilePDF {

    private Document document;

    public String createPdf(String name, String address, ArrayList<Product> product) throws IOException {
        PdfFont vn= PdfFontFactory.createFont("fonts/vuArial.ttf");
        String path = "";
        PdfWriter pdfWriter = new PdfWriter(path);
        PdfDocument pdfDocument = new PdfDocument(pdfWriter);
        pdfDocument.addNewPage();
        document = new Document(pdfDocument);

        // khởi tạo một PdfWriter truyền vào document và FileOutputStream
        // mở file để thực hiện viết


        //viết
        Paragraph title = new Paragraph("Hóa đơn điện tử").setFont(vn);
        title.setBold();
//        title.setWidth(100);
        title.setTextAlignment(TextAlignment.CENTER);
        title.setFontSize(24);
        document.add(title);
        document.add(new Paragraph("Họ và tên: " + name).setFont(vn));
        document.add(new Paragraph("Địa chỉ: " + address).setFont(vn));


        //table
        float columnWith[] = {200f, 50f, 100f};
        Table table = new Table(columnWith);

        Cell cell_11 = new Cell();


        // Code 2
        table.addCell("Tên sản phẩm").setFont(vn);
        table.addCell("Số lượng").setFont(vn);
        table.addCell("Giá").setFont(vn);
        int sum=0;
        // Code 3
        for(Product p:product){
            table.addCell(p.getName());
            table.addCell(String.valueOf(p.getPrice()));
            table.addCell(String.valueOf(p.getQuantity()));
            sum+=p.getPrice()*p.getQuantity();


        }

//        Image img = new Image(ImageDataFactory.create("sbtc1.png"));
//        img.setHeight(10);
//        img.setWidth(10);
//        document.add(img);

        document.add(table);
        document.add(new Paragraph("Tổng tiền: " + sum).setFont(vn));



        // đóng file
        document.close();
        return  path;


    }

    public static void main(String[] args) throws IOException {
        ArrayList<Product> list = new ArrayList<>();
        list.add(new Product("tivi", 1244, 1));
        list.add(new Product("tivi", 234523423, 1));
        list.add(new Product("tivi", 234523423, 1));
        list.add(new Product("tivi", 234523423, 1));
        list.add(new Product("tivi", 234523423, 1));


        new FilePDF().createPdf("Nhàn", "126/17, kp5, phường Linh Trung, Tp Thủ Đức", list);
    }

}
