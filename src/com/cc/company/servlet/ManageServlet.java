package com.cc.company.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.cc.company.entity.Dictionary;
import com.cc.company.entity.Product;
import com.cc.company.entity.User;
import com.cc.company.servlet.manage.Banner;
import com.cc.company.servlet.manage.Contactus;
import com.cc.company.utils.*;

/**
 * 后台管理Servlet
 *
 * @author chen
 */
public class ManageServlet extends HttpServlet {
    private static final long serialVersionUID = 3010809770452450488L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 基本信息
        String action = IndexServlet.loadDic(request);

        int userid = SessionUtils.get(request, "userid", 0);
        //判断是否登录
        if (userid > 0) {
            // 后台
            switch (action) {
                case "logout":
                    logout(request, response);
                    break;
                case "banner":
                    Banner.load(request, response);
                    break;
                case "bannerdel":
                    Banner.del(request, response);
                    break;
                case "contactus":
                    Contactus.Load(request, response);
                    break;
                case "products":
                    products(request, response);
                    break;
                case "product":
                    product(request, response);
                    break;
                case "solutions":
                    solutions(request, response);
                    break;
                case "solution":
                    solution(request, response);
                    break;
                case "successs":
                    successs(request, response);
                    break;
                case "success":
                    success(request, response);
                    break;
                default:
                    index(request, response);
                    break;
            }
        } else {
            // 重定向至登录页面
            login(request, response);
        }
    }

    /**
     * 重定向至登录页面
     *
     * @param request  request
     * @param response response
     */
    private void login(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("login");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) {
        SessionUtils.remove(request, "userid");
        login(request, response);
    }

    public void index(HttpServletRequest request, HttpServletResponse response) {
        // 修改基本信息
        String submit = request.getParameter("submit");
        if ("1".equals(submit)) {
            // 获取
            JSONArray dics = DBUtils.execute(MyProperties.get("sqlSelectDictionary"));
            if (dics != null && dics.size() > 0) {
                for (int i = 0; i < dics.size(); i++) {
                    JSONObject d;
                    try {
                        d = dics.getJSONObject(i);
                        String tag = JsonUtils.get(d, "tag", "");

                        String p = request.getParameter(tag);
                        if (p != null && !p.trim().equals("") && !JsonUtils.get(d, "value", "").equals(p)) {
                            Object[] param = {p.trim(), JsonUtils.get(d, "id", 0)};
                            DBUtils.executeSQL("update `dictionary` set `value`=? where `id`=?", param);
                        }
                        if ("companyname".equals(tag) || "footer".equals(tag)) {
                            request.setAttribute(tag, d.getString("value"));
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            try {
                response.sendRedirect("manage?action=index");
                return;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        // 基本信息
        JSONArray dicsArray = DBUtils.execute(MyProperties.get("sqlSelectDictionary"));
        @SuppressWarnings("static-access")
        List<Dictionary> dics = dicsArray != null ? dicsArray.parseArray(dicsArray.toJSONString(), Dictionary.class) : null;
        if (dics != null && dics.size() > 0) {
            for (Dictionary d : dics) {
                request.setAttribute(d.getTag(), d.getValue());
            }
        }
        SessionUtils.set(request, "dics", dics);
        // 跳转至基本信息编辑页
        try {
            request.setAttribute("p", "index");
            request.getRequestDispatcher("/manage/index.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 通用列表页
     *
     * @param request  request
     * @param response response
     * @param ptype    类型id
     * @param action   页面
     * @param title    页面标题
     */
    private void baselist(HttpServletRequest request, HttpServletResponse response, int ptype, String action,
                          String title) {
        String submit = request.getParameter("submit");
        if ("1".equals(submit)) {
            String id = request.getParameter("pid");
            // 状态：0新增 1编辑
            int mode = 0;
            // 通过id参数判断页面状态
            if (id != null && !id.trim().equals("")) {
                if (JsonUtils.isNumeric(id)) {
                    mode = 1;
                }
            }
            JSONArray proArray = null;
            if (mode == 1) {
                try {
                    proArray = DBUtils.execute(MyProperties.get("sqlSelectProductByType"), new Object[]{id, ptype});
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if ((proArray != null ? proArray.size() : 0) > 0) {
                    mode = 1;
                } else {
                    mode = 0;
                }
            }
            // 页面逻辑
            if (mode == 1) {
                String func = request.getParameter("func");
                if ("del".equals(func)) {
                    try {
                        DBUtils.executeSQL("DELETE FROM `product` WHERE `pid`=? and `ptype`=?;",
                                new Object[]{id, ptype});
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else {
                    // 编辑
                    String pname = request.getParameter("pname");
                    String pcontent = request.getParameter("pcontent");
                    String pdesp = request.getParameter("pdesp");

                    Product pro = new Product();
                    pro.setPid(Integer.parseInt(id));
                    pro.setPcontent(pcontent);
                    pro.setPdesp(pdesp);
                    pro.setPname(pname);
                    pro.setPtype(ptype);

                    Product pro2 = JSONObject.parseObject(proArray.get(0).toString(), Product.class);

                    if (!pro2.equals(pro)) {
                        try {
                            DBUtils.executeSQL(
                                    "UPDATE `product` SET `pname`=?, `pcontent`=?, `pdesp`=? WHERE `pid`=? and `ptype`=?;",
                                    new Object[]{pname, pcontent, pdesp, id, ptype});
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            } else {
                // 新增
                String pname = request.getParameter("pname");
                String pcontent = request.getParameter("pcontent");
                String pdesp = request.getParameter("pdesp");

                try {
                    DBUtils.executeSQL(
                            "INSERT INTO `product` (`pname`, `pcontent`, `pdesp`, `ptype`) VALUES (?, ?, ?, ?);",
                            new Object[]{pname, pcontent, pdesp, ptype});
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            try {
                response.sendRedirect("manage?action=" + action + "s");
                return;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 获取列表
        JSONArray proArray = DBUtils.execute("select pid,pname,pcontent,pcreate from product where ptype=" + ptype);
        if ((proArray != null ? proArray.size() : 0) > 0) {
            @SuppressWarnings("static-access")
            List<Product> pros = proArray.parseArray(proArray.toJSONString(), Product.class);
            for (Product p : pros) {
                if (p.getPcontent().length() > 75) {
                    p.setPcontent(p.getPcontent().substring(0, 60) + "...");
                }
                // 日期格式化
                try {
                    p.setOther(new SimpleDateFormat("yyyy年MM月dd日  HH:mm").format(p.getPcreate()));
                } catch (Exception e) {
                    System.err.println("ParseDate: " + e.toString());
                }
            }
            request.setAttribute("pros", pros);
        }
        // 跳转至产品列表页
        try {
            request.setAttribute("p", action + "s");
            request.setAttribute("title", title);
            request.setAttribute("newp", action);
            request.getRequestDispatcher("/manage/products.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 产品列表页
     *
     * @param request  request
     * @param response response
     */
    private void products(HttpServletRequest request, HttpServletResponse response) {
        baselist(request, response, 0, "product", "产品中心");
    }

    /**
     * 产品详情页
     *
     * @param request  request
     * @param response response
     */
    public void product(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        // 状态：0新增 1编辑
        int mode = 0;
        // 通过id参数判断页面状态
        if (id != null && !id.trim().equals("")) {
            if (JsonUtils.isNumeric(id)) {
                mode = 1;
            }
        }
        JSONArray proArray = null;
        if (mode == 1) {
            try {
                proArray = DBUtils.execute(MyProperties.get("sqlSelectProductByType"), new Object[]{id, 0});
            } catch (Exception e) {
                e.printStackTrace();
            }
            if ((proArray != null ? proArray.size() : 0) > 0) {
                mode = 1;
            } else {
                mode = 0;
            }
        }
        // 页面逻辑
        if (mode == 1) {
            request.setAttribute("pro", proArray.get(0));
            // System.out.println(proArray.get(0));
        }

        // 跳转至产品编辑页
        try {
            request.setAttribute("p", "product");
            request.setAttribute("title", mode == 0 ? "添加产品" : "编辑产品");
            request.setAttribute("mode", mode);
            request.setAttribute("typename", "产品");
            request.setAttribute("action", "manage?action=products");
            request.getRequestDispatcher("/manage/product.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 解决方案列表页
     *
     * @param request  request
     * @param response response
     */
    private void solutions(HttpServletRequest request, HttpServletResponse response) {
        baselist(request, response, 1, "solution", "解决方案");
    }

    /**
     * 解决方案详情页
     *
     * @param request  request
     * @param response response
     */
    private void solution(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        // 状态：0新增 1编辑
        int mode = 0;
        // 通过id参数判断页面状态
        if (id != null && !id.trim().equals("")) {
            if (JsonUtils.isNumeric(id)) {
                mode = 1;
            }
        }
        JSONArray proArray = null;
        if (mode == 1) {
            try {
                proArray = DBUtils.execute(MyProperties.get("sqlSelectProductByType"), new Object[]{id, 1});
            } catch (Exception e) {
                e.printStackTrace();
            }
            if ((proArray != null ? proArray.size() : 0) > 0) {
                mode = 1;
            } else {
                mode = 0;
            }
        }
        // 页面逻辑
        if (mode == 1) {
            request.setAttribute("pro", proArray.get(0));
            // System.out.println(proArray.get(0));
        }

        // 跳转至编辑页
        try {
            request.setAttribute("p", "solution");
            request.setAttribute("title", mode == 0 ? "添加解决方案" : "编辑解决方案");
            request.setAttribute("mode", mode);
            request.setAttribute("typename", "解决方案");
            request.setAttribute("action", "manage?action=solutions");
            request.getRequestDispatcher("/manage/product.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 成功案例列表页
     *
     * @param request  request
     * @param response response
     */
    private void successs(HttpServletRequest request, HttpServletResponse response) {
        baselist(request, response, 2, "success", "成功案例");
    }

    /**
     * 成功案例详情页
     *
     * @param request  request
     * @param response response
     */
    public void success(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        // 状态：0新增 1编辑
        int mode = 0;
        // 通过id参数判断页面状态
        if (id != null && !id.trim().equals("")) {
            if (JsonUtils.isNumeric(id)) {
                mode = 1;
            }
        }
        JSONArray proArray = null;
        if (mode == 1) {
            try {
                proArray = DBUtils.execute("select * from `product` where pid=? and ptype=2", new Object[]{id});
            } catch (Exception e) {
                e.printStackTrace();
            }
            if ((proArray != null ? proArray.size() : 0) > 0) {
                mode = 1;
            } else {
                mode = 0;
            }
        }
        // 页面逻辑
        if (mode == 1) {
            request.setAttribute("pro", proArray.get(0));
            // System.out.println(proArray.get(0));
        }

        // 跳转至编辑页
        try {
            request.setAttribute("p", "success");
            request.setAttribute("title", mode == 0 ? "添加成功案例" : "编辑成功案例");
            request.setAttribute("mode", mode);
            request.setAttribute("typename", "成功案例");
            request.setAttribute("action", "manage?action=successs");
            request.getRequestDispatcher("/manage/product.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
