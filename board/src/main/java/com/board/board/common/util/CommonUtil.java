package com.board.board.common.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

public class CommonUtil {
	
	/**
     * 인자값이 null 인경우 공백을 리턴한다.
     * @param str 입력스트링
     */
    public static String checkNull(String str){
        if(str == null) return "";
        return str;
    }

    /**
     * 인자값이 null 인경우 defaultStr을 리턴한다.
     * @param str 입력스트링
     */
    public static String checkReplaceStr(String str, String defaultStr) {
        if (str == null || str.equals ( "" )) return defaultStr;
        else return str.trim ();
    }

    public static boolean isNull(String str) {
        if (str == null || str.equals("")) return true;
        else return false;
    }
    
    /**
     * 함수명 : toString
     * 설명   : String [] 을 ,(콤마)구분자 String으로 변환
     * @param String[]
     * @return 콤마 구분자 String
     */
    public static String toString(String[] sary) {
        if (sary == null) return "";

        StringBuilder sb = new StringBuilder();
        if ( sary != null ) {
            for ( int i = 0; i < sary.length; ++i ) {
                if ( i > 0 ) sb.append(",");
                sb.append(sary[i]);
            }
        }
        return sb.toString();
    }
    
    public static List<Map<String,Object>> makeFiveList( List<Map<String,Object>> list ) {
    	List<Map<String,Object>> retList = new ArrayList<Map<String,Object>>();
    	int five = 5;
    	if ( ! list.isEmpty() ) {
    		if ( list.size() < 5 ) {
    			five = five - list.size();
    			for ( Map<String,Object> map : list ) {
    				retList.add( map );
    			}
    			for ( int i=0; i<five; i++ ) {
    				Map<String,Object> map = new HashMap<String,Object>();
    				map.put("boardSeq", "0");
    				map.put("title", " ");
    				map.put("createUserName", " ");
    				map.put("createDate", " ");
    				retList.add( map );
    			}
    		}
    		else {
    			for ( int i=0; i<five; i++ ) {
    				Map<String,Object> map = list.get(i);
    				retList.add( map );
    			}
    		}   		
    	}    	
    	else {
    		for ( int i=0; i<five; i++ ) {
    			Map<String,Object> map = new HashMap<String,Object>();
    			map.put("boardSeq", "0");
				map.put("title", " ");
				map.put("createUserName", " ");
				map.put("createDate", " ");
    			retList.add( map );
    		}    		
    	}
    	
    	return retList;
    }
    
    public static double getRendomPoint () {
    	double point = 0.0;
    	point =  ( (int) ( Math.random() * 100) + 1 ) * 100  ;   	
    	return point;    			
    }
}
