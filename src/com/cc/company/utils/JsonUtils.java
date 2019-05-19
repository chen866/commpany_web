package com.cc.company.utils;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;

public class JsonUtils {
	/**
	 * 从json中获取key的String值，有默认值
	 * @param jsonObject JSON对象
	 * @param key key
	 * @param defaultValue 默认值
	 * @return 值
	 */
	public static String get(JSONObject jsonObject, String key, String defaultValue) {
		try {
			return jsonObject.getString(key);
		} catch (JSONException e) {
			e.printStackTrace();
			return defaultValue;
		}
	}
	/**
	 * 从json中获取key的int值，有默认值
	 * @param jsonObject JSON对象
	 * @param key key
	 * @param defaultValue 默认值
	 * @return 值
	 */
	public static int get(JSONObject jsonObject, String key, int defaultValue) {
		try {
			return jsonObject.getIntValue(key);
		} catch (JSONException e) {
			e.printStackTrace();
			return defaultValue;
		}
	}
	/**
	 * 从json中获取key的Double值，有默认值
	 * @param jsonObject JSON对象
	 * @param key key
	 * @param defaultValue 默认值
	 * @return 值
	 */
	public static Double get(JSONObject jsonObject, String key, Double defaultValue) {
		try {
			return jsonObject.getDouble(key);
		} catch (JSONException e) {
			e.printStackTrace();
			return defaultValue;
		}
	}
	/**
	 *  判断字符串是否是数字
	 * @param str 字符串
	 * @return 是否是数字
	 */
	public static boolean isNumeric(String str) {
		for (int i = str.length(); --i >= 0;) {
			int chr = str.charAt(i);
			if (chr < 48 || chr > 57)
				return false;
		}
		return true;
	}
}
