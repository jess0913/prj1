package com.board.board.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.board.board.dao.ContentsDao;
import com.board.board.service.ContentsService;

@Service
public class ContentsServiceImpl implements ContentsService {
	
	@Value("${contents.fileUrl}")
	private String FILE_URL;
	
	@Value("${contents.fileUpUrl}")
	private String FILE_UP_URL;

	
	@Autowired
	ContentsDao contentsDao;

	@Override
	public List<Map<String, Object>> getContentsList() {
		return contentsDao.getContentsList();
	}

	@Override
	public Map<String, Object> insertContents( Map<String, Object> paramMap ) {
		Map<String,Object> retMap = new HashMap<String,Object>();
		
		OutputStream out = null;

		try {
					
			MultipartFile mFile = (MultipartFile) paramMap.get( "contentsFile" );
			
			
			String oriFileName =  mFile.getOriginalFilename().indexOf("\\") > 0 ? 
					mFile.getOriginalFilename().substring(mFile.getOriginalFilename().lastIndexOf("\\")+1, mFile.getOriginalFilename().length()) : mFile.getOriginalFilename();
			String fileName = System.currentTimeMillis() + "_" + oriFileName;
			
			File destdir = new File(FILE_UP_URL); //디렉토리 가져오기
			
	        if(!destdir.exists()){
	            destdir.mkdirs(); //디렉토리가 존재하지 않는다면 생성
	        }
	        
			File fileOri = convert(mFile);
			File file = new File( FILE_UP_URL + "//" + fileName);
			fileOri.renameTo(file);
			out = new FileOutputStream(file);
			byte[] bytes = mFile.getBytes();
			out.write(bytes);

			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put( "contentsName", paramMap.get("contentsName") );
			map.put( "fileName", oriFileName );
			map.put( "fileUrl", FILE_URL + "/" + fileName );
			map.put( "createUser", paramMap.get("createUser") );
			map.put( "description", paramMap.get("description") );
			
			contentsDao.insertContents(map);
			
			
			retMap.put("isSaved", true);
			retMap.put("msg", "저장되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			retMap.put("isSaved", false);
			retMap.put("msg", "저장되지 않았습니다.");
			return retMap;
		}
		finally {
            try {
                if (out != null) {
                    out.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

		return retMap;
	}

	@Override
	public Map<String, Object> updateContents( Map<String, Object> paramMap ) {
		Map<String,Object> retMap = new HashMap<String,Object>();
		
		OutputStream out = null;
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			
			if( paramMap.get( "contentsFile" ) != null ) {
				MultipartFile mFile = (MultipartFile) paramMap.get( "contentsFile" );
				String oriFileName =  mFile.getOriginalFilename();
				String fileName = System.currentTimeMillis() + "_" + mFile.getOriginalFilename();
				
				File destdir = new File(FILE_UP_URL); //디렉토리 가져오기
				
				if(!destdir.exists()){
					destdir.mkdirs(); //디렉토리가 존재하지 않는다면 생성
				}
				
				File fileOri = convert(mFile);
				File file = new File( FILE_UP_URL + "//" + fileName);
				fileOri.renameTo(file);
				out = new FileOutputStream(file);
				byte[] bytes = mFile.getBytes();
				out.write(bytes);
				
				map.put( "fileName", oriFileName );
				map.put( "fileUrl", FILE_URL + "/" + fileName );
			}
			map.put( "contentsId", paramMap.get("contentsId") );
			map.put( "contentsName", paramMap.get("contentsName") );
			map.put( "updateUser", paramMap.get("updateUser") );
			map.put( "description", paramMap.get("description") );
			
			contentsDao.updateContents(map);
			
			retMap.put("isSaved", true);
			retMap.put("msg", "수정 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			retMap.put("isSaved", false);
			retMap.put("msg", "수정되지 않았습니다.");
			return retMap;
		}
		finally {
            try {
                if (out != null) {
                    out.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
		return retMap;
	}

	@Override
	public List<Map<String, Object>> getAdminContentsList( Map<String, Object> paramMap ) {
		return contentsDao.getAdminContentsList( paramMap );
	}


	@Override
	public int getTotalContentsCount(Map<String, Object> map) {
		return contentsDao.getTotalContentsCount( map );
	}
	
	private File convert(MultipartFile file) throws IOException {	
		String fileName = file.getOriginalFilename();
		if(fileName.indexOf("\\") != -1) {
			fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
		}
	    File convFile = new File(fileName);
	    convFile.createNewFile();
	    FileOutputStream fos = new FileOutputStream(convFile);
	    fos.write(file.getBytes());
	    fos.close();
	    return convFile;
	}

	@Override
	public Map<String, Object> getContents(Map<String, Object> paramMap) {
		return contentsDao.getContents( paramMap );
	}

	@Override
	public Map<String, Object> deleteContents(Map<String, Object> paramMap) {
		Map<String,Object> retMap = new HashMap<String,Object>();
		
		try {
			
			contentsDao.deleteContents( paramMap );
			
			retMap.put("isDel", true);
			retMap.put("msg", "삭제 되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			retMap.put("isDel", false);
			retMap.put("msg", "삭제되지 않았습니다.");
			return retMap;
		}
		return retMap;
	}

}
