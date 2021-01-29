package com.ttms.core.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ttms.common.utils.Page;
import com.ttms.core.po.Team;
import com.ttms.core.service.TeamService;

/**
 * 团目管理控制器类
 *
 */
@Controller
@RequestMapping("/ttms")
public class TeamController {
	@Autowired
	private TeamService teamService;

	/**
	 * 	团目列表
	 */
	@RequestMapping("/team_list.action")
	public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows,
			String name,Integer projectId,Integer valid,Model model) {
		// 根据项目名条件查询所有项目
				Page<Team> teams = teamService.findTeamList(page, rows, projectId, valid, name);
				// 向模型中传递数据
				model.addAttribute("page", teams);// 查询到的项目集合用page集合表示，jsp中再通过page.rows取出每一项
				model.addAttribute("Name", name);// 回显查询项目名的关键字
				return "team_list";
	}
	
	/**
	 * 删除团目
	 */
	@RequestMapping(value = "/team_list/delete.action")
	@ResponseBody
	public String teamDelete(Integer id) {
		int rows = teamService.deleteTeam(id);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	
	/**
	 * 批量删除团目
	 */
	@RequestMapping(value="/team_list/deleteTeamCheck.action",method=RequestMethod.POST)
	@ResponseBody
	public String deleteTeamCheck(String ids,Model model){
		String[] d=ids.split(",");//把数组里的值逗号隔开
		int rows = teamService.deleteTeamChecked(d);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	/**
	 * 	禁用团目
	 */
	@RequestMapping(value="/team_list/updateTeamStateNo.action",method=RequestMethod.POST)
	@ResponseBody
	public String updateTeamStateNo(String ids,Model model) {
		String[] d=ids.split(",");//把数组里的值逗号隔开
		int rows = teamService.updateTeamStateNo(d);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	/**
	 * 	启用团目
	 */
	@RequestMapping(value="/team_list/updateTeamStateOk.action",method=RequestMethod.POST)
	@ResponseBody
	public String updateTeamStateOk(String ids,Model model) {
		String[] d=ids.split(",");//把数组里的值逗号隔开
		int rows = teamService.updateTeamStateOk(d);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
}
