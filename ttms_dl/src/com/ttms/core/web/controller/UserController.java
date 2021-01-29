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
import com.ttms.core.po.User;
import com.ttms.core.service.UserService;

/**
 * 用户控制器类
 *
 */
@Controller
@RequestMapping("/ttms")
public class UserController {

	// 注入UserService对象
	@Autowired
	private UserService userService;

	/**
	 * 	用户登录的方法
	 * @param username
	 * @param password
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String username, String password, Model model, HttpSession session) {
		//通过UserService层对象调用查询方法，返回User对象 
		User user = userService.findUser(username, password);
		// 判断用户是否为空
		if (user != null) {
			// 不为空，将用户和用户对象添加到Session中
			session.setAttribute("USER_SESSION", user);
			// 登陆成功跳转到主页
			return "welcome";
		}
		//用户为空，提示用户帐号密码错误 
		model.addAttribute("msg", "亲，您输入的帐号或密码有误，请重新输入！");
		//跳转到登录界面，重新登录 
		return "login";
	}
	/**
	 * 	其他页面跳转到主页面的方法，该方法存在安全隐患，需要拦截器完善
	 * @return
	 */
	@RequestMapping(value = "/toWelcome.action")
	public String toCustomer() {
		return "welcome";
	}
	/**
	 * 	退出登录的方法
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout.action")
	public String logout(HttpSession session) {
		//清除Session
		session.invalidate();
		//返回到登录页面,为了业务逻辑清晰，我们使用重定向的方式到登录页面
		return "redirect:login.action";
		
	}
	/**
	 * 	退出登录重定向到login.jsp页面
	 * @return
	 */
	@RequestMapping(value="/login.action",method=RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	/**
	 * 用户列表
	 */
	@RequestMapping(value = "/user_list.action")
	public String user_list(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer rows, String username, Model model) {
		// 根据项目名条件查询所有项目
		Page<User> users = userService.findUserList(page, rows, username);
		// 向模型中传递数据
		model.addAttribute("page", users);// 查询到的项目集合用page集合表示，jsp中再通过page.rows取出每一项
		model.addAttribute("username", username);// 回显查询项目名的关键字
		return "user_list";
	}

	/**
	 * 删除项目
	 */
	@RequestMapping(value = "/user_list/delete.action")
	@ResponseBody
	public String userDelete(Integer id) {
		int rows = userService.deleteUser(id);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	
	/**
	 * 修改项目
	 */
	// 通过项目id获取项目信息
	@RequestMapping("/user_list/getUserById.action")
	@ResponseBody
	public User getUserById(Integer id,HttpSession session) {
		User user = userService.getUserById(id);
		session.setAttribute("USER_SESSION", user);
		return user;
	}

	// 执行保存修改
	@RequestMapping("/user_list/updateUser.action")
	@ResponseBody
	public String userUpdate(User user) {
		int rows = userService.updateUser(user);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}


}
