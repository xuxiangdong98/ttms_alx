package com.ttms.core.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ttms.common.utils.Page;
import com.ttms.core.dao.TeamDao;
import com.ttms.core.po.Team;
import com.ttms.core.service.TeamService;

/**
 * 团目Service层实现类
 *
 */
@Service("teamService")
@Transactional
public class TeamServiceImpl implements TeamService {
	@Autowired
	private TeamDao teamDao;

	// 查询团目列表
	@Override
	public Page<Team> findTeamList(Integer page, Integer rows, Integer projectId, Integer valid, String name) {
		// 创建团目对象
		System.out.println("-----------------");
		System.out.println("projectId=" + projectId);
		System.out.println("valid=" + valid);
		Team team = new Team();
		// 判断团目名是否为空
		if (StringUtils.isNotBlank(name)) {
			team.setName(name);
		}
		// 设置当前页
		team.setStart((page - 1) * rows);
		// 每页数
		team.setRows(rows);
		// 查询团目列表
		List<Team> teams = teamDao.selectTeamList(team);
		// 查询团目列表总记录数
		Integer count = teamDao.selectTeamListCount(team);
		Page<Team> result = new Page<Team>();
		result.setPage(page);
		result.setRows(teams);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	// 根据团目id删除团目
	@Override
	public int deleteTeam(Integer id) {
		return teamDao.deleteTeam(id);
	}

	// 批量删除团目
	@Override
	public int deleteTeamChecked(String[] ids) {
		return teamDao.deleteTeamChecked(ids);
	}

	// 批量禁用团目
	@Override
	public int updateTeamStateNo(String[] ids) {
		return teamDao.updateTeamStateNo(ids);
	}

	// 批量启用团目
	@Override
	public int updateTeamStateOk(String[] ids) {
		return teamDao.updateTeamStateOk(ids);
	}

}
