package com.ttms.core.web.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.Date;
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

import com.ttms.common.utils.Page;
import com.ttms.core.po.AlxSSR;
import com.ttms.core.po.AlxScenic;
import com.ttms.core.po.AlxVisit;
import com.ttms.core.po.ReserveScenic;
import com.ttms.core.service.AlxScenicService;
/**
 * 爱旅行个人中心
 * @author 徐向东
 *
 */
@Controller
@RequestMapping("/ttms")
public class ScenicController {

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
		return "scenic_list";
	}

	// id查询景点详情
	@RequestMapping("/getScenicById.action")
	@ResponseBody
	public AlxScenic getScenicById(Integer scenic_id, HttpSession session) {
		AlxScenic alxScenic = scenicService.getScenicById(scenic_id);
		session.setAttribute("AlxScenic_SESSION", alxScenic);
		return alxScenic;
	}

	/**
	 * 添加景点
	 */
	@RequestMapping(value = "/createScenic.action", method = RequestMethod.POST)
	@ResponseBody
	public String alxScenicCreate(AlxScenic alxScenic, @RequestParam("addname") String addname,
			@RequestParam("uploadfile") MultipartFile uploadfile, HttpServletRequest request) throws Exception {
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
		// 设置文件名到数据库
		alxScenic.setScenic_img(newFilename);

		// 1 创建Date对象
		Date date = new Date();
		// 2 得到timestamp格式时间，存入sql的时间格式为yy/MM/dd HH:mm:SS
		Timestamp timestamp = new Timestamp(date.getTime());
		alxScenic.setScenic_startDate(timestamp);

		// 3 执行Service层中的创建方法，返回受影响的行数
		int rows = scenicService.createScenic(alxScenic);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 删除景点
	 */
	@RequestMapping(value = "/deleteScenic.action")
	@ResponseBody
	public String deleteScenic(Integer scenic_id) {
		int rows = scenicService.deleteScenic(scenic_id);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	// 执行保存修改
	@RequestMapping("/updateScenic.action")
	@ResponseBody
	public String alxScenicUpdate(AlxScenic alxScenic) {
		int rows = scenicService.updateScenic(alxScenic);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 查询用户已预定景点
	 */
	@RequestMapping("/showAllAlxUserReserveScenicList.action")
	public String showAllAlxUserReserveScenicList(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer rows, Model model) {
		// 查询所有景点
		Page<ReserveScenic> reserveScenics = scenicService.findAllAlxUserReserveScenicList(page, rows);
		// 向模型中传递数据
		model.addAttribute("page", reserveScenics);
		return "alxuser_scenic_list";
	}
	/**
	 * 删除用户已预定景点
	 */
	@RequestMapping(value = "/deleteAlxUserReserveScenic.action")
	@ResponseBody
	public String deleteAlxUserReserveScenic(Integer reserve_sid) {
		int rows = scenicService.deleteAlxUserReserveScenic(reserve_sid);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	/**
	 * 处理用户已预定景点
	 */
	@RequestMapping(value = "/handleAlxUserReserveScenic.action")
	@ResponseBody
	public String handleAlxUserReserveScenic(Integer reserve_sid) {
		int rows = scenicService.updateAlxUserReserveScenic(reserve_sid);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	
	/**
	 * ttms爱旅行用户景点预订量统计
	 */
	@RequestMapping("/statistics_ScenicReserve.action")
	@ResponseBody
	public List<AlxSSR> statistics_ScenicReserve(HttpSession session) {
		List<AlxSSR> getScenicReserve = scenicService.getScenicReserve();
	    return getScenicReserve;
	}
	
	/**
	 * ttms爱旅行用户景点收藏量统计
	 */
	@RequestMapping("/statistics_ScenicCollect.action")
	@ResponseBody
	public List<AlxSSR> statistics_ScenicCollect(HttpSession session) {
		List<AlxSSR> getScenicCollect = scenicService.getScenicCollect();
		return getScenicCollect;
	}
	/**
	 * ttms爱旅行用户比例统计
	 */
	@RequestMapping("/statistics_AlxUser.action")
	@ResponseBody
	public List<AlxSSR> statistics_AlxUser(HttpSession session) {
		List<AlxSSR> getScenicAlxUser = scenicService.getScenicAlxUser();
		return getScenicAlxUser;
	}
	/**
	 * ttms爱旅行用户访问量统计
	 */
	@RequestMapping("/statistics_alxUserVisit.action")
	@ResponseBody
	public List<AlxVisit> statistics_alxUserVisit(HttpSession session) {
		List<AlxVisit> getAlxUserVisit = scenicService.getAlxUserVisit();
		return getAlxUserVisit;
	}
}
