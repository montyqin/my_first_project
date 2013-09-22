package com.arvato.lancome2.vo;

import java.io.Serializable;

public class Comment implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String date;
	private int score;
	private String name;
	private String content;
	private String pcode;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	
}
