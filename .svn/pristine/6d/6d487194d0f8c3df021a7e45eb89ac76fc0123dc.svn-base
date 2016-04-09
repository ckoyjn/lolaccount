package com.guanglumedia.cms.analysis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.analysis.entity.AccessCategory;
@Repository
public abstract interface AnalysisDao {

	public abstract List<AccessCategory> findAllAccessCategoryList(AccessCategory accesscategory);

	public abstract List<AccessCategory> findAccessDate(AccessCategory accesscategory, RowBounds rowBounds);

	public abstract int findCount(AccessCategory accesscategory);

	public abstract List<AccessCategory> getRegGraphData(AccessCategory accesscategory);

	public abstract List<AccessCategory> getRegGraphDataDist(AccessCategory accesscategory);

    public abstract List<Map<String, Object>> exportAccessCategoryList(AccessCategory accesscategory);

	public abstract AccessCategory findNewUserAccessCategory(AccessCategory accesscategory);

	public abstract AccessCategory findAllUserAccessCategory(AccessCategory accesscategory);

	public abstract AccessCategory findUseUserAccessCategory(AccessCategory accesscategory);

	public abstract AccessCategory findDemandUserAccessCategory(AccessCategory accesscategory);

	
}
