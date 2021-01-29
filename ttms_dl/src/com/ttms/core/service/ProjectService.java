package com.ttms.core.service;

import com.ttms.common.utils.Page;
import com.ttms.core.po.Project;
/**
 *	查询项目Service层
 */
public interface ProjectService {

	// 查询项目列表
	public Page<Project> findProjectList(Integer page,Integer rows,String name);
	// 根据项目id删除项目
	public int deleteProject(Integer id);
	// 创建项目
	public int createProject(Project project);
	// 修改项目,通过id查询项目信息
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
