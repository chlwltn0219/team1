package org.zerock.util;

import java.util.Date;

public class DateUtil{
	
	public String gettmFc() {
		Date now = new Date();
		String tmFc = "";
		
		tmFc += Integer.toString(now.getYear()+1900);
		
		if((now.getMonth()+1)<10)
			tmFc += "0" + (now.getMonth()+1); 
		else
			tmFc += Integer.toString(now.getMonth()+1);
	
		if(now.getDate()<10)
			tmFc += "0" + now.getDate();
		else
			tmFc += Integer.toString(now.getDate());
		
		if(now.getHours() < 6 && now.getHours() >= 18)
			tmFc += "1800"; 
		else
			tmFc += "0600";
					
		return tmFc;
	}
	
}
