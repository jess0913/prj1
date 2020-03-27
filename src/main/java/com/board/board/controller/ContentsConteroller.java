package com.board.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.board.board.service.ContentsService;

@Controller
@RequestMapping("/contents")
public class ContentsConteroller {
	
	@Value("${contents.fileUrl}")
	private String FILE_URL;
	
	@Autowired
	ContentsService contentsService;

	@RequestMapping("/contentsList")
	public ModelAndView getContentsList() {
		ModelAndView mav = new ModelAndView();
		
		List<Map<String,Object>> contentsList = contentsService.getContentsList();
		
		mav.addObject("contentsList", contentsList);
		return mav;
	}
	
	@RequestMapping(consumes = "multipart/form-data", method = RequestMethod.POST, 
	        value =  "/insertContents", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String,Object> insertContents(
				@RequestParam(name="contentsFiles") 	MultipartFile[] contentsFiles
			  ,	@RequestParam(name="file",required = false) 	MultipartFile file
			  , @RequestParam Map<String,Object> 	paramMap 
	) {
		Map<String,Object> retMap = new HashMap<String,Object>();
		List<MultipartFile> contentsFileList = new ArrayList<MultipartFile>();
		
		for( MultipartFile mFile : contentsFiles ) {
			contentsFileList.add(mFile);
		}
		
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
		
		for( MultipartFile mFile : contentsFiles ) {
			contentsFileList.add(mFile);
		}
		
		return retMap;		
	}
}
