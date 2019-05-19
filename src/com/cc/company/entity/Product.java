package com.cc.company.entity;

import java.util.Date;

   /**
    * product 实体类
    * Mon May 13 02:50:16 CST 2019 
    */ 
public class Product{
	private int pid;
	private String pname;
	private String pcontent;
	private String pdesp;
	private int ptype;
	private Date pcreate;
	private String other;
	public void setPid(int pid){
	this.pid=pid;
	}
	public int getPid(){
		return pid;
	}
	public void setPname(String pname){
	this.pname=pname;
	}
	public String getPname(){
		return pname;
	}
	public void setPcontent(String pcontent){
	this.pcontent=pcontent;
	}
	public String getPcontent(){
		return pcontent;
	}
	public void setPdesp(String pdesp){
	this.pdesp=pdesp;
	}
	public String getPdesp(){
		return pdesp;
	}
	public void setPtype(int ptype){
	this.ptype=ptype;
	}
	public int getPtype(){
		return ptype;
	}
	public void setPcreate(Date pcreate){
	this.pcreate=pcreate;
	}
	public Date getPcreate(){
		return pcreate;
	}
	public void setOther(String other){
	this.other=other;
	}
	public String getOther(){
		return other;
	}
}

