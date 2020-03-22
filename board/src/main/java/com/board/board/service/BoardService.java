package com.board.board.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	public List<Map<String, Object>> getNotiList();

	public Map<String, Object> insertNoti( Map<String, Object> paramMap );
	
	public Map<String, Object> updateNoti( Map<String, Object> paramMap );

	public List<Map<String, Object>> getAdminNotiList();

}
