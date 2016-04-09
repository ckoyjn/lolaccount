package com.guanglumedia.api.service;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import net.sf.json.JSONObject;

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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.api.dao.OrderRestDao;
import com.guanglumedia.api.entity.EpgEvcn;
import com.guanglumedia.api.utils.DateUtil;

@Service
public class OrderRestService {
    @Autowired
    private OrderRestDao dao;
    
    
    @Transactional
    public boolean addOrder(JSONObject object) throws ParseException
    {
    	String paytime = object.getString("paytime");
    	int movietype = object.getInt("movietype");
    	Date date = DateUtil.formatDate(paytime, "yyyy-MM-dd HH:mm:ss");
    	int ret = 0;
    	if(movietype==0){
    		Date expiredate = DateUtil.addDay(date, 2);
    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    		String expiretime = sdf.format(expiredate);
    		object.put("expiretime", expiretime);
    		return dao.addOrder(object)>0;
    	}else if(movietype==1){
    		int sid = object.getInt("movieid");
    		String movieIDs = dao.getMovieIds(sid);
    		String arrays[] = movieIDs.split(",");
    		Date expiredate = DateUtil.addDay(date, 7);
    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    		String expiretime = sdf.format(expiredate);
    		object.put("expiretime", expiretime);
    		ret = dao.addSubjectOrder(object);
    		for (String pid : arrays) {
    			object.put("movieid", pid);
    			dao.addOrder(object);
			}
    		return ret>0;
    	}else{
    		dao.addOrder(object);
    		return ret>0;
    	}
    	
    }

	public int verifycode(JSONObject jsonObject) throws ClientProtocolException, IOException {
		ResourceBundle rb = ResourceBundle.getBundle("epg", Locale.getDefault());
		String address = rb.getString("verifycode");
		String evcnid=jsonObject.getString("evcnid");
		String orderId=jsonObject.getString("orderId");
		String ret = null;
		String info = "{\"paycode\":\""+evcnid+"\", \"orderId\":\""+orderId+"\"}";

		CloseableHttpClient client = HttpClients.createDefault();
		HttpPost httppost = new HttpPost(address);
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		formparams.add(new BasicNameValuePair("info",info));
		UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
		httppost.setEntity(entity);
		HttpResponse httpresponse = client.execute(httppost);
		if(httpresponse.getStatusLine().getStatusCode()==200){
			HttpEntity httpEntity = httpresponse.getEntity();
			
			if (httpEntity != null) {
				ret = EntityUtils.toString(httpEntity);
			}
			JSONObject obj = JSONObject.fromObject(ret);
			client.close();
			if(obj.getInt("errCode")==0){
				return 1;
			}else{
				return 0;
			}
			
		}else{
			return 0;
		}
	}

	public int verifycodeR(JSONObject jsonObject) {
		String evcnid=jsonObject.getString("evcnid");
		String smartcardid=jsonObject.getString("smartcardid");
		double price = jsonObject.getDouble("price");
		
		EpgEvcn evcn = dao.getEvcn(evcnid);
		if(evcn==null){
			/*电子券不存在*/
			return -5;
		}
		if(!smartcardid.equals(evcn.getUserid())){
			/*卡号与电子券号不对应无法退回*/
			return -1;
		}
		
		if(!"1".equals(evcn.getEvcnOrderStatus())){
			/*电子券未充入，无法退回*/
			return -2;
		}
		
		if("1".equals(evcn.getOperateStatus())){
			/*电子券已使用，无法退回*/
			return -3;
		}
		
		
		/*调用boss充值撤回接口*/
		int errCode=0;
		String msg="";
		if(errCode!=0){
			/*boss充值撤回失败*/
			return -4;
		}
		
		/*更新电子券状态*/
		Map<String,Object>	map = new HashMap<String,Object>();
		map.put("smartcardid", "");
		map.put("pid", "");
		map.put("evcnOrderStatus", "0");
		map.put("evcnid", jsonObject.get("evcnid"));
		dao.updateEvcn(map);
		
		/*登记boss交互信息*/
		Map<String,Object> bosslog = new HashMap<String, Object>();
		bosslog.put("smartcardid",jsonObject.get("smartcardid"));
		bosslog.put("evcnid",evcnid);
		bosslog.put("amount",price);
		bosslog.put("errcode",errCode);
		bosslog.put("msg",msg);
		bosslog.put("type",1);
		dao.addBossLog(bosslog);
		return 0;
	}

	public boolean addOrderOuter(Map<String, Object> map) {
		map.put("type", 0);
		return dao.addOrderOuter(map)>0;
	}
	
	public boolean addPlayRecord(Map<String, Object> map) {
		return dao.addPlayRecord(map)>0;
	}
	
	public int getProgrameId(String vodid) throws Exception{
	    String [] mediaid =  vodid.split("-");
	    return dao.getProgrameId(mediaid[0]);
	}
	
	public int getPreviewId(String vodid) throws Exception{
	    String [] mediaid =  vodid.split("-");
	    return dao.getPreviewId(mediaid[0]);
	}
	
	public int addwatchrecord(Map<String, Object> map){
	    return dao.addwatchrecord(map);
	}
	
	public List<Map<String, Object>> getMealList(){
		return dao.getMealList();
	}
	
	//getMealCode
	public Map<String, Object> getMealCode(JSONObject jsonObject) throws org.apache.http.ParseException, IOException {
		ResourceBundle rb = ResourceBundle.getBundle("epg", Locale.getDefault());
		String address = rb.getString("getmealcode");
		String ret = null;
		String userid = jsonObject.getString("userid");
		String mealid = jsonObject.getString("mealid");
		String mealname = jsonObject.getString("mealname");
		String month = jsonObject.getString("month");
		String movietype = "2";
		jsonObject.put("movietype", movietype);
		String info = jsonObject.toString();
		CloseableHttpClient client = HttpClients.createDefault();
		HttpPost httppost = new HttpPost(address);
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		formparams.add(new BasicNameValuePair("info",info));
		UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
		httppost.setEntity(entity);
		HttpResponse httpresponse = client.execute(httppost);
		if(httpresponse.getStatusLine().getStatusCode()==200){
			HttpEntity httpEntity = httpresponse.getEntity();
			if (httpEntity != null) {
				ret = EntityUtils.toString(httpEntity);
			}
			client.close();
			return JSONObject.fromObject(ret);
		} else{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("errCode",-4);
			map.put("msg", "通讯错误");
			client.close();
			return null;
		}
	}
	//getMealCode

	@SuppressWarnings("unchecked")
	public Map<String, Object> getcode(JSONObject jsonObject) throws org.apache.http.ParseException, IOException {
		ResourceBundle rb = ResourceBundle.getBundle("epg", Locale.getDefault());
		String address = rb.getString("getcode");
		String ret = null;
		int movietype = jsonObject.getInt("movietype");
		int movieid = jsonObject.getInt("movieid");
		String moviename = jsonObject.getString("moviename");
//		String names = null;
//		if(movietype==1){
//			names = dao.selectSubjectNames(movieid);
//		}else if(movietype==0){
//			names = dao.selectMovieName(movieid);
//		}
		jsonObject.put("moviename", moviename);
		
		String info = jsonObject.toString();

		CloseableHttpClient client = HttpClients.createDefault();
		HttpPost httppost = new HttpPost(address);
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		formparams.add(new BasicNameValuePair("info",info));
		UrlEncodedFormEntity entity = new UrlEncodedFormEntity(formparams, "UTF-8");
		httppost.setEntity(entity);
		HttpResponse httpresponse = client.execute(httppost);
		if(httpresponse.getStatusLine().getStatusCode()==200){
			HttpEntity httpEntity = httpresponse.getEntity();
			if (httpEntity != null) {
				ret = EntityUtils.toString(httpEntity);
			}
			client.close();
			return JSONObject.fromObject(ret);
		}else{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("errCode",-4);
			map.put("msg", "通讯错误");
			client.close();
			return null;
		}
		
		
	}
}
