package com.guanglumedia.api.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.card.entity.Card;

@Repository
public interface CardRestDao {

	public int insertEvcnByList(List<Map<String, Object>> evcns);

	public int updateCardStatus(Card card);

	public int verifycode(int evcnid);

}
