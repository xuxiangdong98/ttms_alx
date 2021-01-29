package com.ttms.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ttms.core.dao.HeroDao;
import com.ttms.core.po.Hero;
import com.ttms.core.po.PageCounter;
import com.ttms.core.service.HeroService;

@Service("HeroService")
@Transactional
public class HeroServiceImpl implements HeroService {

	@Autowired
	private HeroDao heroDao;
	
	@Override
	public List<Hero> findHeroList() {
		List<Hero> heros = heroDao.selectHeroList();
		return heros;
	}
	// id查询英雄详情
	@Override
	public Hero getHeroById(Integer champion_id) {
		Hero hero = heroDao.getHeroById(champion_id);
		return hero;
	}
	// 创建英雄
	@Override
	public int createHero(Hero hero) {
		return heroDao.createHero(hero);
	}
	@Override
	public PageCounter findPageToday(Integer id) {
		return heroDao.findPageToday(id);
	}
	@Override
	public int updatePageCounter(Integer id, PageCounter pageCounter) {
		return heroDao.updatePageCounter(id, pageCounter);
	}
}
