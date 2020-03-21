package com.board.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@RequestMapping("/main")
	public ModelAndView boardMain() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("jsp/board/main");
		return mav;
	}
	
	@RequestMapping("/pop")
	public ModelAndView popMain() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("jsp/board/pop");
		return mav;
	}
}
