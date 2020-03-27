package com.board.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthController {
	
	@RequestMapping("/")
	public ModelAndView main () {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect:/login");
		return mav;
	}

	@RequestMapping("/auth/checkLogin")
	public ModelAndView checkLogin () {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/login");
		return mav;
	}
	
	@RequestMapping("/login")
	public ModelAndView login () {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("jsp/login/login");
		return mav;
	}
	

	@RequestMapping("/adminCnt")
	public ModelAndView adminCnt () {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("jsp/board/adminCnt");
		return mav;
	}

}
