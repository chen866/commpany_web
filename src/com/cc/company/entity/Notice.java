package com.cc.company.entity;

import java.util.Date;

   /**
    * notice 实体类
    * Mon May 13 02:50:16 CST 2019 
    */ 
public class Notice{
	private int nid;
	private String ntitle;
	private String ncontent;
	private Date ntime;
	public void setNid(int nid){
	this.nid=nid;
	}
	public int getNid(){
		return nid;
	}
	public void setNtitle(String ntitle){
	this.ntitle=ntitle;
	}
	public String getNtitle(){
		return ntitle;
	}
	public void setNcontent(String ncontent){
	this.ncontent=ncontent;
	}
	public String getNcontent(){
		return ncontent;
	}
	public void setNtime(Date ntime){
	this.ntime=ntime;
	}
	public Date getNtime(){
		return ntime;
	}
}

