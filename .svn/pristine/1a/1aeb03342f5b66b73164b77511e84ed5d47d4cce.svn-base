package com.guanglumedia.api.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.service.MovieRestService;
import com.guanglumedia.api.utils.ControllerUtils;
import com.guanglumedia.rest.BaseController;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("movie")
public class MovieController extends BaseController {
	Logger log = LoggerFactory.getLogger(MovieController.class);
    @Autowired
    private MovieRestService service;

    @RequestMapping("detail")
    @ResponseBody
    public void detail(HttpServletRequest request,HttpServletResponse response){
    	log.info("detail---------");
    	JSONObject resp = new JSONObject();
    	PrintWriter out = null;
    	try{
    		JSONObject jsonObject=ControllerUtils.getJSONObj(request);
    		resp = service.getMovieDetail(jsonObject); 
    		resp.put("errCode", 0);
    		resp.put("msg", "请求成功");
    		response.setCharacterEncoding("UTF-8"); //设置编码格式  
    		response.setContentType("application/json");   //设置数据格式 
    		out = response.getWriter(); //获取写入对象
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		resp.put("errCode", -1);
    		resp.put("msg", "系统错误");
    	}finally{
    		out.print(resp.toString()); //将json数据写入流中  
    		out.flush();  
    	}
    }
    
    @RequestMapping("preview")
    @ResponseBody
    public void preview(HttpServletRequest request, HttpServletResponse response){
    	log.info("preview---------");
    	JSONObject resp = new JSONObject();
    	PrintWriter out = null;
    	try{
    		JSONObject jsonObject=ControllerUtils.getJSONObj(request);
    		String smartcardid = jsonObject.getString("smartcardid");
    		resp.put("list", service.getPreviews(smartcardid));
    		resp.put("errCode", 0);
    		resp.put("msg", "请求成功");
    		response.setCharacterEncoding("UTF-8"); //设置编码格式  
    		response.setContentType("application/json");   //设置数据格式 
    		out = response.getWriter(); //获取写入对象
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		resp.put("errCode", -1);
    		resp.put("msg", "系统错误");
    	}finally{
    		out.print(resp.toString()); //将json数据写入流中  
    		out.flush();  
    	}
    }
    
    //
    @RequestMapping("list")
    @ResponseBody
    public void list(HttpServletRequest request, HttpServletResponse response){
    	log.info("list---------");
    	JSONObject resp = new JSONObject();
    	PrintWriter out = null;
    	try{
    		resp.put("list", service.getList());
    		resp.put("errCode", 0);
    		resp.put("msg", "请求成功");
    		response.setCharacterEncoding("UTF-8"); //设置编码格式  
    		response.setContentType("application/json");   //设置数据格式 
    		out = response.getWriter(); //获取写入对象
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		resp.put("errCode", -1);
    		resp.put("msg", "系统错误");
    	}finally{
    		out.print(resp.toString()); //将json数据写入流中  
    		out.flush();  
    	}
    }
    //
    
	@RequestMapping("sameCategory")
	@ResponseBody
	public Map<String,Object> sameCategory(HttpServletRequest request){
		log.info("sameCategory---------");
		Map<String,Object> response =new HashMap<String,Object>();
		try {
			JSONObject jsonObject=ControllerUtils.getJSONObj(request);
			int num =jsonObject.getInt("num");
			response.put("list", service.getRandomMovieByCategoryId(jsonObject,num));
		} catch (Exception e) {
			logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
		}
		return makeSuccessResponse(response);
	}
	
	@RequestMapping("auth")
	@ResponseBody
	public Map<String,Object> auth(HttpServletRequest request){
		log.info("auth---------");
		Map<String,Object> response =new HashMap<String,Object>();
		try {
			JSONObject jsonObject=ControllerUtils.getJSONObj(request);
			if(service.auth(jsonObject)){
				response.put("result", 1);
			}else{
				response.put("result", 0);
			}
		} catch (Exception e) {
			logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
		}
		return makeSuccessResponse(response);
	}
}