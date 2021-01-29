package com.ttms.core.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ttms.common.utils.Page;
import com.ttms.core.dao.AlxUserDao;
import com.ttms.core.po.AlxScenic;
import com.ttms.core.po.AlxUser;
import com.ttms.core.service.AlxUserService;

@Service("alxuserService")
@Transactional
public class AlxUserServiceImpl implements AlxUserService {

	/**
	 * 注入爱旅行Dao对象
	 */
	@Autowired
	private AlxUserDao alxUserDao;

	/**
	 * 爱旅行用户登录
	 */
	@Override
	public AlxUser findAlxUser(String alx_uname, String alx_upassword) {
		return alxUserDao.findAlxUser(alx_uname, alx_upassword);
	}

	/**
	 * 爱旅行用户注册用户名异步判断是否存在
	 */
	@Override
	public AlxUser findUname(String alx_uname) {
		System.out.println("alx_uname:" + alx_uname);
		return alxUserDao.findUname(alx_uname);
	}

	/**
	 * 爱旅行用户注册用户名异步判断是否存在
	 */
	@Override
	public int insertAlxUser(String alx_uname, String alx_upassword) {
		return alxUserDao.insertAlxUser(alx_uname, alx_upassword);
	}

	/**
	 * 已预定景点
	 */
	/*
	 * @Override public Page<ReserveScenic> findMyScenicList(Integer page, Integer
	 * rows, String scenic_name, Integer alx_uid) { // 创建用户对象 ReserveScenic
	 * reserveScenic = new ReserveScenic(); // 设置当前页 reserveScenic.setStart((page -
	 * 1) * rows); // 每页数 reserveScenic.setRows(rows); // 查询用户列表 List<ReserveScenic>
	 * reserveScenics = alxUserDao.selectMyScenicList(reserveScenic); // 查询用户列表总记录数
	 * Integer count = alxUserDao.selectMyScenicListCount(reserveScenic); //
	 * 创建page返回对象 Page<ReserveScenic> result = new Page<ReserveScenic>();
	 * result.setPage(page);// 当前页 result.setRows(reserveScenics);// 列表
	 * result.setSize(rows);// 一行多少 result.setTotal(count);// 总记录数 //
	 * Page的result封装了分页查询的所有所需对象数据 return result; }
	 */
	@Override
	public List<AlxScenic> findMyScenicList(Integer alx_uid) {
		return alxUserDao.findMyScenicList(alx_uid);
	}

	// 通过id查景点
	@Override
	public AlxScenic getScenicById(Integer scenic_id) {
		AlxScenic alxScenic = alxUserDao.getScenicById(scenic_id);
		return alxScenic;
	}

	// 添加了分页查询
	@Override
	public Page<AlxScenic> findMyScenicList(Integer page, Integer rows, Integer alx_uid) {

		AlxScenic alxScenic = new AlxScenic();
		// 设置当前页
		alxScenic.setStart((page - 1) * rows);
		// 每页显示数量
		alxScenic.setRows(rows);
		// 查询已预定列表
		List<AlxScenic> alxScenics = alxUserDao.findMyScenicList((page - 1) * rows, rows, alx_uid);
		// 查询已预定列表的总记录数
		Integer count = alxUserDao.findMyScenicListCount(alx_uid);
		// 创建page返回对象
		Page<AlxScenic> result = new Page<AlxScenic>();
		result.setPage(page);// 当前页
		result.setRows(alxScenics);// 列表
		result.setSize(rows);// 一行显示多少数据
		result.setTotal(count);// 总记录数
		return result;
	}

	// 取消预定
	@Override
	public int deleteScenicById(Integer reserve_sid) {
		return alxUserDao.deleteScenicById(reserve_sid);
	}

	// 已收藏景点列表
	@Override
	public Page<AlxScenic> findMyCollectScenicList(Integer page, Integer rows, Integer alx_uid) {
		AlxScenic alxScenic = new AlxScenic();
		// 设置当前页
		alxScenic.setStart((page - 1) * rows);
		// 每页显示数量
		alxScenic.setRows(rows);
		// 查询已收藏列表
		List<AlxScenic> alxScenics = alxUserDao.findMyCollectScenicList((page - 1) * rows, rows, alx_uid);
		// 查询已收藏列表的总记录数
		Integer count = alxUserDao.findMyCollectScenicListCount(alx_uid);
		// 创建page返回对象
		Page<AlxScenic> result = new Page<AlxScenic>();
		result.setPage(page);// 当前页
		result.setRows(alxScenics);// 列表
		result.setSize(rows);// 一行显示多少数据
		result.setTotal(count);// 总记录数
		return result;
	}

	// 用户取消收藏
	@Override
	public int deleteCollectScenicById(Integer collect_cid) {
		return alxUserDao.deleteCollectScenicById(collect_cid);
	}

	/**
	 * ttms爱旅行用户管理
	 */
	// ttms查询爱旅行用户列表
	@Override
	public Page<AlxUser> findAlxUserList(Integer page, Integer rows, String alx_uname) {
		// 创建爱旅行用户对象
		AlxUser alxUser = new AlxUser();
		// 判断爱旅行用户名是否为空
		if (StringUtils.isNotBlank(alx_uname)) {
			alxUser.setAlx_uname(alx_uname);
		}
		// 设置当前页
		alxUser.setStart((page - 1) * rows);
		// 每页数
		alxUser.setRows(rows);
		// 查询爱旅行用户列表
		List<AlxUser> alxUsers = alxUserDao.selectAlxUserList(alxUser);
		// 查询爱旅行用户列表总记录数
		Integer count = alxUserDao.selectAlxUserListCount(alxUser);
		// 创建page返回对象
		Page<AlxUser> result = new Page<AlxUser>();
		result.setPage(page);// 当前页
		result.setRows(alxUsers);// 列表
		result.setSize(rows);// 一行多少
		result.setTotal(count);// 总记录数
		// Page的result封装了分页查询的所有所需对象数据
		return result;
	}
	//ttms删除爱旅行用户
	@Override
	public int deleteAlxUser(Integer alx_uid) {
		return alxUserDao.deleteAlxUser(alx_uid);
	}
	//ttms创建爱旅行用户
	@Override
	public int createAlxUser(AlxUser alxUser) {
		return alxUserDao.createAlxUser(alxUser);
	}
	//ttms修改爱旅行用户，通过用户id获取用户信息
	@Override
	public AlxUser getAlxUserById(Integer alx_uid) {
		return alxUserDao.getAlxUserById(alx_uid);
	}
	//ttms执行保存修改
	@Override
	public int updateAlxUser(AlxUser alxUser) {
		return alxUserDao.updateAlxUser(alxUser);
	}
	//ttms爱旅行用户批量删除
	@Override
	public int deleteChecked(String[] d) {
		return alxUserDao.deleteChecked(d);
	}
	//ttms爱旅行用户批量禁用
	@Override
	public int updateStateNo(String[] d) {
		return alxUserDao.updateStateNo(d);
	}
	//ttms爱旅行用户批量启用
	@Override
	public int updateStateOk(String[] d) {
		return alxUserDao.updateStateOk(d);
	}
	//ttms爱旅行用户总记录
	@Override
	public Integer getAllAlxUserCount() {
		return alxUserDao.getAllAlxUserCount();
	}
}
