package com.board.board.common.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;

public class DateUtil {

    private static SimpleDateFormat defaultDateFormat = new SimpleDateFormat("yyyy-MM-dd");

    /**
     * 현재 날짜를 Calendar 타입으로 반환하기
     * @return 현재 날짜
     */
    public static Calendar getCalendar() {
        return Calendar.getInstance();
    }

    /**
     * 오늘 날짜 가져오기
     * 기본포맷 : yyyy-MM-dd
     * @return String
     */
    public static String getCurrentDate() {
        return getCurrentDate("");
    }
    
    /**
     * 오늘 날짜 가져오기
     * 사용자가 요청한 포맷으로
     * @param format
     * @return String
     */
    public static String getCurrentDate(String format) {

        String returnValue = "";
        Calendar cal = getCalendar();

        try {
            if ( format.equals("") ) {
                returnValue = getFormatDate(cal, defaultDateFormat.toPattern());
            }
            else {
                returnValue = getFormatDate(cal, format);
            }
        }
        catch ( Exception e ) {
            e.printStackTrace();
        }

        return returnValue;
    }
    
    /**
     * Calendar 타입을 포멧형태에 맞춰 문자열로 반환
     * @param Calendar objCalendar
     * @param String   strFormat  (ex : yyyy-MM-dd HH:mm:ss)
     * @return 포멧형태의 문자열
     */
    public static String getFormatDate(Calendar objCalendar, String strFormat) {

        if ( objCalendar == null || strFormat == null || strFormat.trim().length() == 0 )
            return null;

        SimpleDateFormat objFormat = new SimpleDateFormat(strFormat);

        return objFormat.format( objCalendar.getTime() );
    }

    /**
     * parameter 값 date를 yyyy-MM-dd 형태로 변경
     * @param date
     * @return String
     */
    public static String getConvertFormat(String date) {
        return getConvertFormat(date, defaultDateFormat.toPattern());
    }
    
    /**
     * parameter 값 date를 changeFormat 형태로 변경
     * @param date
     * @param changeformate
     * @return String, 요청한 format
     */
    public static String getConvertFormat(String date, String format) {

        String returnValue = "";
        Calendar cal = getCalendar();
        SimpleDateFormat sdf = new SimpleDateFormat(format);

        try {
            cal.setTime(string2Date(date));
            returnValue = sdf.format(cal.getTime());
        }
        catch ( Exception e ) {
            e.printStackTrace();
        }

        return returnValue;
    }
    
    public static String getConvertFormat(Timestamp date, String format) {
    	
    	String returnValue = "";
    	Calendar cal = getCalendar();
    	SimpleDateFormat sdf = new SimpleDateFormat(format);
    	
    	try {
    		cal.setTime(date);
    		returnValue = sdf.format(cal.getTime());
    	}
    	catch ( Exception e ) {
    		e.printStackTrace();
    	}
    	
    	return returnValue;
    }
    
    /**
     * String 을 Date yyyy-MM-dd 형태로 변환
     * @param date
     * @return Date, yyyy-MM-dd
     */
    public static Date string2Date(String date) {

        return string2Date(date, defaultDateFormat.toPattern());
    }

    /**
     * String 을 Date 형태의 요청한 format으로 변환
     * @param date
     * @param changeFormat
     * @return Date, 요청한 format
     */
    public static Date string2Date(String date, String format) {

        SimpleDateFormat sdf = new SimpleDateFormat(format);

        try {
            return sdf.parse(date);
        }
        catch ( ParseException e ) {
            e.printStackTrace();
        }

        return null;
    }
    
    public static String addDay(String orgDate, int dayAmount) {

        Calendar cal = getCalendar();

        cal.setTime(string2Date(orgDate));

        cal.add(Calendar.DAY_OF_MONTH, dayAmount);

        return defaultDateFormat.format(cal.getTime());
    }
    
    public static String addMonth(String orgDate, int monthAmount) {
    	
    	Calendar cal = getCalendar();
    	
    	cal.setTime(string2Date(orgDate));
    	
    	cal.add(Calendar.MONTH, monthAmount);
    	
    	return defaultDateFormat.format(cal.getTime());
    }
    
    /***
     * 두 날짜 사이의 날짜리스트 출력
     * @param inputStartDate
     * @param inputEndDate
     * @return
     */
    
	public static List<String> getDateList ( String inputStartDate, String inputEndDate ) {
		
		List<String> dateList = new ArrayList<String>();
		
		try {
			final String DATE_PATTERN = "yyyy-MM-dd";
			SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
			Date startDate = sdf.parse(inputStartDate);
			Date endDate = sdf.parse(inputEndDate);
			ArrayList<String> dates = new ArrayList<String>();
			Date currentDate = startDate;
			while (currentDate.compareTo(endDate) <= 0) {
				dates.add(sdf.format(currentDate));
				Calendar c = Calendar.getInstance();
				c.setTime(currentDate);
				c.add(Calendar.DAY_OF_MONTH, 1);
				currentDate = c.getTime();
			}
			for (String date : dates) {
				dateList.add(date);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}

		return dateList;
	}

	/**
	 * 입력달 다음달 부터 1년간 월 리스트
	 * @param inputStartDate
	 * @return
	 */
	public static List<String> getMonthList(String inputStartDate) {
		List<String> dateList = new ArrayList<String>();
		List<String> dates = new ArrayList<String>();
		
		try {
			for ( int i=1; i<=12; i++ ){
				String date = addMonth( inputStartDate, i);
				dates.add(date);
			}
			
			for (String date : dates) {				
				dateList.add( getConvertFormat(date, "YYYY-MM") );
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}

		return dateList;
	}
	
	/**
	 * 두 날짜 사이의 월 리스트
	 * @param inputStartDate , inputEndDate
	 * @return dateList
	 */
	public static List<String> getMonthList(String inputStartDate, String inputEndDate) {
		List<String> dateList = new ArrayList<String>();
		
		try {
			final String DATE_PATTERN = "yyyy-MM";
			SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
			Date startDate = sdf.parse(inputStartDate);
			Date endDate = sdf.parse(inputEndDate);
			ArrayList<String> dates = new ArrayList<String>();
			Date currentDate = startDate;
			while (currentDate.compareTo(endDate) <= 0) {
				dates.add(sdf.format(currentDate));
				Calendar c = Calendar.getInstance();
				c.setTime(currentDate);
				c.add(Calendar.MONTH, 1);
				currentDate = c.getTime();
			}
			for (String date : dates) {
				dateList.add(date);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}

		return dateList;
	}
	
	public static String getFirstDateOfMonth(String date) {
		String returnValue = "";
		
		if ( StringUtils.isNotEmpty(date) ) {
			Calendar cal = getCalendar();
			cal.setTime(DateUtil.string2Date(date));
			
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.getActualMinimum(Calendar.DAY_OF_MONTH));
			
			returnValue = defaultDateFormat.format(cal.getTime());
		}
		
		return returnValue;
	}
	
	public static String getLastDateOfMonth(String date) {
		String returnValue = "";

        if ( StringUtils.isNotEmpty(date) ) {
            Calendar cal = getCalendar();
            cal.setTime(DateUtil.string2Date(date));
            cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.getActualMaximum(Calendar.DAY_OF_MONTH));
            returnValue = defaultDateFormat.format(cal.getTime());
        }

        return returnValue;
    }
	
	//현재 날짜 월요일
 	public static String getCurMonday(){
 		Calendar calender = Calendar.getInstance();
 		calender.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
 		return defaultDateFormat.format(calender.getTime());
 	}

 	//현재 날짜 일요일
 	@SuppressWarnings("static-access")
	public static String getCurSunday(){
 		Calendar calender = Calendar.getInstance();
 		calender.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
 		calender.add(calender.DATE,7);
 		return defaultDateFormat.format(calender.getTime());
 	}

 	//현재 날짜 주차
 	public static String getWeek(){
 		Calendar calender = Calendar.getInstance();
 		String week = String.valueOf(calender.get(Calendar.WEEK_OF_MONTH));
 		return week;
 	}

 	//특정 년,월,주 차에 월요일 구하기
 	public static String getMonday(String yyyy,String mm, String wk){
 		Calendar calender = Calendar.getInstance();

 		int year=Integer.parseInt(yyyy);
 		int month=Integer.parseInt(mm)-1;
 		int week=Integer.parseInt(wk);

 		calender.set(Calendar.YEAR,year);
 		calender.set(Calendar.MONTH,month);
 		calender.set(Calendar.WEEK_OF_MONTH,week);
 		calender.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
 		return defaultDateFormat.format(calender.getTime());
 	}

 	//특정 년,월,주 차에 일요일 구하기
 	@SuppressWarnings("static-access")
	public static String getSunday(String yyyy,String mm, String wk){

 		Calendar calender = Calendar.getInstance();

 		int year=Integer.parseInt(yyyy);
 		int month=Integer.parseInt(mm)-1;
 		int week=Integer.parseInt(wk);

 		calender.set(Calendar.YEAR,year);
 		calender.set(Calendar.MONTH,month);
 		calender.set(Calendar.WEEK_OF_MONTH,week);
 		calender.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
 		calender.add(calender.DATE,7);

 		return defaultDateFormat.format(calender.getTime());
 	}
}
