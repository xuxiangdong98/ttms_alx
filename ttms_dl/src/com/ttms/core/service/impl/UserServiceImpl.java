package com.ttms.core.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ttms.common.utils.Page;
import com.ttms.core.dao.UserDao;
import com.ttms.core.po.User;
import com.ttms.core.service.UserService;

/**
 * 用户Service层实现类
 *
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	// 注入Dao对象
	@Autowired
	private UserDao userDao;

	/**
	 * 用户登录的方法
	 */
	public User findUser(String username, String password) {
		User user = this.userDao.findUser(username, password);
		return user;
	}

	// 用户列表
	@Override
	public Page<User> findUserList(Integer page, Integer rows, String username) {
		// 创建用户对象
		User user = new User();
		// 判断用户名是否为空
		if (StringUtils.isNotBlank(username)) {
			user.setUsername(username);
		}
		// 设置当前页
		user.setStart((page - 1) * rows);
		// 每页数
		user.setRows(rows);
		// 查询用户列表
		List<User> users = userDao.selectUserList(user);
		// 查询用户列表总记录数
		Integer count = userDao.selectUserListCount(user);
		// 创建page返回对象
		Page<User> result = new Page<User>();
		result.setPage(page);// 当前页
		result.setRows(users);// 列表
		result.setSize(rows);// 一行多少
		result.setTotal(count);// 总记录数
		// Page的result封装了分页查询的所有所需对象数据
		return result;
	}

	// 根据用户id删除用户
	@Override
	public int deleteUser(Integer id) {
		return userDao.deleteUser(id);
	}
	// 修改用户,通过id查询用户信息
	@Override
	public User getUserById(Integer id) {
		User user = userDao.getUserById(id);
		return user;
	}
	// 修改项目,执行保存修改
	@Override
	public int updateUser(User user) {
		return userDao.updateUser(user);
	}
}
