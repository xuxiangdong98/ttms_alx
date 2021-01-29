package com.ttms.core.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.core.po.PageCounter;
import com.ttms.core.service.HeroService;

/**
 * 	爱旅行用户页面controller
 *
 */
@Controller
public class PageUIController {
	
	@Autowired
	private HeroService heroService;
	
	@RequestMapping("/toAlxindex.action")
	public String toAlxindex() {
		return "../ailvxing/alx_index";
	}
	@RequestMapping("/toAlxdaily.action")
	public String toAlxdaily() {
		return "../ailvxing/alx_daily";
	}
	@RequestMapping("/toAlxlogin.action")
	public String toAlxlogin() {
		return "../ailvxing/alx_login";
	}
	@RequestMapping("/toAlxproselist.action")
	public String toAlxproselist() {
		return "../ailvxing/alx_prose_list";
	}
	@RequestMapping("/toAlxprose.action")
	public String toAlxprose() {
		return "../ailvxing/alx_prose";
	}
	@RequestMapping("/toAlxregister.action")
	public String toAlxregister() {
		return "../ailvxing/alx_register";
	}
	@RequestMapping("/toAlxMyCollect.action")
	public String toAlxMyCollect() {
		return "../ailvxing/alx_mycollect";
	}
	@RequestMapping("/toLogin.action")
	public String toLogin() {
		return "../jsp/login";
	}
	@RequestMapping("/ttms/toStatistics_reserve.action")
	public String toStatistics_reserve() {
		return "../jsp/statistics_reserve";
	}
	@RequestMapping("/ttms/toStatistics_collect.action")
	public String toStatistics_collect() {
		return "../jsp/statistics_collect";
	}
	@RequestMapping("/ttms/toStatistics_alxuser.action")
	public String toStatistics_alxuser() {
		return "../jsp/statistics_alxuser";
	}
	@RequestMapping("/ttms/toStatistics_alxuservisit.action")
	public String toStatistics_uservisit() {
		return "../jsp/statistics_alxuservisit";
	}
	
	//页面访问计数器
		@RequestMapping("/addCounter.action")
		@ResponseBody
		public PageCounter addCounter() {

			PageCounter pageCounter = heroService.findPageToday(1);
			
			SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
			 
			//系统时间
			String systemDate = dateFormat.format(new Date());
			//记录时间
			String pageViewDate = dateFormat.format(pageCounter.getCurrdate());

			
			if (systemDate.equals(pageViewDate)) { //今天
				pageCounter.setToday(pageCounter.getToday()+1);
				pageCounter.setHistory(pageCounter.getHistory()+1);
			
			}else { //不是今天了
				pageCounter.setToday(1);
				pageCounter.setCurrdate(new Date());
				pageCounter.setHistory(pageCounter.getHistory()+1);
			}

			int rows = heroService.updatePageCounter(1, pageCounter);

			if (rows != 1) {
				return null;
			}else {
				return pageCounter;
			}
		}
}
