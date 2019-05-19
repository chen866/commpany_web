package com.cc.company.utils;

import com.alibaba.fastjson.JSONArray;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Random;

public class MD5Utils {

	/**
	 * md5和sha-1混合加密
	 * @param plaintext 要加密的内容
	 * @return String md5和sha-1混合加密之后的密码
	 */
	public static String md5AndSha(String plaintext) {
		return sha(md5(plaintext));
	}

	/**
	 * md5加密
	 * @param plaintext 要加密的内容
	 * @return String md5加密之后的密码
	 */
	public static String md5(String plaintext) {
		return encrypt(plaintext, "md5");
	}

	/**
	 * sha-1加密
	 * @param plaintext 要加密的内容
	 * @return sha-1加密之后的密码
	 */
	public static String sha(String plaintext) {
		return encrypt(plaintext, "sha-1");
	}

	/**
	 * md5或者sha-1加密
	 * @param plaintext     要加密的内容
	 * @param algorithmName 加密算法名称：md5或者sha-1，不区分大小写
	 * @return String md5或者sha-1加密之后的结果
	 */
	private static String encrypt(String plaintext, String algorithmName) {
		if (plaintext == null || "".equals(plaintext.trim())) {
			throw new IllegalArgumentException("请输入要加密的内容");
		}
		if (algorithmName == null || "".equals(algorithmName.trim())) {
			algorithmName = "md5";
		}
		try {
			MessageDigest m = MessageDigest.getInstance(algorithmName);
			m.update(plaintext.getBytes(StandardCharsets.UTF_8));
			byte[] s = m.digest();
			return hex(s);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * byte[]字节数组 转换成 十六进制字符串
	 * @param arr 要转换的byte[]字节数组
	 * @return String 返回十六进制字符串
	 */
	private static String hex(byte[] arr) {
		StringBuilder sb = new StringBuilder();
		for (byte b : arr) {
			sb.append(Integer.toHexString((b & 0xFF) | 0x100), 1, 3);
		}
		return sb.toString();
	}

	/**
	 * 生成含有随机盐的密码
	 * @param plaintext 要加密的密码
	 * @return String 含有随机盐的密码
	 */
	public static String getSaltMd5AndSha(String plaintext) {
		// 生成一个16位的随机数
		Random random = new Random();
		StringBuilder sBuilder = new StringBuilder(16);
		sBuilder.append(random.nextInt(99999999)).append(random.nextInt(99999999));
		int len = sBuilder.length();
		if (len < 16) {
			for (int i = 0; i < 16 - len; i++) {
				sBuilder.append("0");
			}
		}
		// 生成最终的加密盐
		String salt = sBuilder.toString();
		plaintext = md5AndSha(plaintext + salt);

		char[] cs = new char[48];
		for (int i = 0; i < 48; i += 3) {
			cs[i] = plaintext.charAt(i / 3 * 2);
			char c = salt.charAt(i / 3);
			cs[i + 1] = c;
			cs[i + 2] = plaintext.charAt(i / 3 * 2 + 1);
		}
		return String.valueOf(cs);
	}

	/**
	 * 验证加盐后是否和原密码一致
	 * @param plaintext 原密码
	 * @param md5str 加密之后的密码
	 * @return boolean true表示和原密码一致 false表示和原密码不一致
	 */
	public static boolean getSaltverifyMd5AndSha(String plaintext, String md5str) {
		char[] cs1 = new char[32];
		char[] cs2 = new char[16];
		for (int i = 0; i < 48; i += 3) {
			cs1[i / 3 * 2] = md5str.charAt(i);
			cs1[i / 3 * 2 + 1] = md5str.charAt(i + 2);
			cs2[i / 3] = md5str.charAt(i + 1);
		}
		String salt = new String(cs2);
		String encrypPassword = md5AndSha(plaintext + salt);

		// 加密密码去掉最后8位数
		encrypPassword = encrypPassword.substring(0, encrypPassword.length() - 8);

		return encrypPassword.equals(String.valueOf(cs1));
	}

	public static void main(String[] args) {
//		// 原密码
//		String plaintext = "admin";
//
//		// 获取加盐后的MD5值
//		String ciphertext = MD5Utils.getSaltMd5AndSha(plaintext);
//		System.out.println("加盐后MD5：" + ciphertext+"\n长度："+ciphertext.length());
//		System.out.println("加盐后MD5：" + ciphertext+"\n长度："+ciphertext.substring(44).toLowerCase());
//		System.out.println("是否是同一字符串:" + MD5Utils.getSaltverifyMd5AndSha(plaintext, ciphertext));
//		System.out.println("是否是同一字符串:" + MD5Utils.getSaltverifyMd5AndSha(plaintext, "096199896f35a13d0352b027772960402e41c53071e40d5a"));
	}

}
