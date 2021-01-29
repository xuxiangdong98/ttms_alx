package com.ttms.core.po;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class AlxScenic implements Serializable {

	/**
	 * 爱旅行景点预订实体类
	 */
	private static final long serialVersionUID = 3747132030928486001L;
	private Integer scenic_id; // 景点编号
	private String scenic_name; // 景点名称
	private String scenic_img; // 景点图片
	private Integer scenic_price; // 景点价位
	private Integer scenic_heat; // 景点价位
	private String scenic_phone; // 景点电话
	private String scenic_evaluate; // 景点评价
	private String scenic_introduce; // 景点介绍
	private Date scenic_startDate; // 景点开放时间
	private Date scenic_endDate; // 景点结束时间
	private Integer start;// 起始行
	private Integer rows;// 所取行数
	private List<AlxUser> alxUsers;
	private List<ReserveScenic> reserveScenics;
	private List<CollectScenic> collectScenics;
	
	
	
	
	public Integer getScenic_heat() {
		return scenic_heat;
	}
	public void setScenic_heat(Integer scenic_heat) {
		this.scenic_heat = scenic_heat;
	}
	public List<CollectScenic> getCollectScenics() {
		return collectScenics;
	}
	public void setCollectScenics(List<CollectScenic> collectScenics) {
		this.collectScenics = collectScenics;
	}
	public List<ReserveScenic> getReserveScenics() {
		return reserveScenics;
	}
	public void setReserveScenics(List<ReserveScenic> reserveScenics) {
		this.reserveScenics = reserveScenics;
	}
	public Integer getScenic_id() {
		return scenic_id;
	}
	public void setScenic_id(Integer scenic_id) {
		this.scenic_id = scenic_id;
	}
	public String getScenic_name() {
		return scenic_name;
	}
	public void setScenic_name(String scenic_name) {
		this.scenic_name = scenic_name;
	}
	public String getScenic_img() {
		return scenic_img;
	}
	public void setScenic_img(String scenic_img) {
		this.scenic_img = scenic_img;
	}
	public Integer getScenic_price() {
		return scenic_price;
	}
	public void setScenic_price(Integer scenic_price) {
		this.scenic_price = scenic_price;
	}
	public String getScenic_phone() {
		return scenic_phone;
	}
	public void setScenic_phone(String scenic_phone) {
		this.scenic_phone = scenic_phone;
	}
	public String getScenic_evaluate() {
		return scenic_evaluate;
	}
	public void setScenic_evaluate(String scenic_evaluate) {
		this.scenic_evaluate = scenic_evaluate;
	}
	public String getScenic_introduce() {
		return scenic_introduce;
	}
	public void setScenic_introduce(String scenic_introduce) {
		this.scenic_introduce = scenic_introduce;
	}
	public Date getScenic_startDate() {
		return scenic_startDate;
	}
	public void setScenic_startDate(Date scenic_startDate) {
		this.scenic_startDate = scenic_startDate;
	}
	public Date getScenic_endDate() {
		return scenic_endDate;
	}
	public void setScenic_endDate(Date scenic_endDate) {
		this.scenic_endDate = scenic_endDate;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public List<AlxUser> getAlxUsers() {
		return alxUsers;
	}
	public void setAlxUsers(List<AlxUser> alxUsers) {
		this.alxUsers = alxUsers;
	}
	@Override
	public String toString() {
		return "AlxScenic [scenic_id=" + scenic_id + ", scenic_name=" + scenic_name + ", scenic_img=" + scenic_img
				+ ", scenic_price=" + scenic_price + ", scenic_heat=" + scenic_heat + ", scenic_phone=" + scenic_phone
				+ ", scenic_evaluate=" + scenic_evaluate + ", scenic_introduce=" + scenic_introduce
				+ ", scenic_startDate=" + scenic_startDate + ", scenic_endDate=" + scenic_endDate + ", start=" + start
				+ ", rows=" + rows + ", alxUsers=" + alxUsers + ", reserveScenics=" + reserveScenics
				+ ", collectScenics=" + collectScenics + "]";
	}
	
	
	


}
