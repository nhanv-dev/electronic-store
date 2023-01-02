package com.electronic.utils.tool;

import com.electronic.utils.digital_signature.DSASignature;
import com.electronic.utils.digital_signature.KeyReader;

import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.LayoutManager;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.security.PrivateKey;
import java.util.StringTokenizer;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;


public class view extends JFrame {
	JLabel jlTitle;
	static Dimension diBorder = new Dimension(400, 250);
	JButton upPrivateKey, upPDF, sign;
	JPanel jpKey, jpCrypt;
	JLabel jlPrivateKey, jlPdf, jlDownload;
	String pathPdf, pathPrivateKey;
	PrivateKey privateKey;
	String pathSave = "D://";

	public view() {
		init();
		shows();
	}

	private void init() {
		setTitle("Công cụ ký hóa đơn");
//        this.setLayout(new GridLayout(4,1));
		this.setSize(diBorder);

		this.setDefaultCloseOperation(EXIT_ON_CLOSE);
		this.setVisible(true);
		this.setLocationRelativeTo(null);

	}

	private void shows() {

		JPanel container= new JPanel();
		container.setLayout(new BoxLayout(container, BoxLayout.Y_AXIS));
		container.setBorder(new EmptyBorder(20,15,1,5));

		
		JPanel part2 = new JPanel();
		part2.setPreferredSize(new Dimension(350,30));
		upPDF = new ButtonComponent("Chọn hóa đơn", ButtonComponent.ButtonStyle.PRIMARY);
		upPDF.setPreferredSize(new Dimension(150,30));
		upPDF.setHorizontalAlignment((int) LEFT_ALIGNMENT);
		jlPdf = new JLabel("Đường dẫn đến PDF");
		jlPdf.setPreferredSize(new Dimension(200,30));
		part2.add(upPDF);
		part2.add(jlPdf);


		JPanel part3 = new JPanel();
		part3.setPreferredSize(new Dimension(350,30));
		upPrivateKey = new ButtonComponent("Chọn khóa bí mật", ButtonComponent.ButtonStyle.PRIMARY);
		upPrivateKey.setPreferredSize(new Dimension(150,30));
		jlPrivateKey = new JLabel("Đường dẫn đến private key");
		jlPrivateKey.setPreferredSize(new Dimension(200,30));
		part3.add(upPrivateKey);
		part3.add(jlPrivateKey);
		
		
	
		JPanel part4 = new JPanel();
		part4.setPreferredSize(new Dimension(350,30));
		sign = new ButtonComponent("Ký và tải về máy", ButtonComponent.ButtonStyle.PRIMARY);
		sign.setPreferredSize(new Dimension(150,30));
//		jlDownload = new JLabel("");
//		jlDownload.setPreferredSize(new Dimension(200,30));

		part4.add(sign);
//		part4.add(jlDownload);

		
		
		
		container.add(part2);
		container.add(part3);
		container.add(part4);
		this.add(container);

//        JPanel part5= new JPanel();
//        downloadFile = new JButton("Tải file về máy");
//        part5.add(downloadFile);
//        this.add(part5);

		upPDF.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent arg0) {
				JFileChooser jfc = new JFileChooser();
				jfc.setCurrentDirectory(new File("C:\\"));
				if (JFileChooser.APPROVE_OPTION == jfc.showOpenDialog(null)) {
					jlPdf.setText((jfc.getSelectedFile().getAbsolutePath()));
					pathPdf = jfc.getSelectedFile().getAbsolutePath();
					File file = new File(pathPdf);
					if (!file.exists()) {
						showMessageErrol("Hóa đơn không tồn tại", "Thông báo lỗi");
						pathPdf = null;
					}
				}

			}
		});
		upPrivateKey.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent arg0) {
				JFileChooser jfc = new JFileChooser();
				jfc.setCurrentDirectory(new File("C:\\"));
				if (JFileChooser.APPROVE_OPTION == jfc.showOpenDialog(null)) {
					jlPrivateKey.setText((jfc.getSelectedFile().getAbsolutePath()));
					pathPrivateKey = jfc.getSelectedFile().getAbsolutePath();
					File file = new File(pathPrivateKey);
					if (!file.exists()) {
						showMessageErrol("Khóa không tồn tại", "Thông báo lỗi");
						privateKey = null;
					}
					try {
						privateKey = KeyReader.readPrivateKey(pathPrivateKey);
					} catch (Exception e) {
						showMessageErrol("Khóa không tồn tại", "Thông báo lỗi");
						privateKey=null;
					}

				}

			}
		});

		sign.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if (pathPdf == null) {
					showMessageErrol("Bạn chưa chọn hóa đơn cần ký", "Thông báo lỗi");
					return;
				} else if (privateKey == null) {
					showMessageErrol("Bạn chưa chọn khởi tạo khóa", "Thông báo lỗi");
					return;
				}
				try {
					String dest=getPath(pathPdf);
					DSASignature.sign(pathPdf,dest, privateKey);
					showMessageSuccess("Bạn đã ký hóa đơn thành công. \n Vào đường dẫn: "+dest+" để xem", "Thông báo thành công");

				} catch (Exception e1) {
					showMessageErrol("Ký hóa đơn thất bại", "Thông báo lỗi");
				}

			}
		});

		showContext();
		this.setVisible(true);

	}

	private void showContext() {

		this.setVisible(true);

	}

	private JPanel setJPenalKey() {

		return jpKey;
	}

	private JPanel setPanelCrypt() {

		return jpCrypt;

	}

	private void showMessageErrol(String message, String title) {
		JOptionPane.showMessageDialog(this, message, title, JOptionPane.ERROR_MESSAGE);

	}
	private void showMessageSuccess(String message, String title) {
		JOptionPane.showMessageDialog(this, message, title, JOptionPane.INFORMATION_MESSAGE);

	}
	private String getPath(String path) {
		int index=path.lastIndexOf(".");
		String name= path.substring(0, index)+"-sign.pdf";

		return name;
		
	}
	

	public static void main(String[] args) {
		view main = new view();
		main.show();
//		JButton b= new JButton();
//		JFrame mainFrame = new JFrame("Vi du JMenuBar trong Java Swing");
//		mainFrame.getContentPane().setLayout(new BoxLayout(mainFrame.getContentPane(), BoxLayout.Y_AXIS));;
////		mainFrame.setLayout(new BoxLayout(this,BoxLayout.X_AXIS));
//		mainFrame.add(b);
//		mainFrame.setSize(diBorder);
////		mainFrame.setDefaultCloseOperation(EXIT_ON_CLOSE);
//		mainFrame.setVisible(true);

	}

}
