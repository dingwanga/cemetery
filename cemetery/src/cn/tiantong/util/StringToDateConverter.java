package cn.tiantong.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class StringToDateConverter implements Converter<String, Date> {

	private String datePattern;
	
	
	public StringToDateConverter(String datePattern) {
		super();
		this.datePattern = datePattern;
	}

	//s -1999-12-12
	public Date convert(String s) {
		// TODO Auto-generated method stub
		Date date = null;
		try {
			date = new SimpleDateFormat(datePattern).parse(s);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}

}
