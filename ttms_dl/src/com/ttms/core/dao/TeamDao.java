package com.ttms.core.dao;

import java.util.List;

import com.ttms.core.po.Team;

/**
 * 团目管理Dao层
 *
 */
public interface TeamDao {
	// 根据团目名或所属项目查询团目列表
	public List<Team> selectTeamList(Team team);

	// 分页，查询团目数
	public Integer selectTeamListCount(Team team);

	// 根据团目id删除团目
	public int deleteTeam(Integer id);

	// 批量删除团目
	public int deleteTeamChecked(String[] ids);

	// 批量禁用团目
	public int updateTeamStateNo(String[] ids);

	// 批量启用团目
	public int updateTeamStateOk(String[] ids);
}
