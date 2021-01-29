package com.ttms.core.web.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ttms.core.po.Hero;
import com.ttms.core.po.PageCounter;
import com.ttms.core.service.HeroService;

@Controller
@RequestMapping("/ttms")
public class HeroController {

	@Autowired
	private HeroService heroService;

	@RequestMapping("/hero.action")
	public String heroList(Model model, HttpSession session) {
		List<Hero> heros = heroService.findHeroList();
		model.addAttribute("heros", heros);
		return "test";
	}

	// id查询英雄详情
	@RequestMapping("/getHeroById.action")
	@ResponseBody
	public Hero getHeroById(Integer champion_id, HttpSession session) {
		Hero hero = heroService.getHeroById(champion_id);
		session.setAttribute("Hero_SESSION", hero);
		return hero;
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

	/**
	 * 创建英雄
	 */
	@RequestMapping(value = "/createHero.action", method = RequestMethod.POST)
	@ResponseBody
	public String heroCreate(Hero hero, @RequestParam("addname") String addname,
			@RequestParam("uploadfile") MultipartFile uploadfile, HttpServletRequest request) throws Exception {
		System.out.println(addname);
		System.out.println("uploadfile" + uploadfile);
		System.out.println(hero.getChampion_name());
		// 获取上传文件的原始名称
		String originalFilename = uploadfile.getOriginalFilename();
		// 设置上传文件的保存地址目录
		String dirPath = "D:/data/file/";
		File filePath = new File(dirPath);
		if (!filePath.exists()) {
			filePath.mkdirs();
		}
		// 使用UUID重新命名上传的文件名称(上传人_uuid_原始文件名称)
		String newFilename = addname + "_" + UUID.randomUUID() + "_" + originalFilename;
		// 使用MultipartFile接口的方法完成文件上传到指定位置
		uploadfile.transferTo(new File(dirPath + newFilename));
		System.out.println(dirPath + newFilename);
		// 设置文件名到数据库
		hero.setChampion_icon(newFilename);

		// 1 创建Date对象
		Date date = new Date();
		// 2 得到timestamp格式时间，存入sql的时间格式为yy/MM/dd HH:mm:SS
		Timestamp timestamp = new Timestamp(date.getTime());
		hero.setCreate_time(timestamp);
		// 3 执行Service层中的创建方法，返回受影响的行数
		int rows = heroService.createHero(hero);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
}
