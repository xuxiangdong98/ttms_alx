package com.ttms.core.web.controller;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.common.utils.Page;
import com.ttms.core.po.AlxScenic;
import com.ttms.core.po.AlxUser;
import com.ttms.core.po.CollectScenic;
import com.ttms.core.po.ReserveScenic;
import com.ttms.core.service.AlxScenicService;

/**
 * 爱旅行景点预订
 *
 */
@Controller
public class AlxScenicController {

	/**
	 * 注入爱旅行Service层对象,使用@Autowired,定义一个Service层对象
	 */
	@Autowired
	private AlxScenicService scenicService;

	/**
	 * 查询景点列表
	 */
	@RequestMapping("/showScenicList.action")
	public String showScenicList(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer rows, String scenic_name, Model model) {
		// 根据项目名条件查询所有项目
		Page<AlxScenic> alxScenics = scenicService.findAlxScenicList(page, rows, scenic_name);
		// 向模型中传递数据
		model.addAttribute("page", alxScenics);// 查询到的项目集合用page集合表示，jsp中再通过page.rows取出每一项
		model.addAttribute("scenic_name", scenic_name);// 回显查询项目名的关键字
		return "../ailvxing/alx_scenic";
	}

	/**
	 * id查询景点详情
	 * 
	 * @param scenic_id
	 * @param session
	 * @return
	 */
	@RequestMapping("/getScenicById.action")
	@ResponseBody
	public AlxScenic getScenicById(Integer scenic_id, HttpSession session) {
		AlxScenic alxScenic = scenicService.getScenicById(scenic_id);
		session.setAttribute("AlxScenic_SESSION", alxScenic);
		return alxScenic;
	}
	/**
	 * 	查询热门景点
	 */
	@RequestMapping("/getHotScenic.action")
	@ResponseBody
	public AlxScenic getHotScenic() {
		AlxScenic alxScenic = scenicService.findHotScenic();
		return alxScenic;
	}

	/**
	 * 景点立即预订，向景区预定订单中添加
	 * 
	 * @param reserveScenic
	 * @param session
	 * @return
	 */
	@RequestMapping("/alx/userReserveScenic.action")
	@ResponseBody
	public String userReserveScenic(Integer scenic_id, HttpSession session) {
		// 获取Session中的当前用户信息
		AlxUser alxUser = (AlxUser) session.getAttribute("AlxUser_Session");
		// 将当前用户id存储在客户对象中
		ReserveScenic reserveScenic = new ReserveScenic();
		reserveScenic.setAlx_uid(alxUser.getAlx_uid());
		reserveScenic.setScenic_id(scenic_id);

		// 1 创建Date对象
		Date date = new Date();
		// 2 得到timestamp格式时间，存入sql的时间格式为yy/MM/dd HH:mm:SS
		Timestamp timestamp = new Timestamp(date.getTime());
		reserveScenic.setReserve_startDate(timestamp);
		//通过景点id查询是否已经预订过该景点
		ReserveScenic result = scenicService.findReserveScenicByscenic_id(reserveScenic);
		System.out.println(result);
		if (result != null) {
			//通过预订状态检测该预订是否处理0为未处理则不能再次预定，1为已处理，则可以再次预订
			ReserveScenic reserveScenic2 = scenicService.findResValidByscenic_id(reserveScenic);
			Integer reserve_valid = reserveScenic2.getReserve_valid();
			if(reserve_valid == 0) {
				return "FailIn";
			}else {
				int rows = scenicService.createReserveScenic(reserveScenic);
				if (rows > 0) {
					return "OK";
				} else {
					return "FAIL";
				}
			}
		} else {
			// 执行Service层中的创建方法，返回受影响的行数
			int rows = scenicService.createReserveScenic(reserveScenic);
			if (rows > 0) {
				return "OK";
			} else {
				return "FAIL";
			}
		}

	}
	/**
	 * 景点收藏，向景区收藏订单中添加
	 */
	@RequestMapping("/alx/userCollectScenic.action")
	@ResponseBody
	public String userCollectScenic(Integer scenic_id, HttpSession session) {
		// 获取Session中的当前用户信息
		AlxUser alxUser = (AlxUser) session.getAttribute("AlxUser_Session");
		// 将当前用户id存储在客户对象中
		CollectScenic collectScenic = new CollectScenic();
		collectScenic.setAlx_uid(alxUser.getAlx_uid());
		collectScenic.setScenic_id(scenic_id);
		
		// 1 创建Date对象
		Date date = new Date();
		// 2 得到timestamp格式时间，存入sql的时间格式为yy/MM/dd HH:mm:SS
		Timestamp timestamp = new Timestamp(date.getTime());
		collectScenic.setCollect_startDate(timestamp);
		//通过景点id查询是否已经收藏过该景点
		CollectScenic result = scenicService.findCollectScenicByscenic_id(collectScenic);
		System.out.println(result);
		if (result != null) {
			return "FailIn";
		} else {
			// 执行Service层中的创建方法，返回受影响的行数
			int rows = scenicService.createCollectScenic(collectScenic);
			if (rows > 0) {
				return "OK";
			} else {
				return "FAIL";
			}
		}
		
	}

	/**
	 * 未登录跳转
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/alxCheck.action")
	public String alxCheck(Model model) {
		model.addAttribute("msg", "亲，请先登录！！！");
		return "../ailvxing/alx_login";
	}
}
