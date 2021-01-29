package com.ttms.core.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.common.utils.Page;
import com.ttms.core.po.AlxUser;
import com.ttms.core.service.AlxUserService;

/**
 * 	爱旅行管理控制器类层
 */
@Controller
@RequestMapping("/ttms")
public class AlxUserTTMSController {

	/**
	 * 注入爱旅行Service层对象,使用@Autowired,定义一个Service层对象
	 */
	@Autowired
	private AlxUserService alxuserService;

	/**
	 * ttms爱旅行用户管理
	 */
	/**
	 * ttms查询爱旅行用户列表
	 */
	@RequestMapping(value = "/alxUserList.action")
	public String alxUserList(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer rows, String alx_uname, Model model) {
		// 根据爱旅行用户名条件查询所有爱旅行用户
		Page<AlxUser> alxUsers = alxuserService.findAlxUserList(page, rows, alx_uname);
		// 向模型中传递数据
		model.addAttribute("page", alxUsers);// 查询到的爱旅行用户集合用page集合表示，jsp中再通过page.rows取出每一项
		model.addAttribute("Alx_uname", alx_uname);// 回显查询爱旅行用户名的关键字
		return "alx_user_list";
	}

	/**
	 * 	ttms删除爱旅行用户
	 */
	@RequestMapping(value = "/deleteAlxUser.action")
	@ResponseBody
	public String deleteAlxUser(Integer alx_uid) {
		int rows = alxuserService.deleteAlxUser(alx_uid);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * ttms创建爱旅行用户
	 */
	@RequestMapping(value = "/createAlxUser.action")
	@ResponseBody
	public String createAlxUser(AlxUser alxUser, HttpSession session) {
		// 执行Service层中的创建方法，返回受影响的行数
		int rows = alxuserService.createAlxUser(alxUser);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 	ttms修改爱旅行用户
	 */
	// 通过用户id获取用户信息
	@RequestMapping("/getAlxUserById.action")
	@ResponseBody
	public AlxUser getAlxUserById(Integer alx_uid,HttpSession session) {
		AlxUser alxUser = alxuserService.getAlxUserById(alx_uid);
		session.setAttribute("ALXUSER_SESSION", alxUser);
		return alxUser;
	}

	// ttms执行保存修改
	@RequestMapping("/updateAlxUser.action")
	@ResponseBody
	public String updateAlxUser(AlxUser alxUser) {
		int rows = alxuserService.updateAlxUser(alxUser);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 	ttms爱旅行用户批量删除
	 */
	@RequestMapping(value="/deleteCheck.action",method=RequestMethod.POST)
	@ResponseBody
	public String deleteCheck(String ids,Model model){
		String[] d=ids.split(",");//把数组里的值逗号隔开
		int rows = alxuserService.deleteChecked(d);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	/**
	 * 	ttms爱旅行用户禁用
	 */
	@RequestMapping(value="/updateStateNo.action",method=RequestMethod.POST)
	@ResponseBody
	public String updateStateNo(String ids,Model model) {
		String[] d=ids.split(",");//把数组里的值逗号隔开
		int rows = alxuserService.updateStateNo(d);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	/**
	 * ttms爱旅行用户启用
	 */
	@RequestMapping(value="/updateStateOk.action",method=RequestMethod.POST)
	@ResponseBody
	public String updateStateOk(String ids,Model model) {
		String[] d=ids.split(",");//把数组里的值逗号隔开
		int rows = alxuserService.updateStateOk(d);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	/**
	 * ttms爱旅行用户总记录
	 */
	@RequestMapping(value="/getAllAlxUserCount.action",method=RequestMethod.POST)
	@ResponseBody
	public Integer getAllAlxUserCount() {
		Integer alxUserCount = alxuserService.getAllAlxUserCount();
		return alxUserCount;
	}
}
