package com.board.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.board.common.util.Pagination;
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
	
	@RequestMapping("/list")
	public ModelAndView adminCnt () {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("jsp/board/include/list");
		return mav;
	}
	
	@RequestMapping("/getBoardList")
	@ResponseBody
	public ModelAndView getBoardList( @RequestParam Map<String,Object> paramMap ) {
		ModelAndView mav = new ModelAndView();
		
		List<Map<String,Object>> boardList = new ArrayList<Map<String,Object>>();
		String boardType = (String) paramMap.get("boardType");
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		int viewCount = Integer.parseInt( (String) paramMap.get( "selectPageCnt" ) );
		int pageNum = Integer.parseInt( (String) paramMap.get( "pageNum" ) );
		
		map.put( (String) paramMap.get( "searchCondi" ), paramMap.get( "searchText" ) );
		
		int totalCnt = 0;
		if( "NOTI".equals( boardType ) ) {
			totalCnt = boardService.getTotalNotiCount( map );
		}
		else {
			totalCnt = contentsService.getTotalContentsCount( map );
		}
		
		Pagination page = new Pagination();
		page.setRowCnt( viewCount );
		page.setCurrentPage( pageNum );
		page.setTotalCnt( totalCnt );
		
		map.put( "startNum", page.getStartIndex() );
		map.put( "pageCnt", viewCount );
		
		if( "NOTI".equals( boardType ) ) {
			boardList = boardService.getAdminNotiList( map );
		}
		else {
			boardList = contentsService.getAdminContentsList( map );
		}
		
		mav.addObject( "totalCnt", page.getTotalCnt() );
		mav.addObject( "pageInfo", page );
		
		
		System.out.println("boardList====>" + boardList.toString());
		mav.addObject("boardList", boardList);
		mav.setViewName("jsp/board/include/result/resultList");
		return mav;
	}
	
	@RequestMapping("/boardDetail")
	@ResponseBody
	public ModelAndView boardDetail ( @RequestParam Map<String,Object> paramMap ) {
		ModelAndView mav = new ModelAndView();
		String boardType = (String)paramMap.get("boardType");
		if( "NOTI".equals(boardType) ) {
			
			Map<String,Object> notiMap = boardService.getNoti(paramMap);
			
			mav.addObject("notiMap", notiMap);
			mav.setViewName("jsp/board/include/detail_Noti");
		}
		else {

			Map<String,Object> contentsMap = contentsService.getContents(paramMap);
			
			mav.addObject("contentsMap", contentsMap);
			mav.setViewName("jsp/board/include/detail_Contents");
		}
		return mav;
	}
}
