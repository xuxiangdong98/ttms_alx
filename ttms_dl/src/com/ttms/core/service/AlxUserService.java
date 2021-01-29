package com.ttms.core.service;

import java.util.List;

import com.ttms.common.utils.Page;
import com.ttms.core.po.AlxScenic;
import com.ttms.core.po.AlxUser;

/**
 * 爱旅行用户Service接口层
 *
 */
public interface AlxUserService {

	/**
	 * 爱旅行用户登录
	 */
	public AlxUser findAlxUser(String alx_uname, String alx_upassword);
	/**
	 * 爱旅行用户注册用户名异步判断是否存在
	 */
	public AlxUser findUname(String alx_uname);
	/**
	 * 爱旅行用户注册用户名异步判断是否存在
	 */
	public int insertAlxUser(String alx_uname, String alx_upassword);
	 //已预定景点
	public List<AlxScenic> findMyScenicList(Integer alx_uid);
	//通过id查景点
	public AlxScenic getScenicById(Integer scenic_id);
	/**
	 * 已预定景点
	 */
	//添加了分页查询
	public Page<AlxScenic> findMyScenicList(Integer page, Integer rows, Integer alx_uid);
	//取消预订
	public int deleteScenicById(Integer reserve_sid);
	/**
	 * 已收藏景点列表
	 */
	public Page<AlxScenic> findMyCollectScenicList(Integer page, Integer rows, Integer alx_uid);
	//用户取消收藏
	public int deleteCollectScenicById(Integer collect_cid);
	
	/**
	 * ttms爱旅行用户管理
	 */
	//ttms查询爱旅行用户列表
	public Page<AlxUser> findAlxUserList(Integer page, Integer rows, String alx_uname);
	//ttms删除爱旅行用户
	public int deleteAlxUser(Integer alx_uid);
	//ttms创建爱旅行用户
	public int createAlxUser(AlxUser alxUser);
	//ttms修改爱旅行用户，通过用户id获取用户信息
	public AlxUser getAlxUserById(Integer alx_uid);
	//ttms执行保存修改
	public int updateAlxUser(AlxUser alxUser);
	
	//ttms爱旅行用户批量删除
	public int deleteChecked(String[] d);
	//ttms爱旅行用户禁用
	public int updateStateNo(String[] d);
	//ttms爱旅行用户启用
	public int updateStateOk(String[] d);
	//ttms爱旅行用户总记录
	public Integer getAllAlxUserCount();
}
