package com.guanglumedia.cms.setmeal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.setmeal.entity.Setmeal;

@Repository
public interface SetmealDao {

	public List<Setmeal> findSetmealList(Setmeal setmeal, RowBounds rowBounds);

	public int findCount(Setmeal setmeal);

	public int addSetmeal(Setmeal setmeal);

	public Setmeal findSetmealById(int id);

	public int delSetmeal(int id);

	public int updateSetmeal(Setmeal setmeal);

	public int findRank(@Param("sort")int sort, @Param("id")int id);

}
