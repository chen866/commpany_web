package com.cc.company.servlet.manage;

import com.alibaba.fastjson.JSONArray;
import com.cc.company.servlet.ManageServlet;
import com.cc.company.servlet.OtherServlet;
import com.cc.company.utils.DBUtils;
import com.cc.company.utils.JsonUtils;
import com.cc.company.utils.MyProperties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Banner {
    public static void load(HttpServletRequest request, HttpServletResponse response) {

        //轮播图
        try {
            JSONArray imagesArray = DBUtils.execute(MyProperties.get("sqlSelectFileByName"), new Object[]{"轮播图"});
            Map<Integer, String> map = new HashMap<Integer, String>();

            for (int i = 0; i < imagesArray.size(); i++) {
                String path = JsonUtils.get(imagesArray.getJSONObject(i), "path", "");
                int id=imagesArray.getJSONObject(i).getIntValue("Id");
                if (!path.trim().equals("")) {
                    map.put(id,path);
                }
            }
            /*if (map.size() == 0) {
                map.put(-1,"/index/img/Shanghai.jpg");
                map.put(-2,"/index/img/Newyork.jpg");
                map.put(-3,"/index/img/Tokyo.jpg");
                map.put(-4,"/index/img/landscape.jpg");
            }*/
            request.setAttribute("images", map);
        } catch (Exception e) {
            //e.printStackTrace();
        }
        try {
            request.setAttribute("p", "banner");
            request.getRequestDispatcher("/manage/banner.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public static void del(HttpServletRequest request, HttpServletResponse response) {

        String id = request.getParameter("id");
        //轮播图
        try {
            JSONArray imagesArray = DBUtils.execute("select * from file where state=1 and name=? and id=?", new Object[]{"轮播图", id});
            if (imagesArray.size() == 1) {
                String name = imagesArray.getJSONObject(0).getString("path");

                File imgFile = new File(request.getServletContext() + "/" + name);
                if (imgFile.exists() && imgFile.isFile()) {
                    imgFile.delete();
                }
                DBUtils.executeSQL("DELETE FROM file WHERE `id`=?;", new Object[]{id});

            }
        } catch (Exception e) {
            //e.printStackTrace();
        }
        //重定向至banner页面
        try {
            response.sendRedirect("manage?action=banner");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
