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
import com.ttms.core.po.AlxScenic;
import com.ttms.core.po.AlxUser;
import com.ttms.core.service.AlxUserService;

/**
 * 爱旅行用户控制器类
 *
 */
@Controller
@RequestMapping("/alx")
public class AlxUserController {

	/**
	 * 注入爱旅行Service层对象,使用@Autowired,定义一个Service层对象
	 */
	@Autowired
	private AlxUserService alxuserService;

	/**
	 * 1.爱旅行用户登录 1.1写@RequestMapping的value和method 1.2该方法的返回值类型为String登录成功返回到主页
	 * 1.3该方法传入的参数是String 的用户名,密码,Model对象,HttpSession对象
	 */
	@RequestMapping(value = "/alxlogin.action", method = RequestMethod.POST)
	public String alxlogin(String alx_uname, String alx_upassword, Model model, HttpSession session) {
		// 1 通过Service层对象调用查询方法,返回一个AlxUser对象
		AlxUser alxUser = alxuserService.findAlxUser(alx_uname, alx_upassword);
		// 2 判断返回的AlxUser对象是否为空
		if (alxUser != null) {
			// 3 不为空，将用户和用户对象添加到Session中,登录成功,跳转到主页
			session.setAttribute("AlxUser_Session", alxUser);
			return "../ailvxing/alx_index";
		}
		// 4 用户为空，提示账号密码错误，通过Model对象添加提示信息
		model.addAttribute("msg", "亲,账户名或密码错误!");
		// 5 跳转到登录界面重新登录
		return "../ailvxing/alx_login";
	}

	/**
	 * 2.爱旅行用户注销登录 2.1该方法返回值为String 2.2该方法传入的是HttpSession
	 */
	@RequestMapping("/alxlogout.action")
	public String alxlogout(HttpSession session) {
		// 1 清除Session
		session.invalidate();
		// 2 跳转到登录页面
		return "../ailvxing/alx_login";
	}

	/**
	 * 3.爱旅行用户注册用户名异步判断是否存在 3.1该方法返回值为String 3.2该方法传入的是alx_uname
	 */
	@RequestMapping("/checkUname.action")
	@ResponseBody
	public Boolean checkUname(String alx_uname) {
		// 1 调用Service层findUname方法得到一个结果
		AlxUser findUser = alxuserService.findUname(alx_uname);

		// 2 判断这个结果是否满足条件，并返回相应的结果
		if (findUser != null) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 4.爱旅行用户注册Form 4.1该方法返回值为String 4.2该方法传入的是String的用户名和密码以及Model对象用于返回注册提示信息
	 */
	@RequestMapping("/alxregist.action")
	public String alxRegist(String alx_uname, String alx_upassword, Model model) {
		// 1 调用Service层方法insertAlxUser得到一个int结果
		int rows = alxuserService.insertAlxUser(alx_uname, alx_upassword);

		// 2 判断这个结果是否满足条件，并返回相应的结果
		if (rows > 0) {
			model.addAttribute("msg", "恭喜您，注册成功！");
			return "../ailvxing/alx_login";
		} else {
			model.addAttribute("msg", "注册失败！");
			return "../ailvxing/alx_register";
		}
	}

	/**
	 * 跳转个人中心
	 */
	@RequestMapping("/tomycenter.action")
	public String tomycenter() {
		return "../ailvxing/alx_mycenter";
	}
	
	

	/**
	 * 已预定景点列表
	 */
	@RequestMapping("/myReserveScenic.action")
	public String myReserveScenic(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer rows,HttpSession session, Model model) {
		AlxUser alxUser = (AlxUser) session.getAttribute("AlxUser_Session");
		// 根据景点名条件查询所有景点
		Page<AlxScenic> alxScenics = alxuserService.findMyScenicList(page, rows,alxUser.getAlx_uid());
		// 向模型中传递数据
		session.setAttribute("AlxScenics_Session", alxScenics);
		model.addAttribute("page", alxScenics);
		return "../ailvxing/alx_mycenter";
	}
	/**
	 * 已收藏景点列表
	 */
	@RequestMapping("/myCollectScenic.action")
	public String myCollectScenic(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer rows,HttpSession session, Model model) {
		AlxUser alxUser = (AlxUser) session.getAttribute("AlxUser_Session");
		// 根据景点名条件查询所有景点
		Page<AlxScenic> alxScenics = alxuserService.findMyCollectScenicList(page,rows,alxUser.getAlx_uid());
		// 向模型中传递数据
		model.addAttribute("page", alxScenics);
		return "../ailvxing/alx_mycollect";
	}
	/**
	 * 用户通过id查景点
	 * @param scenic_id
	 * @return
	 */
	@RequestMapping("/myReserveScenic2.action")
	@ResponseBody
	public AlxScenic myReserveScenic2(Integer scenic_id) {
		AlxScenic alxScenic = alxuserService.getScenicById(scenic_id);
		return alxScenic;
	}
	/**
	 * 用户取消预订
	 * @param reserve_sid
	 * @return
	 */
	@RequestMapping("/userCancelScenic.action")
	@ResponseBody
	public String userCancelScenic(Integer reserve_sid) {
		int rows = alxuserService.deleteScenicById(reserve_sid);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	
	/**
	 * 用户取消收藏
	 * @param reserve_sid
	 * @return
	 */
	@RequestMapping("/userCancelCollectScenic.action")
	@ResponseBody
	public String userCancelCollectScenic(Integer collect_cid) {
		int rows = alxuserService.deleteCollectScenicById(collect_cid);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	
}
