package com.board.board.common.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.board.board.common.handler.AuthFailureHandler;


/***
 * 
 * @author jclee
 *
 */
@Configuration
@EnableWebSecurity
@EnableGlobalAuthentication
@ComponentScan(basePackages = {"com.camp.admin.*"})
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
    private AuthProvider authProvider;
	
	@Autowired(required=true)
	AuthFailureHandler authFailureHandler;
	
	@Override
    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
		
		// 어드민 아이디 패스워드 지정 하여 사용
        auth.authenticationProvider(authProvider)          
          .inMemoryAuthentication()
          .withUser("admin").password(passwordEncoder().encode("adminPass")).roles("ADMIN")
          ;
    }
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		// 로그인 하기전 사용 할 수 있는 폴더 처리 (예외처리)
		web.ignoring().antMatchers("/css/**", "/js/**", "/script/**", "img/**", "/fonts/**", "lib/**", "/resources/**");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// 접근 및 권한을 셋팅 하는 부분
		/**
		 * 	 access(String) 			- 주어진 SpEL 표현식의 평가 결과가 true이면 접근을 허용
			 anonymous()    			- 익명의 사용자의 접근을 허용
			 authenticated() 			- 인증된 사용자의 접근을 허용
			 denyAll() 					- 무조건 접근을 허용하지 않음
			 fullyAuthenticated() 		- 사용자가 완전히 인증되면 접근을 허용(기억되지 않음)
			 hasAnyAuthority(String...) - 사용자가 주어진 권한 중 어떤 것이라도 있다면 접근을 허용
			 hasAnyRole(String...) 		- 사용자가 주어진 역할 중 어떤 것이라도 있다면 접근을 허용
			 hasAuthority(String) 		- 사용자가 주어진 권한이 있다면 접근을 허용
			 hasIpAddress(String) 		- 주어진 IP로부터 요청이 왔다면 접근을 허용
			 hasRole(String) 			- 사용자가 주어진 역할이 있다면 접근을 허용
			 not() 						- 다른 접근 방식의 효과를 무효화
			 permitAll() 				- 무조건 접근을 허용
			 rememberMe() 				- 기억하기를 통해 인증된 사용자의 접근을 허용
		 */
		//		스프링 시큐리티에서 사용 가능한 SpEL
		//		 authentication - 사용자의 인증 객체
		//		 denyAll  - 항상 거짓으로 평가함
		//		 hasAnyRole(역할 목록) - 사용자가 역할 목록 중 하나라도 역할이 있는 경우 참
		//		 hasRole(역할) - 사용자가 주어진 역할이 있는 경우 참
		//		 hasIpAddress(IP 주소) - 주어진 IP 주소로부터 요청이 오는 경우 참
		//		 isAnonymous() - 사용자가 익명인 경우 참
		//		 isAuthenticated() - 사용자가 인증된 경우 참
		//		 isFullyAuthenticated() - 사용자가 완전히 인증된 경우 참 (기억하기(remember-me)로는 인증되지 않음)
		//		 isRememberMe() - 사용자가 기억하기(remember-me)로 인증된 경우 참
		//		 permitAll - 항상 참으로 평가함 
		//		 principal - 사용자의 주체 객체
		
		/*
		 * logout-url	 				로그아웃 처리에 대한 URL. form태그의 action 속성에 지정한 값. (default: POST /logout)
		 * logout-success-url			로그아웃 성공시, 이동할 URL. (default: /login?logout)
		 * invalidate-session			로그아웃 시, session을 무효화할 지 선택. (default: true)
		 * delete-cookies				로그아웃 성공시, 삭제할 쿠키 이름 지정
		 * success-handler-ref			로그아웃 성공시, logout-success-url 이 아닌 핸들러로 리다이렉트
		 */
		
		 http
         	.csrf().disable()
         	.authorizeRequests()
         	.antMatchers("/admin/**").hasRole("ADMIN")
			.antMatchers("/anonymous*").anonymous()
			.antMatchers("/api/**").permitAll()
			.antMatchers("/login").permitAll()
			.anyRequest().authenticated()
			.and()
				.formLogin()
				// loginPage ()  - 사용자 정의 로그인 페이지
				.loginPage("/login")
				// loginProcessingUrl () - 사용자 이름과 비밀번호를 제출할 URL
				.loginProcessingUrl("/login")
				// defaultSuccessUrl () - 로그인 성공 후 방문 페이지
				.defaultSuccessUrl("/home", true)
				// failureUrl () - 로그인 실패 후 방문 페이지
				.failureUrl("/login?error=fail")
//				.failureHandler(authFailureHandler)
			.and()				
				.logout()
//				.logoutUrl("/login")
				.deleteCookies("JSESSIONID")
//				.logoutSuccessUrl("/login")
		 		.invalidateHttpSession(true)
//				.logoutSuccessHandler(logoutSuccessHandler())
		 		;
	}
	
	@Bean
    public PasswordEncoder passwordEncoder() {
		// 패스워드 암호화
        return new BCryptPasswordEncoder();
    }
}
