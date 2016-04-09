package com.guanglumedia.api.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.service.OrderRestService;
import com.guanglumedia.api.utils.ControllerUtils;
import com.guanglumedia.api.utils.QRCodeUtil;
import com.guanglumedia.rest.BaseController;

@Controller
@RequestMapping("order")
public class OrderController extends BaseController {
    @Autowired
    private OrderRestService service;

    @RequestMapping("add")
    @ResponseBody
    public Map<String, Object> addOrder(HttpServletRequest request){
    	logger.info("addOrder---------");
    	Map<String, Object> response = new HashMap<String, Object>();
    	try{
    		String userid = request.getParameter("userid");
    		String movieid = request.getParameter("movieid");
    		String moviename = request.getParameter("moviename");
    		String movietype = request.getParameter("movietype");
    		String paytime = request.getParameter("paytime");
    		String expiretime = request.getParameter("expiretime");

    		JSONObject jsonObject= new JSONObject();
    		jsonObject.put("userid", userid);
    		jsonObject.put("movieid", movieid);
    		jsonObject.put("moviename", moviename);
    		jsonObject.put("movietype", Integer.parseInt(movietype));
    		jsonObject.put("paytime", paytime);
    		jsonObject.put("expiretime", expiretime);
    		if(!service.addOrder(jsonObject)){
    			logger.error("新增订单出错"+jsonObject.toString());
    			return makeFailedResponse("新增订单出错", response);
    		}
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
    }
    
    @RequestMapping("getcode")
    @ResponseBody
    public Map<String, Object> getcode(HttpServletRequest request){
    	logger.info("getcode------");
    	Map<String, Object> response = new HashMap<String, Object>();
    	try{
    		JSONObject jsonObject=ControllerUtils.getJSONObj(request);
    		logger.info("请求二维码："+jsonObject.toString());
    		response = service.getcode(jsonObject);
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return response;
    }
    
    //getmealcode
    @RequestMapping("getmealcode")
    @ResponseBody
    public Map<String, Object> getMealCode(HttpServletRequest request){
    	logger.info("getMealCode---------");
    	Map<String, Object> response = new HashMap<String, Object>();
    	try{
    		JSONObject jsonObject=ControllerUtils.getJSONObj(request);
    		logger.info("获取套餐二维码："+jsonObject.toString());
    		response = service.getMealCode(jsonObject);
    	} catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return response;
    }
    
    //getmealcode
    
    //
    @RequestMapping("getmeallist")
    @ResponseBody
    public void getMealList(HttpServletRequest request, HttpServletResponse response){
    	logger.info("getMealList---------");
    	JSONObject resp = new JSONObject();
    	PrintWriter out = null;
    	try{
    		resp.put("list", service.getMealList());
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
    
    
    
    @RequestMapping("verifycode")
    @ResponseBody
    public Map<String, Object> verifycode(HttpServletRequest request){
    	Map<String, Object> response = new HashMap<String, Object>();
    	try{
    		JSONObject jsonObject=ControllerUtils.getJSONObj(request);
    		logger.info("电子劵支付："+jsonObject.toString());
    		int result = service.verifycode(jsonObject);
    		response.put("result", result);
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
    }
    
    @RequestMapping("getwxqrcode")
    @ResponseBody
    public void getwxqrcode(HttpServletRequest request, HttpServletResponse response){
    	ByteArrayInputStream input = null;
		BufferedOutputStream output = null;
		try {	
			String src = request.getParameter("src");
			int bufLen = 102400;
			byte[] tmp = new byte[bufLen];
			byte[] buff = QRCodeUtil.makeCode(src, 500, 500, null);
			input = new ByteArrayInputStream(buff);
			output = new BufferedOutputStream(response.getOutputStream());	
			int len;
			while((len = input.read(tmp, 0, bufLen)) > 0){
				output.write(tmp, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try{
				if(input != null){
					input.close();
				}
				if(output != null){
					output.close();
				}
			}catch(IOException e){
				
			}
		}
    }
    
    @RequestMapping("getaliqrcode")
    @ResponseBody
    public void getaliqrcode(HttpServletRequest request, HttpServletResponse response){
    	BufferedInputStream input = null;
		BufferedOutputStream output = null;
        try {
	        //String url= URLDecoder.decode(request.getParameter("src"),"GB2312");    
        	String url= request.getParameter("src");
        	URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 建立实际的连接
			connection.connect();
			input = new BufferedInputStream(connection.getInputStream());
			output = new BufferedOutputStream(response.getOutputStream());	
			
			int bufLen = 102400;
			byte[] buff = new byte[bufLen];
			int len;
			while((len = input.read(buff, 0, bufLen)) > 0){
				output.write(buff, 0, len);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try{
				if(input != null){
					input.close();
				}
				if(output != null){
					output.close();
				}
			}catch(IOException e){
				
			}
		}
    }
}
