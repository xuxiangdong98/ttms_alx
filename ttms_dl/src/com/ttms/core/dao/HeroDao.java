package com.ttms.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ttms.core.po.Hero;
import com.ttms.core.po.PageCounter;
/**
 * 英雄Dao接口层
 *
 */
public interface HeroDao {

	// 查询英雄列表
	public List<Hero> selectHeroList();
	// id查询英雄详情
	public Hero getHeroById(Integer champion_id);
	// 创建英雄
	public int createHero(Hero hero);
	
	public int updatePageCounter(@Param("id")Integer id,@Param("pageCounter")PageCounter pageCounter);
	
	public PageCounter findPageToday(@Param("id")Integer id);

}
