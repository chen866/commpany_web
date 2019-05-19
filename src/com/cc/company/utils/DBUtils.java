package com.cc.company.utils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.cc.company.db.ConnectionManager;
import com.cc.company.entity.User;

import java.sql.*;
import java.util.List;

public class DBUtils {
    /**
     * sql查询语句，无参数
     *
     * @param sql sql
     * @return JSONArray
     */
    public static ResultSet executeWithResult(String sql) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            return ps.executeQuery();
        } catch (Exception e) {
            throw e;
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * sql查询语句，无参数
     *
     * @param sql sql
     * @return JSONArray
     */
    public static ResultSetMetaData executeWithResultSetMetaData(String sql) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            return ps.executeQuery().getMetaData();
        } catch (Exception e) {
            throw e;
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * sql查询语句，无参数
     *
     * @param sql sql
     * @return JSONArray
     */
    public static JSONArray execute(String sql) {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            return resultSetToJson(rs);
        } catch (JSONException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * sql查询语句，有参数
     *
     * @param sql   sql
     * @param param 参数
     * @return JSONArray
     */
    public static JSONArray execute(String sql, Object[] param) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            if (param != null) {
                for (int i = 0; i < param.length; i++) {
                    ps.setObject((i + 1), param[i]);
                }
            }
            ResultSet rs = ps.executeQuery();
            return resultSetToJson(rs);
        } catch (Exception e) {
            throw e;
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * sql修改、插入、删除语句，有参数
     *
     * @param sql   sql
     * @param param 参数
     * @return 修改行数
     */
    public static int executeSQL(String sql, Object[] param) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        if (param != null) {
            for (int i = 0; i < param.length; i++) {
                ps.setObject((i + 1), param[i]);
            }
        }
        int r = 0;
        try {
            r = ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return r;
    }

    /**
     * sql执行结果转换为json工具类
     *
     * @param rs sql执行得到的结果
     * @return JSONArray
     * @throws SQLException  SQLException
     * @throws JSONException JSONException
     */
    private static JSONArray resultSetToJson(ResultSet rs) throws SQLException, JSONException {
        // json数组
        JSONArray array = new JSONArray();

        // 获取列数
        ResultSetMetaData metaData = rs.getMetaData();
        int columnCount = metaData.getColumnCount();

        // 遍历ResultSet中的每条数据
        while (rs.next()) {
            JSONObject jsonObj = new JSONObject();

            // 遍历每一列
            for (int i = 1; i <= columnCount; i++) {
                String columnName = metaData.getColumnLabel(i);
                String value = rs.getString(columnName);
                jsonObj.put(columnName, value);
            }
            array.add(jsonObj);
        }

        return array;
    }

    /**
     * main函数，仅测试用
     *
     * @param args args
     */
    public static void main(String[] args) {
//		for (int i = 0; i < 5; i++) {
//			JSONArray jsonArray = execute("select uid,username,isadmin  from user");
//
//			System.out.println(i + ":  " + jsonArray);
//			List<User> users = JSONArray.parseArray(jsonArray.toJSONString(), User.class);
//			for (User user : users) {
//				System.out.println(user.getUsername() + user.getPwd());
//			}
//			System.out.println(users);
//		}
    }
}
