package com.cc.company.servlet;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.cc.company.entity.User;
import com.cc.company.utils.*;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.Random;

/**
 * 用于WebService的Servlet
 * 准备用于小程序调用
 * 小程序使用云开发，搁置
 * 目前用于js的ajax请求
 */
public class WebServiceServlet extends HttpServlet {

    private static final long serialVersionUID = -373029705505665565L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        //index(request, response);
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        String func = request.getParameter("f");
        if (func == null) {
            func = "";
        }

        switch (func) {
            case "execute":
                execute(request, response);
                break;
            case "login":
                login(request, response);
                break;
            case "register":
                register(request, response);
                break;
            case "survey_submit":
                survey_submit(request, response);
                break;
            case "survey_list":
                survey_list(request, response);
                break;
            case "survey_total":
                survey_total(request, response);
                break;
            default:
                index(request, response);
                break;
        }
    }

    /**
     * 执行sql指定表指定字段查询
     *
     * @param request  request
     * @param response response
     */
    private void execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            String field = request.getParameter("field");
            String table = request.getParameter("table");
            if (field == null || field.trim().equals("")) {
                field = "*";
            }
            if (table == null || table.trim().equals("")) {
                table = "product";
            }
            String sql = "select " + field + " from " + table;
            JSONArray result = DBUtils.execute(sql);
            System.out.println(result != null ? result.toJSONString() : null);
            if ((result != null ? result.size() : 0) > 0) {
                response.getWriter().write(String.format("{\"state\":1,\"data\":%s}", result.toJSONString()));
            } else {
                response.getWriter().write("{\"state\":0,\"data\":null}");
            }
        } catch (Exception e) {
            try {
                response.getWriter().write(String.format("{\"state\":0,\"data\":\"%s\"}", e.toString()));
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }

    /**
     * 用户登录
     *
     * @param request  request
     * @param response response
     */
    private void login(HttpServletRequest request, HttpServletResponse response) {
        String vcodetext = SessionUtils.get(request, "vcodetext", "");
        String vcode = request.getParameter("vcode");
        if (vcode != null && vcodetext != null && vcodetext.toUpperCase().equals(vcode.toUpperCase())) {
            String uname = request.getParameter("uname");
            String pwd = request.getParameter("pwd");
            if (uname != null && pwd != null) {
                Object[] param = {uname};
                JSONArray users = null;
                try {
                    users = DBUtils
                            .execute("select uid,username,pwd,isadmin from user where username=? and state=1", param);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if ((users != null ? users.size() : 0) == 1) {
                    JSONObject jsonuser = users.getJSONObject(0);
                    String dbpwd = JsonUtils.get(jsonuser, "pwd", "");
                    // 加盐MD5校验
                    if (MD5Utils.getSaltverifyMd5AndSha(pwd, dbpwd)) {
                        try {
                            jsonuser = users.getJSONObject(0);
                            SessionUtils.set(request, "userid", JsonUtils.get(jsonuser, "uid", 0));
                            SessionUtils.set(request, "user", JSONObject.parseObject(jsonuser.toJSONString(), User.class));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        // 登录成功
                        try {
                            response.getWriter().write("{\"state\":1,\"data\":\"success\"}");
                            return;
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        } else {
            try {
                response.getWriter().write("{\"state\":0,\"data\":2}");
                return;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            response.getWriter().write("{\"state\":0,\"data\":1}");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 用户注册
     *
     * @param request  request
     * @param response response
     */
    private void register(HttpServletRequest request, HttpServletResponse response) {
        //验证码
        String vcodetext = SessionUtils.get(request, "vcodetext", "");
        String vcode = request.getParameter("vcode");
        if (vcode != null && vcodetext != null && vcodetext.toUpperCase().equals(vcode.toUpperCase())) {
            //获取参数
            String uname = request.getParameter("uname");
            String email = request.getParameter("email");
            //生成唯一激活码
            long date = new Date().getTime();
            String registercode = MD5Utils.md5AndSha(date + new Random(date).nextInt() + "`");
            //构造url
            String url = request.getScheme() //当前链接使用的协议
                    + "://" + request.getServerName()//服务器地址
                    + ":" + request.getServerPort() //端口号
                    + request.getContextPath() //应用名称，如果应用名称为
                    + "login?action=register2";
            //获取邮件模板
            JSONArray data = null;
            try {
                data = DBUtils.execute(MyProperties.get("sqlSelectDictionaryByTag"), new Object[]{"mailRegister2"});
            } catch (Exception e) {
                e.printStackTrace();
            }
            String defaultTemplate = "你的注册的用户名为：<strong>%s</strong><br>请点击以下链接完成激活：</p><p><strong><a href=\"%s\">%s</a>";
            String template;
            if ((data != null ? data.size() : 0) == 1) {
                template = JsonUtils.get(data.getJSONObject(0), "value", defaultTemplate);
            } else {
                template = defaultTemplate;
            }
            String content = String.format(template, uname, url, url);
            //发送邮件
            MailUtil.sendMail(email, "激活您的华深安信账号", content);
            //保存唯一激活码
            SessionUtils.set(request, "registercode", registercode);
            //数据库操作
            try {
                JSONArray r = DBUtils.execute(String.format("call insert_user('%s','%s','%s','%s','%s','%s')", uname, uname + registercode.substring(44).toLowerCase(), "", email, 0, registercode));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        try {
            String uname = request.getParameter("uname");
            String email = request.getParameter("email");
            request.setAttribute("", uname);
            request.getRequestDispatcher("/manage/register.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public void index(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.getWriter().write("{\"state\":0,\"data\":null}");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 新增答卷
     *
     * @param request  request
     * @param response response
     */
    private void survey_submit(HttpServletRequest request, HttpServletResponse response) {
        //参数
//        String surveyId = request.getParameter("surveyId");
//        String isAgree = request.getParameter("isAgree");
//        String advice = request.getParameter("advice");
        String paramsStr=getStringFromStream(request);
        JSONObject params= JSONObject.parseObject(paramsStr);
        String surveyId = JsonUtils.get(params,"surveyId","1");
        String isAgree = JsonUtils.get(params,"isAgree","3");
        String advice = JsonUtils.get(params,"surveyId","");

        if (surveyId == null || surveyId.trim().equals("") ||
                 isAgree == null || isAgree.trim().equals("")) {
            try {
                response.getWriter().write("{\"msg\":\"success\",\"code\":101,\"data\":[]}");
                return;
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
        if(advice == null){
            advice="";
        }
        //执行
        try {
            response.setContentType("text/json;charset=UTF-8");
            request.setCharacterEncoding("utf-8");
            int i = DBUtils.executeSQL("INSERT INTO survey_log (`surveyId`, `isAgree`, `advice`) VALUES (?, ?, ?);",new Object[]{surveyId, isAgree, advice});
            if(i>0){
                response.getWriter().write("{\"msg\":\"success\",\"code\":0}");
            }else{
                response.getWriter().write("{\"msg\":\"success\",\"code\":102}");
            }
        } catch (Exception e) {
            try {
                response.getWriter().write(String.format("{\"msg\":\"success\",\"code\":999,\"data\":\"%s\"}", e.toString()));
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }

    /**
     * 问卷内容列表
     *
     * @param request  request
     * @param response response
     */
    private void survey_list(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("text/json;charset=UTF-8");
            request.setCharacterEncoding("utf-8");
            JSONArray array = DBUtils.execute("select * from survey");
            response.getWriter().write(String.format("{\"msg\":\"success\",\"code\":0,\"surveyList\":%s}", array != null ? array.toJSONString() : "[]"));
        } catch (Exception e) {
            try {
                response.getWriter().write(String.format("{\"msg\":\"success\",\"code\":999,\"data\":\"%s\"}", e.toString()));
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }

    /**
     * 查询总数
     *
     * @param request  request
     * @param response response
     */
    private void survey_total(HttpServletRequest request, HttpServletResponse response) {
        //参数
//        String isAgree = request.getParameter("isAgree");
        String paramsStr=getStringFromStream(request);
        JSONObject params= JSONObject.parseObject(paramsStr);
        String isAgree = JsonUtils.get(params,"isAgree","3");
        if (isAgree == null || isAgree.trim().equals("") || !JsonUtils.isNumeric(isAgree)) {
            try {
                response.getWriter().write("{\"msg\":\"success\",\"code\":101,\"data\":[]}");
                return;
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
        //执行
        try {
            response.setContentType("text/json;charset=UTF-8");
            request.setCharacterEncoding("utf-8");
            JSONArray array = DBUtils.execute("select count(*) `count` from survey_log where `isAgree`=?",new Object[]{isAgree});
            if(array.size()==1){
                int count=JsonUtils.get(array.getJSONObject(0),"count",0);
                response.getWriter().write(String.format("{\"msg\":\"success\",\"code\":0,\"total\":%s}",count));
            }else{
                response.getWriter().write("{\"msg\":\"success\",\"code\":0,\"total\":0}");
            }
        } catch (Exception e) {
            try {
                response.getWriter().write(String.format("{\"msg\":\"success\",\"code\":999,\"data\":\"%s\"}", e.toString()));
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }private String getStringFromStream(HttpServletRequest req) {
        ServletInputStream is;
        try {
            is = req.getInputStream();
            int nRead = 1;
            int nTotalRead = 0;
            byte[] bytes = new byte[10240];
            while (nRead > 0) {
                nRead = is.read(bytes, nTotalRead, bytes.length - nTotalRead);
                if (nRead > 0)
                    nTotalRead = nTotalRead + nRead;
            }
            String str = new String(bytes, 0, nTotalRead, "utf-8");
            return str;
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }
}
