package com.guanglumedia.cms.setmeal.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.setmeal.dao.SetmealOrderDao;
import com.guanglumedia.cms.setmeal.entity.SetmealOrder;

@Service
public class SetmealOrderService {
	
	@Autowired
	public SetmealOrderDao setmealOrderDao;

	public PagedModelList<SetmealOrder> findSetmealOrderList(SetmealOrder setMealOrder, int pageNo, int pageRow) {
		List<SetmealOrder> setmealOrders = setmealOrderDao.findSetmealOrderList(setMealOrder,new RowBounds((pageNo-1)*pageRow, pageRow));
		int totalCount = setmealOrderDao.findCount(setMealOrder);
		PagedModelList<SetmealOrder> pml = new PagedModelList<SetmealOrder>(pageNo, pageRow, totalCount);
		pml.addModels(setmealOrders);
		return pml;
	}

	public SetmealOrder findSetmealOrderById(int id) {
		return setmealOrderDao.findSetmealOrderById(id);
	}

}
