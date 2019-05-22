package com.cc.company.servlet;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cc.company.file.MutiFileUpload;
import com.cc.company.file.SingleFileUpload;
import com.cc.company.utils.MyProperties;
import com.cc.company.utils.SessionUtils;
/**
 * 杂项
 * @author chen
 *
 */
public class OtherServlet extends HttpServlet {
	private static final Random r = new Random();
	private static final char[] chs = MyProperties.get("codelist").toCharArray();
	private static final int NUMBER_OF_CHS = 4;
	private static final int IMG_WIDTH = 65;
	private static final int IMG_HEIGHT = 25;
	private static final long serialVersionUID = 3010809770452450488L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
		if (action == null) {
            action = "";
		}
		// 后台
		switch (action) {
			case "codeImage":
				codeImage(request, response);
				break;
			case "singleFileUpload":
				singleFileUpload(request, response);
				break;
			case "mutiFileUpload":
				mutiFileUpload(request, response);
				break;
		}
	}

	/**
	 * 验证码
	 * @param request
	 * @param response
	 */
	private void codeImage(HttpServletRequest request, HttpServletResponse response) {
		BufferedImage image = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, BufferedImage.TYPE_INT_RGB); // 实例化BufferedImage
		Graphics g = image.getGraphics();
		Color c = new Color(200, 200, 255); // 验证码图片的背景颜色
		g.setColor(c);
		g.fillRect(0, 0, IMG_WIDTH, IMG_HEIGHT); // 图片的边框

		StringBuilder sb = new StringBuilder(); // 用于保存验证码字符串
		int index; // 数组的下标
		for (int i = 0; i < NUMBER_OF_CHS; i++) {
			index = r.nextInt(chs.length); // 随机一个下标
			g.setColor(new Color(r.nextInt(88), r.nextInt(210), r.nextInt(150))); // 随机一个颜色
			g.drawString(chs[index] + "", 15 * i + 3, 18); // 画出字符
			sb.append(chs[index]); // 验证码字符串
		} 

		SessionUtils.set(request,"vcodetext", sb.toString()); // 将验证码字符串保存到session中
		try {
			ImageIO.write(image, "jpg", response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 单文件上传
	 * @param request
	 * @param response
	 */
	private void singleFileUpload(HttpServletRequest request, HttpServletResponse response) {
		SingleFileUpload upload = new SingleFileUpload();
		try {
			upload.parseRequest(request);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		File parent = new File(MyProperties.get("filePath"));

		try {
			upload.upload(parent);
		}
		catch(org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException e){
			// 文件大小超出最大值
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 多文件上传
	 * @param request
	 * @param response
	 */
	private void mutiFileUpload(HttpServletRequest request, HttpServletResponse response) {
		MutiFileUpload upload = new MutiFileUpload();
		try {
			upload.parseRequest(request);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		File parent = new File(MyProperties.get("filePath"));

		try {
			upload.upload(parent);
		}
		catch(org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException e){
			// 文件大小超出最大值
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
