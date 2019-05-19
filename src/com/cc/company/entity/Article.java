package com.cc.company.entity;

import java.util.Date;

   /**
    * article 实体类
    * Mon May 13 02:50:16 CST 2019 
    */ 
public class Article{
	private int aid;
	private String atitle;
	private String acontent;
	private Date atime;
	public void setAid(int aid){
	this.aid=aid;
	}
	public int getAid(){
		return aid;
	}
	public void setAtitle(String atitle){
	this.atitle=atitle;
	}
	public String getAtitle(){
		return atitle;
	}
	public void setAcontent(String acontent){
	this.acontent=acontent;
	}
	public String getAcontent(){
		return acontent;
	}
	public void setAtime(Date atime){
	this.atime=atime;
	}
	public Date getAtime(){
		return atime;
	}
}

