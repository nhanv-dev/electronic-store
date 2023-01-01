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
//        title.setWidth(100);
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


            // đóng file
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
//            System.out.println(st.nextToken());
            // lấy ra giá trị token để if, else không bỏ qua dòng nào
            String valueToken = st.nextToken();
            StringTokenizer stValue = new StringTokenizer(valueToken, ":");
            System.out.println("Tổng số token: " + stValue.countTokens());
//                        System.out.println(st.nextToken());

            if (stValue.countTokens() == 2) {
                String text = stValue.nextToken();
                if (text.equals("Địa chỉ")) {
                    this.address = stValue.nextToken();
//                    System.out.println(stValue.nextToken());
//                    stValue.nextToken();
                } else if (text.equals("Họ và tên")) {
                    this.name = stValue.nextToken();
//                    System.out.println(stValue.nextToken());
                } else if (text.equals("Tổng tiền")) {
//                    totalPrice = Integer.parseInt(stValue.nextToken().trim());
                    this.totalPrice = stValue.nextToken().trim();

//                    System.out.println(stValue.nextToken());
                } else {
                    st.nextToken();
                }
            } else {
                StringTokenizer stItem = new StringTokenizer(valueToken, " ");
                System.out.println(stItem.countTokens());
                if (stItem.countTokens() == 4) {
                    if (stItem.nextToken().equals("Hóa")) {
                        System.out.println("noooo");
//                        stValue.nextToken();
                    } else {
                        System.out.println("hello");
                        st.nextToken();
                        listProduct.add(new Bill(stItem.nextToken(), stItem.nextToken(), Integer.parseInt(stItem.nextToken())));

                    }
                }

            }
        }
    }

    public static void main(String[] args) {
        ArrayList<OrderItem> list = new ArrayList<>();
        list.add(new OrderItem("OR01", "IT01", new Product("Pd01", "tivi", "tivitive", "43534", "5435", null, null, null, new BigDecimal(24343)), 1));
        list.add(new OrderItem("OR01", "IT01", new Product("Pd01", "tivi", "tivitive", "43534", "5435", null, null, null, new BigDecimal(24343)), 1));
        list.add(new OrderItem("OR01", "IT01", new Product("Pd01", "tivi", "tivitive", "43534", "5435", null, null, null, new BigDecimal(24343)), 1));
        list.add(new OrderItem("OR01", "IT01", new Product("Pd01", "tivi", "tivitive", "43534", "5435", null, null, null, new BigDecimal(24343)), 1));


//
////        System.out.println(new FilePDF().createPdf("E:\\bbb.pdf","Nhàn", "126/17, kp5, phường Linh Trung, Tp Thủ Đức", list));
//
////        PdfWriter pdfWriter = null;
////        try {
////            pdfWriter = new PdfWriter("C:\\Users\\HP\\OneDrive\\Documents\\TIỂU LUẬN HIẾN PHÁP- NGUYỄN THỊ KIỀU DIỄM.pdf");
////            PdfDocument pdfDocument = new PdfDocument(pdfWriter);
////
////            //Khai báo PdfReader với giá trị truyền vào là path của file cần đọc
////            PdfReader reader = pdfDocument.getReader();
////            //In ra số lượng page của file đã đọc
//////            System.out.println("This PDF has "+reader.+" pages.");
////            //Sử dụng PdfTextExtractor để đọc toàn bộ text ở trang 100
////            PdfPage page =  pdfDocument.get(1);
////            System.out.println(reader);
////
////            String pages = PdfTextExtractor.getTextFromPage(page);
////            System.out.println("Page 100 Content:\n\n"+pages+"\n\n");
////        } catch (FileNotFoundException e) {
////            e.printStackTrace();
////        }
//
//
//        com.itextpdf.text.pdf.PdfReader reader;
//        String textFromPage = null;
//
//        try {
//
//            reader = new com.itextpdf.text.pdf.PdfReader("E:\\bbb.pdf");
//
//            // pageNumber = 1
//            textFromPage = PdfTextExtractor.getTextFromPage(reader, 1);
//
//            System.out.println(textFromPage);
//
//            reader.close();
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//        // tên , địa chỉ, tổng
//
//
//        ArrayList<Bill> listProduct = new ArrayList<>();
//        StringTokenizer st = new StringTokenizer(textFromPage, "\n");
//        System.out.println("Tổng số token: " + st.countTokens());
//        while (st.hasMoreTokens()) {
////            System.out.println(st.nextToken());
//            String value = st.nextToken();
//            StringTokenizer sts = new StringTokenizer(value, ":");
//            System.out.println("Tổng số token: " + sts.countTokens());
////                        System.out.println(st.nextToken());
//
//            if (sts.countTokens() == 2) {
//                String text = sts.nextToken();
//                if (text.equals("Địa chỉ")) {
//                    System.out.println(sts.nextToken());
////                    sts.nextToken();
//                } else if (text.equals("Họ và tên")) {
//                    System.out.println(sts.nextToken());
//                } else if (text.equals("Tổng tiền")) {
//                    System.out.println(sts.nextToken());
//                } else {
////                    st.nextToken();
//                }
//            } else {
//                StringTokenizer stss = new StringTokenizer(value, " ");
////                System.out.println(stss.countTokens());
////                if (stss.countTokens() == 3) {
////                    listProduct.add(new Bill(stss.nextToken(), stss.nextToken(), Integer.parseInt(stss.nextToken())));
////
////                }
//
////                listProduct.add(new Bill(stss.nextToken(),stss.nextToken(),Integer.parseInt(stss.nextToken())));
//            }
//
//
////            while (sts.hasMoreTokens()) {
////                if (st.nextToken().equals("Họ và tên")) {
////                    System.out.println("aaaa");
//////
////                }
////            }
////            System.out.println(st.nextToken(":"));
////
//        }
//
//
////        String url = "E:\\bb.pdf";
////        // Đọc dữ liệu từ File với Scanner
////        FileInputStream fileInputStream = new FileInputStream(url);
////        Scanner scanner = new Scanner(fileInputStream);
////
////        try {
////            while (scanner.hasNextLine()) {
////                System.out.println(scanner.nextLine());
////            }
////        } finally {
////            try {
////                scanner.close();
////                fileInputStream.close();
////            } catch (IOException ex) {
////
////            }
////        }
        FilePDF pdf = new FilePDF();
        System.out.println(pdf.createPdf("E:\\bbb.pdf", "Huỳnh Quốc Nhàn", "126/17, kp5, phường Linh Trung, Tp Thủ Đức", "013423432432", "1234@gmail.com,", list));
        pdf.readPDF("E:\\bbb.pdf");
        pdf.getValue();
        System.out.println("name:" + pdf.name);
        System.out.println("địa chỉ:" + pdf.address);
        System.out.println("tổng giá tiền:" + pdf.totalPrice);
        for (Bill b : pdf.listProduct) {
            System.out.println(b.toString());
        }

    }

}