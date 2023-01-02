package com.electronic.utils.pdf;

import com.electronic.model.Bill;
import com.electronic.model.OrderItem;
import com.electronic.model.Product;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.*;
import com.itextpdf.layout.properties.TextAlignment;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.PdfTextExtractor;

import java.io.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class FilePDF {

    private Document document;
    private PdfReader reader;
    private String textFromPage = null;
    private String name;
    private String address = null;
    private String totalPrice;
    private ArrayList<Bill> listProduct = new ArrayList<>();

    public String createPdf(String path, String name, String address, String phone, String email, ArrayList<OrderItem> listItems) {
        PdfFont vn = null;
        try {
            vn = PdfFontFactory.createFont("fonts/vuArial.ttf");
            PdfWriter pdfWriter = new PdfWriter(path);
            PdfDocument pdfDocument = new PdfDocument(pdfWriter);
            pdfDocument.addNewPage();
            document = new Document(pdfDocument);

            //viết
            Paragraph title = new Paragraph("Hóa đơn điện tử").setFont(vn);
            title.setBold();
            title.setTextAlignment(TextAlignment.CENTER);
            title.setFontSize(24);
            document.add(title);
            document.add(new Paragraph("Họ và tên: " + name).setFont(vn));
            document.add(new Paragraph("Địa chỉ: " + address).setFont(vn));
            document.add(new Paragraph("Số điện thoại: " + phone).setFont(vn));
            document.add(new Paragraph("Gmail: " + email).setFont(vn));

            //table
            float columnWith[] = {50f, 250f, 120f, 100f};
            Table table = new Table(columnWith);
            Cell cell_11 = new Cell();
            
            // Code 2
            table.addCell("STT").setFont(vn).setTextAlignment(TextAlignment.CENTER);
            table.addCell("Tên sản phẩm").setFont(vn).setTextAlignment(TextAlignment.CENTER);
            table.addCell("Giá").setFont(vn).setTextAlignment(TextAlignment.CENTER);
            table.addCell("Số lượng").setFont(vn).setTextAlignment(TextAlignment.CENTER);
            int sum = 0;
            
            // Code 3
            int i = 1;
            for (OrderItem o : listItems) {
                BigDecimal bigDecimal = new BigDecimal(String.valueOf(o.getProduct().getPrice()));
                sum += bigDecimal.intValue() * o.getQuantity();
                table.addCell(String.valueOf(i++)).setTextAlignment(TextAlignment.CENTER);
                table.addCell(o.getProduct().getName()).setTextAlignment(TextAlignment.CENTER);
                table.addCell(String.valueOf(o.getProduct().getPrice())).setTextAlignment(TextAlignment.CENTER);
                table.addCell(String.valueOf(o.getQuantity())).setTextAlignment(TextAlignment.CENTER);
            }
            document.add(table);
            document.add(new Paragraph("Tổng tiền: " + sum).setFont(vn).add(" Vnđ"));
            com.itextpdf.layout.element.Image img = new Image(ImageDataFactory.create("D:\\ProjectATBM - Copy\\src\\main\\webapp\\assets\\images\\logo-sm.png"));
            document.add(img);
       
            document.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return path;
    }
    public void readPDF(String path) {
        try {
            reader = new PdfReader(path);
            // pageNumber = 1
            textFromPage = PdfTextExtractor.getTextFromPage(reader, 1);
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void getValue() {
        StringTokenizer st = new StringTokenizer(textFromPage, "\n");
        System.out.println("Tổng số token: " + st.countTokens());
        while (st.hasMoreTokens()) {
            String valueToken = st.nextToken();
            StringTokenizer stValue = new StringTokenizer(valueToken, ":");
            System.out.println("Tổng số token: " + stValue.countTokens());
            if (stValue.countTokens() == 2) {
                String text = stValue.nextToken();
                if (text.equals("Địa chỉ")) {
                    this.address = stValue.nextToken();
                } else if (text.equals("Họ và tên")) {
                    this.name = stValue.nextToken();
                } else if (text.equals("Tổng tiền")) {
                    this.totalPrice = stValue.nextToken().trim();
                } else {
                    st.nextToken();
                }
            } else {
                StringTokenizer stItem = new StringTokenizer(valueToken, " ");
                System.out.println(stItem.countTokens());
                if (stItem.countTokens() == 4) {
                    if (stItem.nextToken().equals("Hóa")) {
                        System.out.println("noooo");
                    } else {
                        System.out.println("hello");
                        st.nextToken();
                        listProduct.add(new Bill(stItem.nextToken(), stItem.nextToken(), Integer.parseInt(stItem.nextToken())));
                    }
                }
            }
        }
    }
}
