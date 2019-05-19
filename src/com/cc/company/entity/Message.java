package com.cc.company.entity;

import java.util.Date;

   /**
    * message 实体类
    * Mon May 13 02:50:16 CST 2019 
    */ 
public class Message{
	private int mid;
	private String name;
	private String phone;
	private String email;
	private String mcontent;
	private Date mtime;
	public void setMid(int mid){
	this.mid=mid;
	}
	public int getMid(){
		return mid;
	}
	public void setName(String name){
	this.name=name;
	}
	public String getName(){
		return name;
	}
	public void setPhone(String phone){
	this.phone=phone;
	}
	public String getPhone(){
		return phone;
	}
	public void setEmail(String email){
	this.email=email;
	}
	public String getEmail(){
		return email;
	}
	public void setMcontent(String mcontent){
	this.mcontent=mcontent;
	}
	public String getMcontent(){
		return mcontent;
	}
	public void setMtime(Date mtime){
	this.mtime=mtime;
	}
	public Date getMtime(){
		return mtime;
	}
}

