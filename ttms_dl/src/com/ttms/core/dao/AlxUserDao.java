package com.ttms.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ttms.core.po.AlxScenic;
import com.ttms.core.po.AlxUser;

/**
 * 爱旅行用户Dao接口层
 *
 */
public interface AlxUserDao {
	/**
	 * 爱旅行用户登录
	 */
	public AlxUser findAlxUser(@Param("alx_uname")String alx_uname, @Param("alx_upassword")String alx_upassword);
	/**
	 * 爱旅行用户注册用户名异步判断是否存在
	 */
	public AlxUser findUname(@Param("alx_uname")String alx_uname);
	/**
	 * 爱旅行用户注册用户名异步判断是否存在
	 */
	public int insertAlxUser(@Param("alx_uname")String alx_uname, @Param("alx_upassword")String alx_upassword);
	/**
	 * 已预定景点
	 */
	/*
	 * public Integer selectMyScenicListCount(ReserveScenic reserveScenic); public
	 * List<ReserveScenic> selectMyScenicList(ReserveScenic reserveScenic);
	 */
	public List<AlxScenic> findMyScenicList(Integer alx_uid);
	//通过id查景点
	public AlxScenic getScenicById(Integer scenic_id);
	//查询已预定景点总记录数
	public Integer findMyScenicListCount(Integer alx_uid);
	public List<AlxScenic> findMyScenicList(@Param("start")Integer start, @Param("rows")Integer rows, @Param("alx_uid")Integer alx_uid);
	//取消预订
	public int deleteScenicById(Integer reserve_sid);
	/**
	 * 已收藏景点
	 */
	//查询已收藏列表
	public List<AlxScenic> findMyCollectScenicList(@Param("start")Integer start, @Param("rows")Integer rows, @Param("alx_uid")Integer alx_uid);
	//查询已收藏列表的总记录数
	public Integer findMyCollectScenicListCount(Integer alx_uid);
	//用户取消收藏
	public int deleteCollectScenicById(Integer collect_cid);
	
	/**
	 * ttms爱旅行用户管理
	 */
	// ttms查询爱旅行用户列表
	public List<AlxUser> selectAlxUserList(AlxUser alxUser);
	// ttms查询爱旅行用户列表总记录数
	public Integer selectAlxUserListCount(AlxUser alxUser);
	
	// ttms删除爱旅行用户
	public int deleteAlxUser(Integer alx_uid);
	// ttms创建爱旅行用户
	public int createAlxUser(AlxUser alxUser);
	// ttms修改爱旅行用户，通过用户id获取用户信息
	public AlxUser getAlxUserById(Integer alx_uid);
	// ttms执行保存修改
	public int updateAlxUser(AlxUser alxUser);
	//ttms爱旅行用户批量删除
	public int deleteChecked(String[] d);
	//ttms爱旅行用户批量禁用
	public int updateStateNo(String[] d);
	//ttms爱旅行用户批量启用
	public int updateStateOk(String[] d);
	//ttms爱旅行用户总记录
	public Integer getAllAlxUserCount();
	
	
}
