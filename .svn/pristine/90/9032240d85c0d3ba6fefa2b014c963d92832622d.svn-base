package com.guanglumedia.cms.setmeal.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.setmeal.dao.SetmealDao;
import com.guanglumedia.cms.setmeal.entity.Setmeal;

@Service
public class SetmealService {

	@Autowired
	public SetmealDao setmealDao;
	
	public PagedModelList<Setmeal> findSetmealList(Setmeal setmeal, int pageNo, int pageRow) {
		List<Setmeal> setmeals = setmealDao.findSetmealList(setmeal,new RowBounds((pageNo-1)*pageRow, pageRow));
		int totalCount = setmealDao.findCount(setmeal);
		PagedModelList<Setmeal> pml = new PagedModelList<Setmeal>(pageNo, pageRow, totalCount);
		pml.addModels(setmeals);
		return pml;
	}

	public Setmeal findSetmealById(int id) {
		return setmealDao.findSetmealById(id);
	}

	public int delSetmeal(int id) {
		return setmealDao.delSetmeal(id);
	}

	public int addSetmeal(Setmeal setmeal) {
		return setmealDao.addSetmeal(setmeal);
	}

	public int updateSetmeal(Setmeal setmeal) {
		return setmealDao.updateSetmeal(setmeal);
	}

	public int findRank(int sort, int id) {
		return setmealDao.findRank(sort, id);
	}

}
