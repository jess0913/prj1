package com.board.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.board.service.BoardService;
import com.board.board.service.ContentsService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	ContentsService contentsService;
	
	@RequestMapping("/main")
	public ModelAndView boardMain() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("jsp/board/main");
		return mav;
	}
	
	@RequestMapping("/pop")
	public ModelAndView popMain() {
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put( "startNum", 0 );
		map.put( "pageCnt", 3 );
		List<Map<String,Object>> notiList = boardService.getAdminNotiList( map );
		
		Map<String,Object> detailMap = new HashMap<String,Object>();
		if( notiList.size() > 0 ) {
			detailMap = notiList.get(0);
		}
		
		// 자료실 리스트 
		List<Map<String,Object>> contentsList = contentsService.getAdminContentsList(map);
		
		
		mav.addObject("detailMap", detailMap);
		mav.addObject("notiList", notiList);
		mav.addObject("contentsList", contentsList);
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
	
	/**
	 * 
	 */
	@RequestMapping("/getNoti")
	@ResponseBody
	public ModelAndView getNoti( @RequestParam Map<String,Object> map ) {
		ModelAndView mav = new ModelAndView();
		
		Map<String,Object> detailMap = boardService.getNoti(map);
		
		mav.addObject("detailMap", detailMap);
		mav.setViewName("jsp/board/include/detailNoti");
		return mav;
		
	}
	
}
