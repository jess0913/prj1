package com.board.board.service;

import java.util.List;
import java.util.Map;

public interface ContentsService {

	public List<Map<String,Object>> getContentsList ();
	
	public Map<String,Object> insertContents( Map<String,Object> paramMap );
	
	public Map<String,Object> updateContents ( Map<String,Object> paramMap );

	public List<Map<String, Object>> getAdminContentsList();
}
