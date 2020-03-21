package com.board.board.common.util;

import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class JSONUtils {

	/***
	 * Map안에 담겨있는 리스트 가져오는 메소드
	 * 예 )  {"list":[{"name":"쇼핑","c_idx":3},{"name":"교육","c_idx":1},{"name":"건강","c_idx":2}],"respcode":0}
	 * 
	 * @param jsonString
	 * @param listName 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<Map<String,Object>> jsonStringToList ( String jsonString, String listName ) {
		Gson gson = new Gson();
		Map<String,Object> jsonMap = gson.fromJson(jsonString, new TypeToken<Map<String, Object>>() {}.getType() );
		return (List<Map<String, Object>>) jsonMap.get(listName);
	}
	
	/***
	 * json String을 Map<String,Object>으로 변환 하는 메소드
	 * @param jsonString
	 * @return
	 */
	public static Map<String,Object> jsonStringToMap ( String jsonString ) {
		Gson gson = new Gson();
		Map<String,Object> retMap = gson.fromJson(jsonString, new TypeToken<Map<String, Object>>() {}.getType() );
		return retMap;
	}
	
	/***
	 * json String을 List<Map<String,Object>>으로 변환 하는 메소드
	 * @param jsonString
	 * @return
	 */
	public static List<Map<String,Object>> jsonStringToListMap ( String jsonString ) {
		Gson gson = new Gson();
		List<Map<String,Object>> retList = gson.fromJson(jsonString, new TypeToken<List<Map<String, Object>>>() {}.getType() );
		return retList;
	}
	
}
