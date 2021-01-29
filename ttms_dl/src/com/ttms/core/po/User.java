package com.ttms.core.po;
/**
 * 	用户持久化类
 *
 */

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
	/**
	 * 用户持久化类
	 */
	private static final long serialVersionUID = 6417562524444734327L;
	private Integer id;//用户编号
	private String username;//用户名
	private String password;//用户密码
	private String salt;//盐 密码加密时前缀
	private String email;//用户邮箱
	private String mobile;//用户手机号
	private Integer valid;//用户状态1表示正常
	private Date createdTime;//创建时间
	private Date modifiedTime;//修改时间
	private String createdUser;//创建用户
	private String modifiedUser;//修改用户
	private String role;//用户等级
	private Integer start;// 起始行
	private Integer rows;// 所取行数
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
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Integer getValid() {
		return valid;
	}
	public void setValid(Integer valid) {
		this.valid = valid;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	public Date getModifiedTime() {
		return modifiedTime;
	}
	public void setModifiedTime(Date modifiedTime) {
		this.modifiedTime = modifiedTime;
	}
	public String getCreatedUser() {
		return createdUser;
	}
	public void setCreatedUser(String createdUser) {
		this.createdUser = createdUser;
	}
	public String getModifiedUser() {
		return modifiedUser;
	}
	public void setModifiedUser(String modifiedUser) {
		this.modifiedUser = modifiedUser;
	}
}
