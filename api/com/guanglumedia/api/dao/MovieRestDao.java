package com.guanglumedia.api.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.guanglumedia.api.entity.MovieNotSync;

import net.sf.json.JSONObject;

@Repository
public interface MovieRestDao {
    public JSONObject getMovieDetail(JSONObject object);

	public List<Map<String, Object>> getPreviews();
	
	public int getAuth(JSONObject object);
	
	public List<Map<String, Object>> getList();
	
	public List<MovieNotSync> findNotSyncMovie();
	
	public int deleteById(int id);
}
