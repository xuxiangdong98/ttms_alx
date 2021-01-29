package com.ttms.core.dao;

import java.util.List;

import com.ttms.core.po.Project;
/**
 * 	查询项目Dao层
 *
 */
public interface ProjectDao {
	//根据项目名查询项目
	public List<Project> selectProjectList(Project project);
	//分页，查询客户数
	public Integer selectProjectListCount(Project project);
	// 根据项目id删除项目	
	public int deleteProject(Integer id);
	// 创建项目
	public int createProject(Project project);
	// 修改项目，通过id查询项目
	public Project getProjectById(Integer id);
	// 修改项目,执行保存修改
	public int updateProject(Project project);
	// 批量删除项目
	public int deleteChecked(String[] ids);
	// 批量禁用项目
	public int updateStateNo(String[] ids);
	// 批量启用项目
	public int updateStateOk(String[] ids);
}
