package com.guanglumedia.task;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guanglumedia.cms.order.service.VodOrderService;

public class OrderTask {
	
	protected Logger logger = Logger.getLogger("OrderTask");
	
	@Autowired
	public VodOrderService vodOrderService;
	
	/**
	 * 同步订单到中心端
	 */
	public void orderSync(){
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			logger.info("正在同步");
			int result = vodOrderService.orderSync();
			if(result != 0){
				if(result == -3){
					logger.info("没有需要同步的订单");
				}else{
					logger.info("同步订单出错：错误码【"+result+"】");
				}
			}else{
				logger.info("同步成功");
			}
		} catch (Exception e) {
			logger.error("同步订单出错：系统错误",e);
		}
	}
	
}
