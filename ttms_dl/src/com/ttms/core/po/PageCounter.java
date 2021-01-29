package com.ttms.core.po;

import java.io.Serializable;
import java.util.Date;

public class PageCounter implements Serializable{

	/**
	 * 英雄的持久化类
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private int today;
	private int history;
	private Date currdate;
	public int getHistory() {
		return history;
	}
	public void setHistory(int history) {
		this.history = history;
	}
	public Date getCurrdate() {
		return currdate;
	}
	public void setCurrdate(Date currdate) {
		this.currdate = currdate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getToday() {
		return today;
	}
	public void setToday(int today) {
		this.today = today;
	}
	
}
