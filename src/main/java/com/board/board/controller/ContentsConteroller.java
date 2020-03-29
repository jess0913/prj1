package com.board.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
}
