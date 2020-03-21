package com.board.board.common.util;

import javax.servlet.http.HttpServletRequest;

/***
 * 접속자의 ip를 확인 하기 위한 util
 * @author enliple
 *
 */
public class ClientUtil {
	 public static String getRemoteIP( HttpServletRequest request ){
         String ip = request.getHeader("X-FORWARDED-FOR"); 
         
         //proxy 환경일 경우
         if (ip == null || ip.length() == 0) {
             ip = request.getHeader("Proxy-Client-IP");
         }
 
         //웹로직 서버일 경우
         if (ip == null || ip.length() == 0) {
             ip = request.getHeader("WL-Proxy-Client-IP");
         }
 
         if (ip == null || ip.length() == 0) {
             ip = request.getRemoteAddr() ;
         }
         
         return ip;
    }
}
