package com.cc.company.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.cc.company.entity.Dictionary;
import com.cc.company.entity.Product;
import com.cc.company.utils.DBUtils;
import com.cc.company.utils.JsonUtils;
import com.cc.company.utils.MyProperties;
import com.cc.company.utils.SessionUtils;

/**
 * 前台门户的Servlet
 *
 * @author chen
 */
public class IndexServlet extends HttpServlet {

    private static final long serialVersionUID = -9044404980878785668L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) {

        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) {

        // 基本信息
        String action = loadDic(request);

        switch (action) {
            case "product":
                product(request, response);
                break;
            case "solution":
                solution(request, response);
                break;
            case "success":
                success(request, response);
                break;
            case "contactus":
                contactus(request, response);
                break;
            default:
                index(request, response);
                break;
        }
    }

    static String loadDic(HttpServletRequest request) {
        JSONArray dicsArray = DBUtils.execute(MyProperties.get("sqlSelectDictionary"));
        List<Dictionary> dics = dicsArray != null ? JSON.parseArray(dicsArray.toJSONString(), Dictionary.class) : null;
        SessionUtils.set(request, "dics", dics);
        if (dics != null && dics.size() > 0) {
            for (Dictionary d : dics) {
                request.setAttribute(d.getTag(), d.getValue());
            }
        }


        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        return action;
    }

    private void baseMethod(HttpServletRequest request, HttpServletResponse response, int ptype, String p, String pagename) {
        // 获取列表
        JSONArray proArray = DBUtils.execute("select pid,pname,pdesp,pcreate from product where ptype=" + ptype);
        if ((proArray != null ? proArray.size() : 0) > 0) {
            @SuppressWarnings("static-access")
            List<Product> pros = proArray.parseArray(proArray.toJSONString(), Product.class);
            for (Product p1 : pros) {
                // 日期格式化
                try {
                    p1.setOther(new SimpleDateFormat("yyyy年MM月dd日  HH:mm").format(p1.getPcreate()));
                } catch (Exception e) {
                    System.err.println("ParseDate: " + e.toString());
                }
            }
            request.setAttribute("pros", pros);
        }

        String id = request.getParameter("id");
        // 是否获取到id：0新增 1编辑
        int mode = 0;
        // 通过id参数判断页面状态
        if (id != null && !id.trim().equals("")) {
            if (JsonUtils.isNumeric(id)) {
                mode = 1;
            }
        }
        JSONArray proArray2 = null;
        if (mode == 1) {
            try {
                proArray2 = DBUtils.execute("select * from `product` where pid=? and ptype=?", new Object[]{id, ptype});
            } catch (Exception e) {
                e.printStackTrace();
            }
            if ((proArray2 != null ? proArray2.size() : 0) > 0) {
                mode = 1;
            } else {
                mode = 0;
            }
        }

        if (mode == 1) {
            request.setAttribute("pro", proArray2.get(0));
        } else {
            request.setAttribute("pro", proArray != null ? proArray.get(0) : null);
        }
        try {
            request.setAttribute("p", p);
            request.setAttribute("pagename", pagename);
            request.getRequestDispatcher("/index/product.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void product(HttpServletRequest request, HttpServletResponse response) {
        baseMethod(request, response, 0, "product", "产品中心");
    }

    private void solution(HttpServletRequest request, HttpServletResponse response) {
        baseMethod(request, response, 1, "solution", "解决方案");
    }

    private void success(HttpServletRequest request, HttpServletResponse response) {
        baseMethod(request, response, 2, "success", "成功案例");
    }

    private void contactus(HttpServletRequest request, HttpServletResponse response) {

        JSONArray data = null;
        try {
            data = DBUtils.execute(MyProperties.get("sqlSelectDictionaryByTag"), new Object[]{"contactus"});
        } catch (Exception e) {
            //e.printStackTrace();
        }
        String pdesp = JsonUtils.get(data != null ? data.getJSONObject(0) : null, "value", "");

        try {
            request.setAttribute("p", "contactus");
            request.setAttribute("pdesp", pdesp);
            request.getRequestDispatcher("/index/contactus.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void index(HttpServletRequest request, HttpServletResponse response) {
        //轮播图
        try {
            JSONArray imagesArray = DBUtils.execute(MyProperties.get("sqlSelectFileByName"), new Object[]{"轮播图"});
            List<String> images = new ArrayList<String>();
            for (int i = 0; i < imagesArray.size(); i++) {
                String path=JsonUtils.get(imagesArray.getJSONObject(i),"path","");
                if(!path.trim().equals("")){
                    images.add(path);
                }
            }
            if(images.size()==0){
                images.add("/index/img/Shanghai.jpg");
                images.add("/index/img/Newyork.jpg");
                images.add("/index/img/Tokyo.jpg");
                images.add("/index/img/landscape.jpg");
            }
            request.setAttribute("images", images);
        } catch (Exception e) {
            //e.printStackTrace();
        }
        //解决方案
        try {
            JSONArray imagesArray = DBUtils.execute(MyProperties.get("sqlSelectFileByName"), new Object[]{"轮播图"});
            List<String> images = new ArrayList<String>();
            for (int i = 0; i < imagesArray.size(); i++) {
                String path=JsonUtils.get(imagesArray.getJSONObject(i),"path","");
                if(!path.trim().equals("")){
                    images.add(path);
                }
            }
            if(images.size()==0){
                images.add("/index/img/Shanghai.jpg");
                images.add("/index/img/Newyork.jpg");
                images.add("/index/img/Tokyo.jpg");
                images.add("/index/img/landscape.jpg");
            }
            request.setAttribute("images", images);
        } catch (Exception e) {
            //e.printStackTrace();
        }
        try {
            request.setAttribute("p", "index");
            request.getRequestDispatcher("/index/index.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
