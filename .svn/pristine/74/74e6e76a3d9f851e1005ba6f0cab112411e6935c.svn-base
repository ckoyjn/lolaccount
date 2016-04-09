package com.guanglumedia.api.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.api.dao.CategoryRestDao;
import com.guanglumedia.api.dao.MovieRestDao;
import com.guanglumedia.api.entity.MovieNotSync;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class MovieRestService {
	Logger log = LoggerFactory.getLogger(MovieRestService.class);
	@Autowired
	private MovieRestDao dao;

	@Autowired
	private CategoryRestDao categoryRestDao;

	@Transactional
	public JSONObject getMovieDetail(JSONObject object) {

		JSONObject obj = dao.getMovieDetail(object);
		/* 用户鉴权 */
		if (auth(object)) {
			obj.put("isAuthed", 1);
		} else {
			obj.put("isAuthed", 0);
		}

		// 成都使用userId不是卡号，而是机顶盒的一个标识。EPG页面在cookie中获取该值
		/* 播放地址 */
		String playUrl = makePlayUrl(obj.getString("mediaid"), "", 0);
		obj.put("playUrl", playUrl);

		/* 预告片播放地址 */
		if (!"".equals(obj.getString("preview"))) {
			String ygpUrl = makePlayUrl(obj.getString("preview"), "", 1);
			obj.put("preview", ygpUrl);
		}
		return obj;
	}

	private String makePlayUrl(String mediaid, String userid, int type) {
		ResourceBundle rb = ResourceBundle.getBundle("epg", Locale.getDefault());
		String url = null;
		if (type == 0) {
			url = rb.getString("playUrl");
		} else {
			url = rb.getString("ygpUrl");
		}

		url = url + "&mainPmId=" + mediaid + "&userId=" + userid;
		return url;
	}

	public boolean auth(JSONObject obj) {
		return dao.getAuth(obj) > 0;
	}

	public List<Map<String, Object>> getPreviews(String smartcardid) {

		List<Map<String, Object>> list = dao.getPreviews();
		for (Map<String, Object> map : list) {
			/* 预告片播放地址 */
			String ygpUrl = makePlayUrl((String) map.get("mediaid"), "", 1);
			map.put("playUrl", ygpUrl);
		}
		return list;
	}

	public List<Map<String, Object>> getList() {
		log.info("getList-----------");
		List<Map<String, Object>> list = dao.getList();
		ResourceBundle rb = ResourceBundle.getBundle("epg", Locale.getDefault());
		String identifyurl = rb.getString("identifyurl");
		String bannerimg = rb.getString("banner");
		String thimg = rb.getString("thimg");
		String vimg = rb.getString("vimg");
		String imgtype = rb.getString("imgtype");
		for (Map<String, Object> map : list) {
			if (null != map) {
				map.put("posterImg", identifyurl + map.get("Identify") + bannerimg + imgtype);
				map.put("thImg", identifyurl + map.get("Identify") + thimg + imgtype);
				map.put("vImg", identifyurl + map.get("Identify") + vimg + imgtype);
				map.remove("Identify");
			}
		}
		return list;
	}

	//addlist
	public int addlist() throws ClientProtocolException, IOException{
		log.info("addlist-----------");
		ResourceBundle rb = ResourceBundle.getBundle("epg", Locale.getDefault());
		String address = rb.getString("movieSyncAddress");
		String ret = null;
		//查询没有同步的影片
		List<MovieNotSync> movies = dao.findNotSyncMovie();
		if(movies.size() > 0){
			JSONArray json = JSONArray.fromObject(movies);
			log.info("json------" + json);
			//请求同步信息
			CloseableHttpClient client = HttpClients.createDefault();
			HttpPost httppost = new HttpPost(address);
			List<NameValuePair> formparams = new ArrayList<NameValuePair>();
			formparams.add(new BasicNameValuePair("info",json.toString()));
			UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
			httppost.setEntity(entity);
			HttpResponse httpresponse = client.execute(httppost);
			
			//请求返回信息
			if(httpresponse.getStatusLine().getStatusCode()==200){
				HttpEntity httpEntity = httpresponse.getEntity();
				if (httpEntity != null) {
					ret = EntityUtils.toString(httpEntity);
					log.info("-----:" + JSONObject.fromObject(ret));
					JSONObject obj = JSONObject.fromObject(ret);
					//若errCode等于0,那么执行批量修改影片状态
					if(obj.getInt("errCode")==0){
						//若接收方接收影片成功，那么删除在movienotsync(没有同步的表里的记录)
						for(MovieNotSync mns:movies){
							int result = dao.deleteById(mns.getId());
							if(result>0){
								return 0;//成功标记
							}else{
								return -4;//修改同步状态失败
							}
						}
					}
				}
				client.close();
			} else {
				return -1;//通信出错
			}
			return -2;//返回参数为空
		} 
		return -3;//没有需要同步的影片
	}
	//addlist

	@Transactional
	public List<Map<String, Object>> getRandomMovieByCategoryId(JSONObject jsonObject, int num) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		// 同类型的影片集合
		List<Map<String, Object>> mlist = categoryRestDao.getRandomMovieByCategoryId(jsonObject);
		int size = num;
		if (num > mlist.size()) {
			size = mlist.size();
		}
		for (int i = 0; i < size; i++) {
			list.add(mlist.get(i));
		}
		return list;
	}
}
