package com.guanglumedia.cms.order.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.cms.order.dao.VodOrderDao;
import com.guanglumedia.cms.order.entity.EpgVodOrder;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class VodOrderService {
	
	@Autowired
	public VodOrderDao vodOrderDao;
	private Logger logger = Logger.getLogger(VodOrderService.class);
	
	
	public int orderSync() throws ClientProtocolException, IOException{
		ResourceBundle rb = ResourceBundle.getBundle("epg", Locale.getDefault());
		String address = rb.getString("orderSync");
		String ret = null;
		
		//查找未同步已支付的订单
		List<EpgVodOrder> orders = vodOrderDao.findNotSyncOrder();
		
		if(orders.size() > 0){
			JSONArray json = JSONArray.fromObject(orders);
			logger.info("CDVOD:"+json.toString());
			
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
					logger.info(JSONObject.fromObject(ret));
					JSONObject obj = JSONObject.fromObject(ret);
					if(obj.getInt("errCode")==0){
						int result = vodOrderDao.batchUpdateSync(orders);
						if(result>0){
							return 0;//成功标记
						}else{
							return -4;//修改同步状态失败
						}
					}
				}
				client.close();
			} else {
				return -1;//通信出错
			}
			return -2;//返回参数为空
		}
		return -3;//没有需要同步的订单
	}


}
