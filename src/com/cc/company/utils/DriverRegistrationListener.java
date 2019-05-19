package com.cc.company.utils;

import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import com.cc.company.db.ConnectionManager;

/**
 * 数据库连接、关闭
 */
public class DriverRegistrationListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
    	try {
			new ConnectionManager();
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            java.sql.Driver mySqlDriver = DriverManager.getDriver(MyProperties.get("url"));
            DriverManager.deregisterDriver(mySqlDriver);
        } catch (SQLException ex) {
            System.out.println("Could not deregister driver:".concat(ex.getMessage()));
        } 
    }

}