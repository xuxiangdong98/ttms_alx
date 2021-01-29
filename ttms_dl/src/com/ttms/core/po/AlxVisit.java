package com.ttms.core.po;

import java.io.Serializable;

public class AlxVisit implements Serializable {

	/**
	 * 爱旅行柱状统计实体类
	 */
	private static final long serialVersionUID = 3747132030928486001L;
	private Integer today; // 今日访问量
	private Integer history; // 总访问量
	public Integer getToday() {
		return today;
	}
	public void setToday(Integer today) {
		this.today = today;
	}
	public Integer getHistory() {
		return history;
	}
	public void setHistory(Integer history) {
		this.history = history;
	}
	@Override
	public String toString() {
		return "AlxVisit [today=" + today + ", history=" + history + "]";
	}
	
	
}
