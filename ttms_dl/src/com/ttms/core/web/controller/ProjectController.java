package com.ttms.core.web.controller;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.common.utils.Page;
import com.ttms.core.po.Project;
import com.ttms.core.po.User;
import com.ttms.core.service.ProjectService;

/**
 * 项目管理控制器类层
 */
@Controller
@RequestMapping("/ttms")
public class ProjectController {

	@Autowired
	private ProjectService projectService;

	/**
	 * 项目列表
	 */
	@RequestMapping(value = "/project_list.action")
	public String project_list(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer rows, String name, Model model) {
		// 根据项目名条件查询所有项目
		Page<Project> projects = projectService.findProjectList(page, rows, name);
		// 向模型中传递数据
		model.addAttribute("page", projects);// 查询到的项目集合用page集合表示，jsp中再通过page.rows取出每一项
		model.addAttribute("Name", name);// 回显查询项目名的关键字
		return "project_list";
	}

	/**
	 * 删除项目
	 */
	@RequestMapping(value = "/project_list/delete.action")
	@ResponseBody
	public String projectDelete(Integer id) {
		int rows = projectService.deleteProject(id);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 创建项目
	 */
	@RequestMapping(value = "/project_list/create.action")
	@ResponseBody
	public String projectCreate(Project project, HttpSession session) {
		// 获取Session中的当前用户信息
		User user = (User) session.getAttribute("USER_SESSION");
		// 将当前用户id存储在客户对象中
		project.setProject_create_id(user.getId());
		// 3 创建Date对象
		Date date = new Date();
		// 4 得到timestamp格式时间，存入sql的时间格式为yy/MM/dd HH:mm:SS
		Timestamp timestamp = new Timestamp(date.getTime());
		project.setCreatedTime(timestamp);
		// 5 执行Service层中的创建方法，返回受影响的行数
		int rows = projectService.createProject(project);
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
	@RequestMapping("/project_list/getProjectById.action")
	@ResponseBody
	public Project getProjectById(Integer id,HttpSession session) {
		Project project = projectService.getProjectById(id);
		session.setAttribute("PROJECT_SESSION", project);
		return project;
	}

	// 执行保存修改
	@RequestMapping("/project_list/update.action")
	@ResponseBody
	public String projectUpdate(Project project) {
		int rows = projectService.updateProject(project);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 批量删除
	 */
	@RequestMapping(value="project_list/deleteCheck.action",method=RequestMethod.POST)
	@ResponseBody
	public String deleteCheck(String ids,Model model){
		String[] d=ids.split(",");//把数组里的值逗号隔开
		int rows = projectService.deleteChecked(d);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	/**
	 * 	禁用项目
	 */
	@RequestMapping(value="project_list/updateStateNo.action",method=RequestMethod.POST)
	@ResponseBody
	public String updateStateNo(String ids,Model model) {
		String[] d=ids.split(",");//把数组里的值逗号隔开
		int rows = projectService.updateStateNo(d);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	/**
	 * 	启用项目
	 */
	@RequestMapping(value="project_list/updateStateOk.action",method=RequestMethod.POST)
	@ResponseBody
	public String updateStateOk(String ids,Model model) {
		String[] d=ids.split(",");//把数组里的值逗号隔开
		int rows = projectService.updateStateOk(d);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

}
