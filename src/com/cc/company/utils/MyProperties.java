package com.cc.company.utils;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.Properties;

/**
 * 关于Properties类常用的操作
 * 
 * @author
 *
 */
public class MyProperties {
	private static final String FILEPATH = MyProperties.class.getResource("/").getPath()
			+ "com/cc/company/utils/proj.properties";
	private static Properties PPS;
	static {
		PPS = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(FILEPATH));
			PPS.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 根据Key读取Value
	public static String get(String key) {
		return PPS.getProperty(key);
	}

	/**
	 * 读取Properties的全部信息
	 */
	public static void getAll() {
		Enumeration<?> en = PPS.propertyNames(); // 得到配置文件的名字

		while (en.hasMoreElements()) {
			String strKey = (String) en.nextElement();
			String strValue = PPS.getProperty(strKey);
			System.out.println(strKey + "=" + strValue);
		}

	}

	/**
	 * 写入Properties信息
	 * 
	 * @param filePath 文件路径
	 * @param pKey key
	 * @param pValue value
	 */
	public static void writeProperties(String filePath, String pKey, String pValue) {
		// 调用 Hashtable 的方法 put。使用 getProperty 方法提供并行性。
		// 强制要求为属性的键和值使用字符串。返回值是 Hashtable 调用 put 的结果。
		OutputStream out;
		try {
			out = new FileOutputStream(filePath);
			PPS.store(out, "Update " + pKey + " name");
		} catch (IOException e) {
			e.printStackTrace();
		}
		PPS.setProperty(pKey, pValue);
		// 以适合使用 load 方法加载到 Properties 表中的格式，
		// 将此 Properties 表中的属性列表（键和元素对）写入输出流
	}

	public static void main(String[] args) {
		// String value = GetValueByKey("Test.properties", "name");
		// System.out.println(value);
		// GetAllProperties("Test.properties");
		writeProperties("Test.properties", "long", "212");
	}
}
