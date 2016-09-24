package org.zerock.openapi.weather;

import java.util.List;
import java.util.Map;

public class Weather {
	
	private List<Map<String, Object>> summary;
	private List<Map<String, Object>> forecast6days;

	public List<Map<String, Object>> getSummary() {
		return summary;
	}
	public void setSummary(List<Map<String, Object>> summary) {
		this.summary = summary;
	}
	public List<Map<String, Object>> getForecast6days() {
		return forecast6days;
	}
	public void setForecast6days(List<Map<String, Object>> forecast6days) {
		this.forecast6days = forecast6days;
	}
	
}
