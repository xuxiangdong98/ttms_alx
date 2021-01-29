package com.ttms.core.po;

import java.io.Serializable;
import java.util.Date;

public class Hero implements Serializable{

	/**
	 * 英雄的持久化类
	 */
	private static final long serialVersionUID = 1L;
	private Integer champion_id;
	private String champion_icon;
	private String champion_name;
	private String champion_title;
	private String champion_info;
	private String champion_tags;
	private Date create_time;
	public Integer getChampion_id() {
		return champion_id;
	}
	public void setChampion_id(Integer champion_id) {
		this.champion_id = champion_id;
	}
	public String getChampion_icon() {
		return champion_icon;
	}
	public void setChampion_icon(String champion_icon) {
		this.champion_icon = champion_icon;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public String getChampion_name() {
		return champion_name;
	}
	public void setChampion_name(String champion_name) {
		this.champion_name = champion_name;
	}
	public String getChampion_title() {
		return champion_title;
	}
	public void setChampion_title(String champion_title) {
		this.champion_title = champion_title;
	}
	public String getChampion_info() {
		return champion_info;
	}
	public void setChampion_info(String champion_info) {
		this.champion_info = champion_info;
	}
	public String getChampion_tags() {
		return champion_tags;
	}
	public void setChampion_tags(String champion_tags) {
		this.champion_tags = champion_tags;
	}
	
}
