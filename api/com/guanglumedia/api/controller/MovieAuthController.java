package com.guanglumedia.api.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.service.MovieRestService;
import com.guanglumedia.api.utils.ControllerUtils;
import com.guanglumedia.cms.movie.entity.Movie;
import com.guanglumedia.cms.movie.service.MovieService;
import com.guanglumedia.rest.BaseController;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("movieauth")
public class MovieAuthController extends BaseController {
    @Autowired
    private MovieRestService movieRestService;
    @Autowired
    private MovieService movieService;
    
    
    @RequestMapping("auth")
    @ResponseBody
    public Map<String, Object> auth(HttpServletRequest request) throws Exception{
    	logger.info("auth-------");
    	Map<String, Object> response = new HashMap<String, Object>();
    	ResourceBundle rb = ResourceBundle.getBundle("epg",Locale.getDefault());
    	JSONObject jsonObject=ControllerUtils.getJSONObj(request);
		if(null != jsonObject.get("mediaId")){
			jsonObject.put("pid", jsonObject.getString("mediaId"));
		}
		if(null != jsonObject.get("userId")){
			jsonObject.put("smartcardid", jsonObject.getString("userId"));
		}
    	try{
			if(movieRestService.auth(jsonObject)){
				response.put("result", 0);
				if(!StringUtils.isEmpty(rb.getString("playUrl"))){
					String playUrl = (String) rb.getString("playUrl");
					int mediaId = jsonObject.getInt("mediaId");
					Movie movie = movieService.getMovieById(mediaId);
					if(movie == null){
						throw new Exception("根据mediaId["+mediaId+"]查询不到影片");
					}
					if(movie.getMediaID() == null){
						throw new Exception("根据mediaId["+mediaId+"]查询不到媒资ID");
					}
					String userId = jsonObject.getString("userId");
					playUrl += "&mediaId="+movie.getMediaID()+"&userId="+userId;
					logger.info("鉴权请求通过，userId="+userId+",movieId="+mediaId+",playUrl="+playUrl);
					response.put("playUrl", playUrl);
				}else{
					throw new Exception("playUrl is null");
				}
				
			}else{
				logger.info("鉴权不通过，userId="+jsonObject.getString("userId")+",movieId="+jsonObject.getString("mediaId"));
				response.put("result", -1);
				response.put("msg", "鉴权不通过" );
			}
    	}catch(Exception e){
    		logger.error(e.getMessage(),e);
    		return makeFailedResponse(e.getMessage(), response);
    	}
        return makeSuccessResponse(response);
    }
    
}
