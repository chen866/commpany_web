package com.cc.company.entity;


   /**
    * user 实体类
    * Mon May 13 02:50:16 CST 2019 
    */ 
public class User{
	private int uid;
	private String username;
	private String pwd;
	private int state;
	private String mail;
	private int isadmin;
	public void setUid(int uid){
	this.uid=uid;
	}
	public int getUid(){
		return uid;
	}
	public void setUsername(String username){
	this.username=username;
	}
	public String getUsername(){
		return username;
	}
	public void setPwd(String pwd){
	this.pwd=pwd;
	}
	public String getPwd(){
		return pwd;
	}
	public void setState(int state){
	this.state=state;
	}
	public int getState(){
		return state;
	}
	public void setMail(String mail){
	this.mail=mail;
	}
	public String getMail(){
		return mail;
	}
	public void setIsadmin(int isadmin){
	this.isadmin=isadmin;
	}
	public int getIsadmin(){
		return isadmin;
	}
}

