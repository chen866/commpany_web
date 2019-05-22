package com.cc.company.servlet.manage;

import com.alibaba.fastjson.JSONArray;
import com.cc.company.utils.DBUtils;
import com.cc.company.utils.JsonUtils;
import com.cc.company.utils.MyProperties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Contactus {
    public static void Load(HttpServletRequest request, HttpServletResponse response) {
        // 获取
        JSONArray data = null;
        try {
            data = DBUtils.execute(MyProperties.get("sqlSelectDictionaryByTag"), new Object[]{"contactus"});
        } catch (Exception e) {
            //e.printStackTrace();
        }
        String desp= JsonUtils.get(data.getJSONObject(0), "value", "");
        String submit = request.getParameter("submit");
        if ("1".equals(submit)) {
            String pdesc = request.getParameter("pdesp");
            //对比
            if(!desp    .equals(pdesc.trim())){
                try {
                    DBUtils.executeSQL("update `dictionary` set `value`=? where `tag`='contactus'", new Object[]{pdesc.trim()});
                } catch (Exception e) {
                    //e.printStackTrace();
                }
            }
            try {
                response.sendRedirect("manage?action=contactus");
                return;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        request.setAttribute("p", "contactus");
        request.setAttribute("pdesp", desp);
        try {
            request.getRequestDispatcher("/manage/contactus.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            //e.printStackTrace();
        }
    }
}
