package org.zerock.util;

public class AreaUtil {
	public Integer getArea(){
		String area = "강동구";
		int areaC = 1;
		
		if(area=="강남구"){
			areaC = 1;
		} else if (area=="강동구"){
			areaC = 2;
		} else if (area=="강북구"){
			areaC = 3;
		} else if (area=="강서구"){
			areaC = 4;
		} else if (area=="관악구"){
			areaC = 5;
		} else if (area=="광진구"){
			areaC = 6;
		} else if (area=="구로구"){
			areaC = 7;
		} else if (area=="금천구"){
			areaC = 8;
		} else if (area=="노원구"){
			areaC = 9;
		} else if (area=="도봉구"){
			areaC = 10;
		} else if (area=="동대문구"){
			areaC = 11;
		} else if (area=="동작구"){
			areaC = 12;
		} else if (area=="마포구"){
			areaC = 13;
		} else if (area=="서대문구"){
			areaC = 14;
		} else if (area=="서초구"){
			areaC = 15;
		} else if (area=="성동구"){
			areaC = 16;
		} else if (area=="성북구"){
			areaC = 17;
		} else if (area=="송파구"){
			areaC = 18;
		} else if (area=="양천구"){
			areaC = 19;
		} else if (area=="영등포구"){
			areaC = 20;
		} else if (area=="용산구"){
			areaC = 21;
		} else if (area=="은평구"){
			areaC = 22;
		} else if (area=="종로구"){
			areaC = 23;
		} else if (area=="중구"){
			areaC = 24;
		} else{
			areaC = 25;
		}
		
		return areaC;
	}
}
