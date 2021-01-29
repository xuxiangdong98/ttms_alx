package com.ttms.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ttms.core.po.User;

/**
 * 用户Dao接口层
 *
 */
public interface UserDao {

	/**
	 * 用户登录的方法
	 */
	public User findUser(@Param("username") String username, @Param("password") String password);

	// 根据用户名查询用户
	public List<User> selectUserList(User user);

	// 分页，查询用户数
	public Integer selectUserListCount(User user);

	// 根据用户id删除用户
	public int deleteUser(Integer id);

	// 修改用户，通过id查询用户
	public User getUserById(Integer id);

	// 修改用户,执行保存修改
	public int updateUser(User user);
}
