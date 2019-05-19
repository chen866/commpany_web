package com.cc.company.entity;


   /**
    * companyinfo 实体类
    * Mon May 13 02:50:16 CST 2019 
    */ 
public class Companyinfo{
	private int cid;
	private String phone;
	private String email;
	private String location;
	private String cdesc;
	public void setCid(int cid){
	this.cid=cid;
	}
	public int getCid(){
		return cid;
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
	public void setLocation(String location){
	this.location=location;
	}
	public String getLocation(){
		return location;
	}
	public void setCdesc(String cdesc){
	this.cdesc=cdesc;
	}
	public String getCdesc(){
		return cdesc;
	}
}

