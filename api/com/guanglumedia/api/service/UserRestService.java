package com.guanglumedia.api.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.api.dao.UserRestDao;
import com.guanglumedia.api.utils.FormatPageBeanUtils;
import com.guanglumedia.cms.common.PagedModelList;

@Service
public class UserRestService {
	@Autowired
	private UserRestDao dao;

	@Transactional
	public int addScore(JSONObject jsonObject) {
		return dao.addScore(jsonObject);
	}

	public Map<String, Object> selectUserOrder(JSONObject jsonObject) throws ParseException {
		int pageNo = jsonObject.getInt("pageNo");
		int pageRow = jsonObject.getInt("pageRow");
		List<Map<String, Object>> list = dao.selectUserOrder(jsonObject,
				new RowBounds((pageNo - 1) * pageRow, pageRow));
		for (Map<String, Object> map : list) {
			String expiredate = (String) map.get("expiredate");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date endDate = sdf.parse(expiredate);
			Date now = new Date();
			if (endDate.after(now)) {
				map.put("endtime", "有效期至" + expiredate);
			} else {
				map.put("endtime", "已过期");
			}
		}
		int count = dao.findUserOrderCount(jsonObject);
		PagedModelList<Map<String, Object>> pml = new PagedModelList<Map<String, Object>>(pageNo, pageRow, count);
		pml.addModels(list);
		return FormatPageBeanUtils.format(pml);
	}

	public int addPraise(JSONObject jsonObject) {
		return dao.addPraise(jsonObject);
	}

	// uploadUserAccessData
	public int uploadUserAccessData(JSONObject jsonObject) {
		return dao.uploadUserAccessData(jsonObject);
	}
	// uploadUserAccessData

	// //uploadMoviePlayData
	public int uploadMoviePlayData(JSONObject jsonObject) {
		return dao.uploadMoviePlayData(jsonObject);
	}
	
	public int isVip(JSONObject jsonObject) {
		return dao.isVip(jsonObject);
	}
}
