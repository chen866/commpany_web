package com.cc.company.db;

import java.sql.Connection;
import java.sql.SQLException;
import com.cc.company.utils.MyProperties;
import com.mchange.v2.c3p0.ComboPooledDataSource;

public class ConnectionManager {
	//使用单例模式创建数据库连接池
    private static ConnectionManager instance;
    private static ComboPooledDataSource dataSource;

    public ConnectionManager() throws Exception {
        dataSource = new ComboPooledDataSource();
        dataSource.setUser(MyProperties.get("user"));		//用户名
        dataSource.setPassword(MyProperties.get("password")); //密码
        dataSource.setJdbcUrl(MyProperties.get("url"));//数据库地址
        dataSource.setDriverClass(MyProperties.get("driver"));
        dataSource.setInitialPoolSize(5); //初始化连接数
        dataSource.setMinPoolSize(1);//最小连接数
        dataSource.setMaxPoolSize(10);//最大连接数
        dataSource.setMaxStatements(50);//最长等待时间
        dataSource.setMaxIdleTime(60);//最大空闲时间，单位毫秒
    }

    public static ConnectionManager getInstance() {
        if (instance == null) {
            try {
                instance = new ConnectionManager();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return instance;
    }

    public synchronized final Connection getConnection() {
        Connection conn = null;
        try {
            conn = dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
