package com.arvato.lancome2.vo;

import java.util.ArrayList;
import java.util.List;

public class RecordSet {
	private int totalCount;
	private List values = new ArrayList();
	private int pageSize;
	private int pageNum;
	
	public RecordSet() {
		//default constructor
	}
	public RecordSet(List values, int num) {
		initParams(values, 10, num);
	}
	public RecordSet(List values, int pageSize, int num) {
		initParams(values, pageSize, num);
	}
	private void initParams(List values, int pageSize, int num) {
		this.pageSize = pageSize;
		this.totalCount = values.size();
		
		if (this.totalCount % this.pageSize == 0) {
			this.pageNum = this.totalCount / this.pageSize;
		}
		else {
			this.pageNum = this.totalCount / this.pageSize + 1;
		}
		
		if (num < 1)
			num = 1;
		else if (num > pageNum)
			num = pageNum;

		int from = this.pageSize * (num - 1), 
			to = this.pageSize * num - 1;
		for (int i = 0; i < values.size(); i++) {
			if (i >= from && i <= to)
				this.values.add(values.get(i));
		}
	}
	public int getTotalCount() {
		return totalCount;
	}
	public List getValues() {
		return values;
	}
	public List getValues(int num) {
		if (num < 1)
			num = 1;
		else if (num > pageNum)
			num = pageNum;

		int from = 0, to = this.pageSize * num - 1;
		List result = new ArrayList();
		for (int i = 0; i < this.values.size(); i++) {
			if (i >= from && i <= to)
				result.add(this.values.get(i));
		}
		return result;
	}	
	public void setValues(List values) {
		this.values = values;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNum() {
		return pageNum;
	}
}
