package com.ttms.core.service;

import java.util.List;

import com.ttms.core.po.Hero;
import com.ttms.core.po.PageCounter;

/**
 * 英雄Service接口层
 *
 */
public interface HeroService {

	// 查询英雄列表
	public List<Hero> findHeroList();
	// id查询英雄详情
	public Hero getHeroById(Integer champion_id);
	// 创建英雄
	public int createHero(Hero hero);
	// 加一保存
	public int updatePageCounter(Integer id,PageCounter pageCounter);
	// 返回加一后的结果
	public PageCounter findPageToday(Integer id);
}
