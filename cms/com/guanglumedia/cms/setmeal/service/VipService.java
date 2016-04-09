package com.guanglumedia.cms.setmeal.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.setmeal.dao.VipDao;
import com.guanglumedia.cms.setmeal.entity.Vip;

@Service
public class VipService {
	
	@Autowired
	public VipDao vipDao;

	public PagedModelList<Vip> findVipList(Vip vip, int pageNo, int pageRow) {
		List<Vip> vips = vipDao.findVipList(vip,new RowBounds((pageNo-1)*pageRow, pageRow));
		int totalCount = vipDao.findCount(vip);
		PagedModelList<Vip> pml = new PagedModelList<Vip>(pageNo, pageRow, totalCount);
		pml.addModels(vips);
		return pml;
	}

}
