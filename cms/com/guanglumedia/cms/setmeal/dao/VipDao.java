package com.guanglumedia.cms.setmeal.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.setmeal.entity.Vip;

@Repository
public interface VipDao {

	public List<Vip> findVipList(Vip vip, RowBounds rowBounds);

	public int findCount(Vip vip);

}
