package com.ttms.core.service;

import com.ttms.common.utils.Page;
import com.ttms.core.po.Team;

/**
 * 团目信息Service层接口
 */
public interface TeamService {

	// 查询团目列表
	public Page<Team> findTeamList(Integer page, Integer rows, Integer projectId, Integer valid, String name);

	// 根据团目id删除团目
	public int deleteTeam(Integer id);

	// 批量删除团目
	public int deleteTeamChecked(String[] ids);

	// 批量禁用团目
	public int updateTeamStateNo(String[] ids);

	// 批量启用团目
	public int updateTeamStateOk(String[] ids);
}
