package com.ttms.core.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ttms.common.utils.Page;
import com.ttms.core.dao.AlxScenicDao;
import com.ttms.core.po.AlxSSR;
import com.ttms.core.po.AlxScenic;
import com.ttms.core.po.AlxVisit;
import com.ttms.core.po.CollectScenic;
import com.ttms.core.po.ReserveScenic;
import com.ttms.core.service.AlxScenicService;

/**
 * 查询景点Service实现类层
 */
@Service("alxScenicService")
@Transactional
public class AlxScenicServiceImpl implements AlxScenicService {

	/**
	 * 注入爱旅行景点预订Dao对象
	 */
	@Autowired
	private AlxScenicDao scenicDao;

	@Override
	public Page<AlxScenic> findAlxScenicList(Integer page, Integer rows, String scenic_name) {
		// 创建项目对象
		AlxScenic alxScenic = new AlxScenic();
		// 判断项目名是否为空
		if (StringUtils.isNotBlank(scenic_name)) {
			alxScenic.setScenic_name(scenic_name);
		}
		// 设置当前页
		alxScenic.setStart((page-1)*rows);
		// 每页数
		alxScenic.setRows(rows);
		// 查询项目列表
		List<AlxScenic> alxScenics = scenicDao.findAlxScenicList(alxScenic);
		// 查询项目列表总记录数
		Integer count = scenicDao.selectAlxScenicListCount(alxScenic);
		// 创建page返回对象
		Page<AlxScenic> result = new Page<AlxScenic>();
		result.setPage(page);// 当前页
		result.setRows(alxScenics);// 列表
		result.setSize(rows);// 一行多少
		result.setTotal(count);// 总记录数
		// Page的result封装了分页查询的所有所需对象数据
		return result;
	}

	// id查询景点详情
	@Override
	public AlxScenic getScenicById(Integer scenic_id) {
		AlxScenic alxScenic = scenicDao.getScenicById(scenic_id);
		return alxScenic;
	}

	// 景点立即预订，向景区预定订单中添加
	@Override
	public int createReserveScenic(ReserveScenic reserveScenic) {
		return scenicDao.createReserveScenic(reserveScenic);
	}

	// 判断是否已经存在景点
	@Override
	public ReserveScenic findReserveScenicByscenic_id(ReserveScenic reserveScenic) {
		return scenicDao.findReserveScenicByscenic_id(reserveScenic);
	}

	// 添加ttms景点
	@Override
	public int createScenic(AlxScenic alxScenic) {
		return scenicDao.createScenic(alxScenic);
	}

	// 删除ttms景点
	@Override
	public int deleteScenic(Integer id) {
		return scenicDao.deleteScenic(id);
	}

	// 执行ttms修改景点
	@Override
	public int updateScenic(AlxScenic alxScenic) {
		return scenicDao.updateScenic(alxScenic);
	}

	// 查询ttms全部爱旅行user景点预订列表
	@Override
	public Page<ReserveScenic> findAllAlxUserReserveScenicList(Integer page, Integer rows) {
		// 创建景点预订对象
		ReserveScenic reserveScenic = new ReserveScenic();
		// 设置当前页
		reserveScenic.setStart((page - 1) * rows);
		// 每页数
		reserveScenic.setRows(rows);
		// 查询景点预订列表
		List<ReserveScenic> reserveScenics = scenicDao.selectAllAlxUserReserveScenicList(reserveScenic);
		// 查询景点预订列表总记录数
		Integer count = scenicDao.selectAllAlxUserReserveScenicListCount(reserveScenic);
		// 创建page返回对象
		Page<ReserveScenic> result = new Page<ReserveScenic>();
		result.setPage(page);// 当前页
		result.setRows(reserveScenics);// 列表
		result.setSize(rows);// 一行多少
		result.setTotal(count);// 总记录数
		// Page的result封装了分页查询的所有所需对象数据
		return result;
	}
	//删除ttms用户已预定景点
	@Override
	public int deleteAlxUserReserveScenic(Integer reserve_sid) {
		return scenicDao.deleteAlxUserReserveScenic(reserve_sid);
	}
	//处理ttms用户已预定景点
	@Override
	public int updateAlxUserReserveScenic(Integer reserve_sid) {
		return scenicDao.updateAlxUserReserveScenic(reserve_sid);
	}
	//查询热门景点
	@Override
	public AlxScenic findHotScenic() {
		return scenicDao.findHotScenic();
	}
	//通过景点id查询是否已经收藏过该景点
	@Override
	public CollectScenic findCollectScenicByscenic_id(CollectScenic collectScenic) {
		return scenicDao.findCollectScenicByscenic_id(collectScenic);
	}
	// 景点收藏，向景点收藏订单中添加
	@Override
	public int createCollectScenic(CollectScenic collectScenic) {
		return scenicDao.createCollectScenic(collectScenic);
	}
	
	//ttms爱旅行用户景点预订统计
	@Override
	public List<AlxSSR> getScenicReserve() {
		return scenicDao.getScenicReserve();
	}
	//ttms爱旅行用户景点收藏量统计
	@Override
	public List<AlxSSR> getScenicCollect() {
		return scenicDao.getScenicCollect();
	}
	//ttms爱旅行用户比例统计
	@Override
	public List<AlxSSR> getScenicAlxUser() {
		return scenicDao.getScenicAlxUser();
	}
	//ttms爱旅行用户访问量统计
	@Override
	public List<AlxVisit> getAlxUserVisit() {
		return scenicDao.getAlxUserVisit();
	}
	//通过预订状态检测该预订是否处理
	@Override
	public ReserveScenic findResValidByscenic_id(ReserveScenic reserveScenic) {
		return scenicDao.findResValidByscenic_id(reserveScenic);
	}

}
