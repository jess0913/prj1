package com.board.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ContentsDao {
	
	public List<Map<String,Object>> getContentsList ();
	
	public void insertContents( Map<String,Object> parmaMap );
	
	public void updateContents ( Map<String,Object> parmaMap );

	public List<Map<String, Object>> getAdminContentsList( Map<String,Object> paramMap );

	public int getTotalContentsCount( Map<String, Object> map );

	public Map<String, Object> getContents( Map<String, Object> paramMap );

	public void deleteContents( Map<String, Object> paramMap );

}
