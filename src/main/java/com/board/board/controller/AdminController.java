package com.board.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.board.board.common.util.AuthUtil;
import com.board.board.common.util.Pagination;
import com.board.board.service.BoardService;
import com.board.board.service.ContentsService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	ContentsService contentsService;
	
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
		mav.setViewName("jsp/board/result/resultList");
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
			mav.setViewName("jsp/admin/detailNotiPopup");
		}
		else {

			Map<String,Object> contentsMap = contentsService.getContents(paramMap);
			
			mav.addObject("contentsMap", contentsMap);
			mav.setViewName("jsp/admin/detailContentsPopup");
		}
		return mav;
	}
	
	
	//////////////////////////////////////// 공지사항 /////////////////////////////////////////////////////
	
	@RequestMapping("createNoti")
	public ModelAndView createNotiPopup () {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/jsp/admin/createNotiPopup");
		return mav;
	}

	@RequestMapping("/insertNoti")
	@ResponseBody
	public Map<String,Object> insertNoti( @RequestParam Map<String,Object> paramMap ){
		System.out.println("===================== 공지사항 등록 =============================");
		
		Map<String,Object> retMap = new HashMap<String,Object>();
		
		String createUser = AuthUtil.getMemberId();
		paramMap.put("createUser", createUser);
		retMap = boardService.insertNoti( paramMap );
		System.out.println("===================== 공지사항 등록 완료 =============================");
		return retMap;
		
	}
	
	@RequestMapping("/updateNoti")
	@ResponseBody
	public Map<String,Object> updateNoti( @RequestParam Map<String,Object> paramMap ){
		System.out.println("===================== 공지사항 수정 =============================");
		Map<String,Object> retMap = new HashMap<String,Object>();
		String updateUser = AuthUtil.getMemberId();
		paramMap.put("updateUser", updateUser);
		retMap = boardService.updateNoti( paramMap );
		System.out.println("===================== 공지사항 수정 완료 =============================");
		return retMap;
		
	}
	//////////////////////////////////////// 공지사항 /////////////////////////////////////////////////////
	
	
	//////////////////////////////////////// 자료실 /////////////////////////////////////////////////////
	@RequestMapping("/createContents")
	public ModelAndView createContents () {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/jsp/admin/createContentsPopup");
		return mav;
	}
	
	@RequestMapping(consumes = "multipart/form-data", method = RequestMethod.POST, 
	        value =  "/insertContents", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String,Object> insertContents(
				@RequestParam(name="contentsFile") 	MultipartFile[] contentsFile
			  ,	@RequestParam(name="file",required = false) 	MultipartFile file
			  , @RequestParam Map<String,Object> 	paramMap 
	) {
		System.out.println("===================== 자료실 등록 =============================");
		
		Map<String,Object> retMap = new HashMap<String,Object>();
		List<MultipartFile> contentsFileList = new ArrayList<MultipartFile>();
		
		String createUser = AuthUtil.getMemberId();
		paramMap.put("createUser", createUser);
		
		for( MultipartFile mFile : contentsFile ) {
			contentsFileList.add(mFile);
		}
		paramMap.put("contentsFile", contentsFileList.get(0));
		
		retMap = contentsService.insertContents(paramMap);
		
		System.out.println("===================== 자료실 등록 완료 =============================");
		return retMap;		
	}
	
	@RequestMapping(consumes = "multipart/form-data", method = RequestMethod.POST, 
			value =  "/updateContents", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String,Object> updateContents(
			@RequestParam(name="contentsFiles") 	MultipartFile[] contentsFiles
			,	@RequestParam(name="file",required = false) 	MultipartFile file
			, @RequestParam Map<String,Object> 	paramMap 
			) {
		Map<String,Object> retMap = new HashMap<String,Object>();
		List<MultipartFile> contentsFileList = new ArrayList<MultipartFile>();
		
		String updateUser = AuthUtil.getMemberId();
		paramMap.put("updateUser", updateUser);
		
		for( MultipartFile mFile : contentsFiles ) {
			contentsFileList.add(mFile);
		}
		
		return retMap;		
	}
	
	//////////////////////////////////////// 자료실 /////////////////////////////////////////////////////
}
