package com.ttms.core.po;

import java.io.Serializable;
import java.util.List;

public class AlxUser implements Serializable{

	/**
	 * 爱旅行用户持久化类
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer alx_uid;	//用户编号(自增)
	private String alx_uname;	//用户名称(手机号/qq号/微信号)
	private String alx_upassword; 	//用户密码
	private String alx_usex; 	//用户性别
	private String alx_age; 	//用户年龄
	private Integer alx_ustate;	//用户状态（默认为1已激活，未激活(封号为0)）
	private String alx_ualias; 	//用户昵称
	private String alx_uicon; 	//用户头像
	private String alx_usignature;	 //用户签名
	private Integer alx_expgrade;	 //用户等级经验
	private Integer start;// 起始行
	private Integer rows;// 所取行数
	
	private List<AlxScenic> alxScenics;
	private List<ReserveScenic> reserveScenics;
	
	
	
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
	public List<ReserveScenic> getReserveScenics() {
		return reserveScenics;
	}
	public void setReserveScenics(List<ReserveScenic> reserveScenics) {
		this.reserveScenics = reserveScenics;
	}
	public Integer getAlx_uid() {
		return alx_uid;
	}
	public void setAlx_uid(Integer alx_uid) {
		this.alx_uid = alx_uid;
	}
	public String getAlx_uname() {
		return alx_uname;
	}
	public void setAlx_uname(String alx_uname) {
		this.alx_uname = alx_uname;
	}
	public String getAlx_upassword() {
		return alx_upassword;
	}
	public void setAlx_upassword(String alx_upassword) {
		this.alx_upassword = alx_upassword;
	}
	public String getAlx_usex() {
		return alx_usex;
	}
	public void setAlx_usex(String alx_usex) {
		this.alx_usex = alx_usex;
	}
	public String getAlx_age() {
		return alx_age;
	}
	public void setAlx_age(String alx_age) {
		this.alx_age = alx_age;
	}
	public Integer getAlx_ustate() {
		return alx_ustate;
	}
	public void setAlx_ustate(Integer alx_ustate) {
		this.alx_ustate = alx_ustate;
	}
	public String getAlx_ualias() {
		return alx_ualias;
	}
	public void setAlx_ualias(String alx_ualias) {
		this.alx_ualias = alx_ualias;
	}
	public String getAlx_uicon() {
		return alx_uicon;
	}
	public void setAlx_uicon(String alx_uicon) {
		this.alx_uicon = alx_uicon;
	}
	public String getAlx_usignature() {
		return alx_usignature;
	}
	public void setAlx_usignature(String alx_usignature) {
		this.alx_usignature = alx_usignature;
	}
	public Integer getAlx_expgrade() {
		return alx_expgrade;
	}
	public void setAlx_expgrade(Integer alx_expgrade) {
		this.alx_expgrade = alx_expgrade;
	}
	public List<AlxScenic> getAlxScenics() {
		return alxScenics;
	}
	public void setAlxScenics(List<AlxScenic> alxScenics) {
		this.alxScenics = alxScenics;
	}
	@Override
	public String toString() {
		return "AlxUser [alx_uid=" + alx_uid + ", alx_uname=" + alx_uname + ", alx_upassword=" + alx_upassword
				+ ", alx_usex=" + alx_usex + ", alx_age=" + alx_age + ", alx_ustate=" + alx_ustate + ", alx_ualias="
				+ alx_ualias + ", alx_uicon=" + alx_uicon + ", alx_usignature=" + alx_usignature + ", alx_expgrade="
				+ alx_expgrade + ", start=" + start + ", rows=" + rows + ", alxScenics=" + alxScenics
				+ ", reserveScenics=" + reserveScenics + "]";
	}
}
