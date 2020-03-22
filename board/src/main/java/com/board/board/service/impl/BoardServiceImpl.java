package com.board.board.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.board.dao.BoardDao;
import com.board.board.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;
	
	@Override
	public List<Map<String, Object>> getNotiList() {
		return boardDao.getNotiList();
	}

	@Override
	public Map<String, Object> insertNoti( Map<String, Object> paramMap ) {
		Map<String, Object> retMap = new HashMap<String, Object>();
		
		try {
			
			boardDao.insertNoti( paramMap );
			
			retMap.put( "isSaved", true );
			retMap.put("msg", "저장되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			retMap.put( "isSaved", true );
			retMap.put("msg", "저장에 실패 하였습니다.");
			return retMap;
		}
		
		return retMap;
	}
	

	@Override
	public Map<String, Object> updateNoti( Map<String, Object> paramMap ) {
		Map<String, Object> retMap = new HashMap<String, Object>();
		
		try {
			
			boardDao.updateNoti( paramMap );
			
			retMap.put( "isSaved", true );
			retMap.put("msg", "수정되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			retMap.put( "isSaved", true );
			retMap.put("msg", "수정에 실패하였습니다.");
			return retMap;
		}
		
		return retMap;
	}

	@Override
	public List<Map<String, Object>> getAdminNotiList() {
		return boardDao.getAdminNotiList();
	}

}
