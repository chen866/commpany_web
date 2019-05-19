package com.cc.company.entity;


   /**
    * dictionary 实体类
    * Mon May 13 02:50:16 CST 2019 
    */ 
public class Dictionary{
	private int id;
	private String tag;
	private String name;
	private String value;
	public void setId(int id){
	this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setTag(String tag){
	this.tag=tag;
	}
	public String getTag(){
		return tag;
	}
	public void setName(String name){
	this.name=name;
	}
	public String getName(){
		return name;
	}
	public void setValue(String value){
	this.value=value;
	}
	public String getValue(){
		return value;
	}
}

