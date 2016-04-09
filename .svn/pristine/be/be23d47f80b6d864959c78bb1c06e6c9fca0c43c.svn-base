package com.guanglumedia.cms.setmeal.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.setmeal.entity.SetmealOrder;

@Repository
public interface SetmealOrderDao {

	public List<SetmealOrder> findSetmealOrderList(SetmealOrder setMealOrder, RowBounds rowBounds);

	public int findCount(SetmealOrder setMealOrder);

	public SetmealOrder findSetmealOrderById(int id);

}
