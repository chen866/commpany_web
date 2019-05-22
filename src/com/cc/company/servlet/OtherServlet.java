package com.cc.company.servlet;

import com.cc.company.utils.DBUtils;
import com.cc.company.utils.MyProperties;
import com.cc.company.utils.SessionUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * 杂项
 *
 * @author chen
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
            case "mutiFileUpload":
                mutiFileUpload(request, response);
                break;
        }
    }

    /**
     * 验证码
     *
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

        SessionUtils.set(request, "vcodetext", sb.toString()); // 将验证码字符串保存到session中
        try {
            ImageIO.write(image, "jpg", response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /**
     * 多文件上传
     *
     * @param request  request
     * @param response response
     */
    public void mutiFileUpload(HttpServletRequest request, HttpServletResponse response) {
        String dic = MyProperties.get("upload");
        //上传路径
        File uploadPath = new File(getServletContext().getRealPath(dic));
        //System.out.println("uploadPath=====" + uploadPath);
        //如果目录不存在
        if (!uploadPath.exists()) {
            //创建目录
            uploadPath.mkdir();
        }

        //临时目录
        //当文件过大时，需要设置一个临时路径
        File tempPath = new File(getServletContext().getRealPath("temp"));
        if (!tempPath.exists()) {
            tempPath.mkdir();
        }

        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 内存存储的最大值
        factory.setSizeThreshold(4096);
        factory.setRepository(tempPath);
        ServletFileUpload upload = new ServletFileUpload(factory);
        //设置文件上传大小
        upload.setSizeMax(1000000 * 20);
        Random random = new Random(response.getBufferSize());

        try {
            List fileItems = upload.parseRequest(request);
//			String itemNo = "";
            for (Object fileItem : fileItems) {
                String finallyName = "";
                FileItem item = (FileItem) fileItem;
                //是普通的表单输入域
//				if (item.isFormField()) {
//					if ("itemNo".equals(item.getFieldName())) {
//						itemNo = item.getString();
//					}
//				}
                //是否为input="type"输入域
                if (!item.isFormField()) {
                    String fileName = item.getName();
                    long size = item.getSize();
                    if ((fileName == null || fileName.equals("")) && size == 0) {
                        continue;
                    }
                    //截取字符串 如：C:\WINDOWS\Debug\PASSWD.LOG
                    //fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
                    String extName = fileName.substring(fileName.lastIndexOf("."));
                    //item.write(new File(uploadPath + itemNo + ".gif"));

                    Date d = new Date();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
                    //System.out.println("当前时间：" + sdf.format(d));
                    finallyName = sdf.format(d) + "_" + random.nextInt(100) + extName;
                    item.write(new File(uploadPath, finallyName));

                    // 数据库操作
                    //INSERT INTO file (`name`, `path`) VALUES ('轮播图', '/index/img/Shanghai.jpg');
                    DBUtils.executeSQL("INSERT INTO file (`name`, `path`) VALUES ('轮播图', ?);", new Object[]{"/" + dic + "/" + finallyName});
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        //重定向至banner页面
        try {
            response.sendRedirect("manage?action=banner");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
