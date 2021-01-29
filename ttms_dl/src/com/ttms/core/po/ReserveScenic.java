package com.ttms.core.po;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class ReserveScenic implements Serializable {

	/**
	 * 景区预订订单实体类
	 */
	private static final long serialVersionUID = -6720660587857173897L;

	private Integer reserve_sid; //预定景区订单编号
	private Integer reserve_valid; //预定景区处理状态
	private Date reserve_startDate; //预订时间
	private Integer alx_uid;	//订单所属用户id
	private Integer scenic_id;	//订单景点id
	private Integer start;// 起始行
	private Integer rows;// 所取行数
	
	private List<AlxUser> alxUsers;
	private List<AlxScenic> alxScenics;
	

	
	@Override
	public String toString() {
		return "ReserveScenic [reserve_sid=" + reserve_sid + ", reserve_valid=" + reserve_valid + ", reserve_startDate="
				+ reserve_startDate + ", alx_uid=" + alx_uid + ", scenic_id=" + scenic_id + ", start=" + start
				+ ", rows=" + rows + ", alxUsers=" + alxUsers + ", alxScenics=" + alxScenics + "]";
	}
	
	public Integer getReserve_valid() {
		return reserve_valid;
	}

	public void setReserve_valid(Integer reserve_valid) {
		this.reserve_valid = reserve_valid;
	}

	public Date getReserve_startDate() {
		return reserve_startDate;
	}

	public void setReserve_startDate(Date reserve_startDate) {
		this.reserve_startDate = reserve_startDate;
	}

	public List<AlxScenic> getAlxScenics() {
		return alxScenics;
	}
	public void setAlxScenics(List<AlxScenic> alxScenics) {
		this.alxScenics = alxScenics;
	}
	public List<AlxUser> getAlxUsers() {
		return alxUsers;
	}
	public void setAlxUsers(List<AlxUser> alxUsers) {
		this.alxUsers = alxUsers;
	}
	public Integer getReserve_sid() {
		return reserve_sid;
	}
	public void setReserve_sid(Integer reserve_sid) {
		this.reserve_sid = reserve_sid;
	}
	public Integer getAlx_uid() {
		return alx_uid;
	}
	public void setAlx_uid(Integer alx_uid) {
		this.alx_uid = alx_uid;
	}
	public Integer getScenic_id() {
		return scenic_id;
	}
	public void setScenic_id(Integer scenic_id) {
		this.scenic_id = scenic_id;
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
	
}
