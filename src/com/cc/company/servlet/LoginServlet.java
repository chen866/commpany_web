package com.cc.company.servlet;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.cc.company.entity.User;
import com.cc.company.utils.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 登录相关Servlet
 *
 * @author 
 */
public class LoginServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        // 页面区分
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        int userid = SessionUtils.get(request, "userid", 0);
        //判断是否登录
        if (userid > 0) {
            // 后台
            try {
                response.sendRedirect("manage?action=index");
                return;
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            // 校验
            switch (action) {
                case "register":
                    register(request, response);
                    break;
                case "lost":
                    lost(request, response);
                    break;
                default:
                    String submit = request.getParameter("submit");
                    if ("1".equals(submit)) {
                        logincheck(request, response);
                    } else {
                        login(request, response);
                    }
                    break;
            }
        }
    }

    /**
     * 登录校验
     *
     * @param request  request
     * @param response response
     */
    private void logincheck(HttpServletRequest request, HttpServletResponse response) {
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
                            SessionUtils.set(request, "user",
                                    JSONObject.parseObject(jsonuser.toJSONString(), User.class));
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        // 登录成功 加载后台页面
                        try {
                            response.sendRedirect("manage?action=index");
                            return;
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
        //登陆失败 重新登录
        login(request, response);
    }

    /**
     * 登录页面
     *
     * @param request  request
     * @param response response
     */
    private void login(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("p", "login");
        try {
            String uname = request.getParameter("uname");
            request.setAttribute("uname", uname);
            request.getRequestDispatcher("/manage/login.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 用户注册
     *
     * @param request  request
     * @param response response
     */
	
	  private void register(HttpServletRequest request, HttpServletResponse
	  response) { request.setAttribute("p", "register");
	  
	  String submit = request.getParameter("submit"); 
	  if ("1".equals(submit)) {
	  //注册逻辑 
		  //验证码 
		  String vcodetext = SessionUtils.get(request, "vcodetext", "");
	  String vcode = request.getParameter("vcode"); if (vcode != null && vcodetext
	  != null && vcodetext.toUpperCase().equals(vcode.toUpperCase())) { //发送邮件
	  
	  } 
	  }
	  try { String uname = request.getParameter("uname"); String email =
	  request.getParameter("email"); request.setAttribute("uname", uname);
	  request.getRequestDispatcher("/manage/register.jsp").forward(request,
	  response); } catch (ServletException | IOException e) { e.printStackTrace();
	  } }
	 

    /**
     * 找回密码
     *
     * @param request  request
     * @param response response
     */
	
	  private void lost(HttpServletRequest request, HttpServletResponse response) {
	  request.setAttribute("p", "lost"); try { String uname =
	  request.getParameter("uname"); request.setAttribute("uname", uname);
	  request.getRequestDispatcher("/manage/lost.jsp").forward(request, response);
	 } catch (ServletException | IOException e) { e.printStackTrace(); } }
	 
}
