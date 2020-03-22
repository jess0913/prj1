package com.board.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
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
	
	
	/**
	 * 공지사항 리스트
	 * @return
	 */
	@RequestMapping("/getNotiList")
	@ResponseBody
	public ModelAndView getNotiList() {
		ModelAndView mav = new ModelAndView();
		
		List<Map<String,Object>> notiList = boardService.getNotiList();
		
		mav.addObject("notiList", notiList);
		mav.setViewName("jsp/board/noti");
		return mav;
	}
	
}
