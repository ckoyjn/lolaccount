package com.guanglumedia.api.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.service.CardRestService;
import com.guanglumedia.api.utils.ControllerUtils;
import com.guanglumedia.cms.card.entity.Card;
import com.guanglumedia.rest.BaseController;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("card")
public class CardRestController extends BaseController {
	
	@Autowired
	private CardRestService service;
	
	/**
	 * 接收中心端下发的电子劵
	 * @param request
	 * @return
	 */
	@RequestMapping("addCard")
	@ResponseBody
	public Map<String, Object> addCard(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			logger.info("接收电子劵开始");
			//接收中心端的数据
			Map<String,Object> map = request.getParameterMap();
			String str = ((String[])map.get("info"))[0];
			JSONArray jsonarray = JSONArray.fromObject(str); 
			
			List<Map<String,Object>> result = (List<Map<String, Object>>) JSONArray.toCollection(jsonarray, HashMap.class);
			List<Map<String,Object>> evcns = new ArrayList<Map<String,Object>>();
			for (Map<String, Object> evcn : result) {
				Map<String,Object> obj = new HashMap<String, Object>();
				Set<String> keys =  evcn.keySet();
				for (String string : keys) {
					obj.put(string, evcn.get(string));
				}
				evcns.add(obj);
			}
			//保存电子劵到本地
			if(service.insertEvcnByList(evcns)>0)
				logger.info("接收电子劵结束");
		} catch (Exception e) {
			logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
		}
		return makeSuccessResponse(response);
	}
	
	
	/**
	 * 电子劵支付
	 * @return
	 */
	@RequestMapping("verifycode")
	@ResponseBody
	public Map<String, Object> verifycode(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			JSONObject jsonObject=ControllerUtils.getJSONObj(request);
			logger.info("电子劵支付："+jsonObject.toString());
			int result = service.usecode(jsonObject);
			response.put("result", result);
		} catch (Exception e) {
			logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
		}
		return makeSuccessResponse(response);
	}
}
