package com.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * <B> 时间工具类 <b>
 * 
 * @author Administrator
 * 
 */
public class DateUtil {
	/**
	 * 创建一个当地时间
	 * 
	 * @return
	 */
	public static Date getNowTime() {
		Date nowTime = new Date();
		return nowTime;
	}

	/**
	 * 二个时间之差
	 * 
	 * @param end
	 * @param start
	 * @return
	 */
	public static long getTwoTimeSub(Date end, Date start) {
		long minutes = (end.getTime() - start.getTime()) / (1000 * 60);
		return minutes;
	}

	public static long getTwoTimeSub(Date end, String st) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date start = null;
		try {
			start = df.parse(st);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long minutes = (end.getTime() - start.getTime()) / (1000 * 60);
		return minutes;
	}

	/**
	 * TODO 获得当前日期--- 年-月-日 时-分-秒
	 * 
	 * @return String
	 */
	public static String getPreciseTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(new Date());
	}

	
}
