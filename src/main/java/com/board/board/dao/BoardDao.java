package com.board.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDao {

	public List<Map<String,Object>> getNotiList();
	
	public void insertNoti( Map<String,Object> paramMap );
	
	public void updateNoti( Map<String,Object> paramMap );

	public List<Map<String, Object>> getAdminNotiList( Map<String,Object> paramMap );

	public int getTotalNotiCount( Map<String, Object> map );

	public Map<String, Object> getNoti( Map<String, Object> paramMap );

	public void deleteNoti( Map<String, Object> paramMap );
	
}
