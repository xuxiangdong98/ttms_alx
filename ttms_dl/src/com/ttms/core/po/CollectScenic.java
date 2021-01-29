package com.ttms.core.po;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class CollectScenic implements Serializable {

	/**
	 * 景区收藏订单实体类
	 */
	private static final long serialVersionUID = -6720660587857173897L;

	private Integer collect_cid; //收藏景点订单编号
	private Date collect_startDate; //收藏时间
	private Integer alx_uid;	//订单所属用户id
	private Integer scenic_id;	//订单景点id
	private Integer start;// 起始行
	private Integer rows;// 所取行数
	
	private List<AlxUser> alxUsers;
	private List<AlxScenic> alxScenics;
	
	
	@Override
	public String toString() {
		return "CollectScenic [collect_cid=" + collect_cid + ", collect_startDate=" + collect_startDate + ", alx_uid="
				+ alx_uid + ", scenic_id=" + scenic_id + ", start=" + start + ", rows=" + rows + ", alxUsers="
				+ alxUsers + ", alxScenics=" + alxScenics + "]";
	}
	public Integer getCollect_cid() {
		return collect_cid;
	}
	public void setCollect_cid(Integer collect_cid) {
		this.collect_cid = collect_cid;
	}
	public Date getCollect_startDate() {
		return collect_startDate;
	}
	public void setCollect_startDate(Date collect_startDate) {
		this.collect_startDate = collect_startDate;
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
	public List<AlxUser> getAlxUsers() {
		return alxUsers;
	}
	public void setAlxUsers(List<AlxUser> alxUsers) {
		this.alxUsers = alxUsers;
	}
	public List<AlxScenic> getAlxScenics() {
		return alxScenics;
	}
	public void setAlxScenics(List<AlxScenic> alxScenics) {
		this.alxScenics = alxScenics;
	}
	

	
}
