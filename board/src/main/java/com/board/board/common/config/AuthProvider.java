package com.board.board.common.config;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import com.board.board.common.util.AuthFactory;

/***
 * 로그인시 사용자가 입력한 아이디와 비밀번호를 확인 하고 해당 권한을 주는 클래스
 * @author jclee
 *
 */
@Component
public class AuthProvider implements AuthenticationProvider {

	@Override
	public Authentication authenticate( Authentication authentication ) throws AuthenticationException {
		
		// authentication.getName() 입력 받은 ID값 ( 현재 email로 셋팅)
		String id = authentication.getName();
		// 입력받은 패스워드
        String passwd = (String) authentication.getCredentials();

        // DB에서 쿼리해 보기 위한 값 셋팅
        Map<String,Object> map = new HashMap<String,Object>();
        map.put( "id", id );

        // NullPointException으로 인한 오류를 해결 하기 위해 Map을 생성 하고
        // 쿼리해온 데이터가 있는 경우에 Map에 넣는다
        Map<String,Object> memberMap = new HashMap<String,Object>();
        
        // Map이 비어 있는지 확인 하고 비어 있다면 해당 계정이 등록 되어 있지 않음
        if ( memberMap.isEmpty() ) {
        	memberMap.put( "pwd", null );
        	throw new BadCredentialsException( "Unregistered user !!" ); 
        }
        else {        	
        	// 비어 있지 않다면 계정은 있으므로 패스워드를 비교한다
        	// 패스워드는 SHA-512 hash로 암호화 되어 있기 때문에 암호를 해제(복호화)하고 입려된 패스워드와 비교 한다.
        	// 입력 받은 암호를 암호화 하여 비교 하려고 했지만 암호화시 값이 계속 변경 되기 때문에 비교할 수 없음.(SHA-512 hash 암호화 특성)
        	String queryPwd = AuthFactory.decryptPassword( (String) memberMap.get( "pwd" ), null );
        	if ( ! passwd.equals(queryPwd) ) {
        		memberMap.put( "pwd", null );
        		throw new BadCredentialsException( "Invalid password !!" ); 
        	}
        }
 
        ArrayList<SimpleGrantedAuthority> authorities = new ArrayList<>();
        // 권한 제어부분 
        // 개발완료 단계에서 권한에 대한 부분을 셋팅 할 때 제어 또는 쿼리로 메뉴를 가리는 방법으로 제어 해야 할 것으로 보임
        authorities.add( new SimpleGrantedAuthority( "ROLE_USER" ) );
        return new UsernamePasswordAuthenticationToken( memberMap, null, authorities );
	}

	@Override
	public boolean supports( Class<?> authentication ) {
		return authentication.equals( UsernamePasswordAuthenticationToken.class );
	}
	
}
