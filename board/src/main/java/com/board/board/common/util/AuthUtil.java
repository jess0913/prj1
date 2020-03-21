package com.board.board.common.util;

import java.io.IOException;
import java.util.Map;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

public class AuthUtil {
	
	/***
	 * 접속해 있는 사용자 ID 반환
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static String getMemberId() {
		String retStr = "";
			
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		String json = authentication.getName();
		
		if( ! "admin".equals( json ) ) {
			Map<String,Object> authMap = (Map<String,Object>) authentication.getPrincipal();
			retStr = (String) authMap.get("id");
		}
		else {
			retStr = json;
		}
		return retStr;
	}
	
	/***
	 * 접속해 있는 사용자 이름 반환
	 * @return
	 * @throws IOException 
	 * @throws JsonMappingException 
	 * @throws JsonParseException 
	 */
	@SuppressWarnings("unchecked")
	public static String getMemberName() {
		
		
		String retStr = "";
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		String json = authentication.getName();
		
		if( ! "admin".equals( json ) ) {
			Map<String,Object> authMap = (Map<String,Object>) authentication.getPrincipal();
			retStr = (String) authMap.get("name");
		}
		else {
			retStr = json;
		}
		return retStr;
		
	}
	
}
