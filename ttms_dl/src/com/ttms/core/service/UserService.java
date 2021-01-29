package com.ttms.core.service;

import com.ttms.common.utils.Page;
import com.ttms.core.po.User;

/**
 * 用户Service接口层
 *
 */
public interface UserService {

	/**
	 * 用户登录的方法
	 */
	public User findUser(String username, String password);

	// 查询用户列表
	public Page<User> findUserList(Integer page, Integer rows, String username);

	// 根据用户id删除用户
	public int deleteUser(Integer id);

	// 修改用户,通过id查询用户信息
	public User getUserById(Integer id);

	// 修改用户,执行保存修改
	public int updateUser(User user);
}
