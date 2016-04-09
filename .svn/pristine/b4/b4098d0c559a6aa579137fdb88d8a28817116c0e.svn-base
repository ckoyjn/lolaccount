package com.guanglumedia.cms.order.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.order.entity.EpgVodOrder;

@Repository
public interface VodOrderDao {

	public int addVodOrder(EpgVodOrder vodOrder);

	public List<EpgVodOrder> findNotSyncOrder();

	public int batchUpdateSync(List<EpgVodOrder> list);

}
