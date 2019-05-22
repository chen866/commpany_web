package com.cc.company.servlet.manage;

import com.alibaba.fastjson.JSONArray;
import com.cc.company.utils.DBUtils;
import com.cc.company.utils.JsonUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Banner {
     public static void load(HttpServletRequest request, HttpServletResponse response){
          try {
               request.setAttribute("p", "banner");
               request.getRequestDispatcher("/manage/banner.jsp").forward(request, response);
          } catch (ServletException | IOException e) {
               e.printStackTrace();
          }
     }
}
