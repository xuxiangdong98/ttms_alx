package com.ttms.core.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ttms.common.utils.Page;
import com.ttms.core.dao.ProjectDao;
import com.ttms.core.po.Project;
import com.ttms.core.service.ProjectService;
/**
 *	查询项目Service实现类层
 */
@Service("projectService")
@Transactional
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDao projectDao;

	//项目列表
	@Override
	public Page<Project> findProjectList(Integer page, Integer rows, String name) {
		//创建项目对象
		Project project = new Project();
		//判断项目名是否为空
		if(StringUtils.isNotBlank(name)) {
			project.setName(name);
		}
		//设置当前页
		project.setStart((page-1)*rows);
		//每页数
		project.setRows(rows);
		//查询项目列表
		List<Project> projects = projectDao.selectProjectList(project);
		//查询项目列表总记录数
		Integer count = projectDao.selectProjectListCount(project);
		//创建page返回对象
		Page<Project> result = new Page<Project>();
		result.setPage(page);//当前页
		result.setRows(projects);//列表
		result.setSize(rows);//一行多少 
		result.setTotal(count);//总记录数
		//Page的result封装了分页查询的所有所需对象数据
		return result;
	}
	// 根据项目id删除项目
	@Override
	public int deleteProject(Integer id) {
		return projectDao.deleteProject(id);
	}
	// 创建项目
	@Override
	public int createProject(Project project) {
		return projectDao.createProject(project);
	}
	// 修改项目，通过id查询项目
	@Override
	public Project getProjectById(Integer id) {
		Project project = projectDao.getProjectById(id);
		return project;
	}
	// 修改项目,执行保存修改
	@Override
	public int updateProject(Project project) {
		return projectDao.updateProject(project);
	}
	// 批量删除项目
	@Override
	public int deleteChecked(String[] ids) {
		return projectDao.deleteChecked(ids);
	}
	// 批量禁用项目
	@Override
	public int updateStateNo(String[] ids) {
		return projectDao.updateStateNo(ids);
	}
	// 批量启用项目
	@Override
	public int updateStateOk(String[] ids) {
		return projectDao.updateStateOk(ids);
	}


}
