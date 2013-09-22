package com.arvato.lancome2.vo;

import java.io.Serializable;

public class Catalog implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String name;
	private String img;
	private String link;
	
	private String intro;
	private String ids;
	
	private int level;
	private Catalog[] subCategory;

	private Catalog parentCatalog;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public Catalog[] getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(Catalog[] subCategory) {
		this.subCategory = subCategory;
	}

	public Catalog getParentCatalog() {
		return parentCatalog;
	}

	public void setParentCatalog(Catalog parentCatalog) {
		this.parentCatalog = parentCatalog;
	}

}
