package com.guanglumedia.api.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.api.dao.CardRestDao;
import com.guanglumedia.api.utils.RandomUtil;
import com.guanglumedia.cms.card.entity.Card;
import com.guanglumedia.cms.order.dao.VodOrderDao;
import com.guanglumedia.cms.order.entity.EpgVodOrder;

import net.sf.json.JSONObject;

@Service
public class CardRestService {
	
	@Autowired
	private CardRestDao dao;
	@Autowired
	private VodOrderDao vodOrderDao;
	@Autowired
	private OrderRestService orderRestService;

	/**
	 * 批量插入电子劵
	 * @param evcns
	 * @return
	 */
	public int insertEvcnByList(List<Map<String, Object>> evcns) {
		return dao.insertEvcnByList(evcns);
	}

	/**
	 * 使用电子劵支付
	 * @param info
	 * @return
	 * @throws ParseException 
	 */
	@Transactional
	public int usecode(JSONObject info) throws ParseException {
		int flag = 0;
		
		String evcnid=info.getString("evcnid");
		String userid=info.getString("userid");
		String orderId=info.getString("orderId");
		String movieid=info.getString("movieid");
		String moviename=info.getString("moviename");
		String price=info.getString("price");
		String movietype=info.getString("movietype");
		
		//验证电子劵是否有效
		if(verifycode(evcnid)){
			
			//1.修改电子劵状态和信息
			Card card = new Card();
			card.setEvcnId(Long.parseLong(evcnid));
			card.setProgrameId(movieid);
			card.setEvcnProgrameNames(moviename);
			card.setUserId(userid);
			card.setOperateStatus(3);//修改状态
			
			if(dao.updateCardStatus(card) > 0){
				//2.添加订单
				if("".equals(orderId.trim()) || orderId==null || "null".equals(orderId.trim())){//如果订单ID为空的话，本地创建订单号
					orderId = "11" + new SimpleDateFormat("yyMMddHH").format(new Date()) + RandomUtil.getRandomNumberString(6);//生成订单号
				}
				EpgVodOrder vodOrder = new EpgVodOrder();
				vodOrder.setId(orderId);
				vodOrder.setUserid(userid);
				vodOrder.setMovieid(movieid);
				vodOrder.setMoviename(moviename);
				vodOrder.setMovietype(movietype);
				vodOrder.setPrice(price);
				vodOrder.setStatus("1");
				vodOrder.setPaymenttype("1");
				vodOrder.setEvcnid(evcnid);
				if(vodOrderDao.addVodOrder(vodOrder) > 0){
					//3.添加鉴权信息
					info.put("paytime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
					if(orderRestService.addOrder(info)){
						flag = 1;
					}
				}
			}
		}
		return flag;
	}

	/**
	 * 验证
	 * @param evcnid
	 * @return
	 */
	public boolean verifycode(String evcnid) {
		return dao.verifycode(Integer.parseInt(evcnid))>0;
	}

}
