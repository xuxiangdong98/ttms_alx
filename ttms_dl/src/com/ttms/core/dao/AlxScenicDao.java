package com.ttms.core.dao;

import java.util.List;

import com.ttms.core.po.AlxSSR;
import com.ttms.core.po.AlxScenic;
import com.ttms.core.po.AlxVisit;
import com.ttms.core.po.CollectScenic;
import com.ttms.core.po.ReserveScenic;

/**
 * 爱旅行景点预订Dao接口层
 *
 */
public interface AlxScenicDao {

	// 根据景点名查询景点
	public List<AlxScenic> findAlxScenicList(AlxScenic alxScenic);

	// 分页，查询景点数
	public Integer selectAlxScenicListCount(AlxScenic alxScenic);
	// id查询景点详情
	public AlxScenic getScenicById(Integer scenic_id);
	// 景点立即预订，向景区预定订单中添加
	public int createReserveScenic(ReserveScenic reserveScenic);
	//查是否存在
	public ReserveScenic findReserveScenicByscenic_id(ReserveScenic reserveScenic);
	//添加ttms景点
	public int createScenic(AlxScenic alxScenic);
	//删除ttms景点
	public int deleteScenic(Integer id);
	//执行修改ttms景点
	public int updateScenic(AlxScenic alxScenic);
	// 查询景点预订列表
	public List<ReserveScenic> selectAllAlxUserReserveScenicList(ReserveScenic reserveScenic);
	// 查询景点预订列表总记录数
	public Integer selectAllAlxUserReserveScenicListCount(ReserveScenic reserveScenic);
	//删除ttms用户已预定景点
	public int deleteAlxUserReserveScenic(Integer reserve_sid);
	//处理ttms用户已预定景点
	public int updateAlxUserReserveScenic(Integer reserve_sid);
	//查询热门景点
	public AlxScenic findHotScenic();
	/**
	 * 	收藏景点
	 */
	//通过景点id查询是否已经收藏过该景点
	public CollectScenic findCollectScenicByscenic_id(CollectScenic collectScenic);
	// 景点收藏，向景点收藏订单中添加
	public int createCollectScenic(CollectScenic collectScenic);
	//ttms爱旅行用户景点预订统计
	public List<AlxSSR> getScenicReserve();
	//ttms爱旅行用户景点收藏量统计
	public List<AlxSSR> getScenicCollect();
	//ttms爱旅行用户比例统计
	public List<AlxSSR> getScenicAlxUser();
	//ttms爱旅行用户访问量统计
	public List<AlxVisit> getAlxUserVisit();
	//通过预订状态检测该预订是否处理
	public ReserveScenic findResValidByscenic_id(ReserveScenic reserveScenic);

}
