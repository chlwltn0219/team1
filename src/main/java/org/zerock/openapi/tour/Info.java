package org.zerock.openapi.tour;

import java.util.List;
import java.util.Map;

public class Info {

	List<String> image;
	Map<String,Object> location ;
	Map<String,Object> cost ;
	Map<String,Object> programs ;
	
	String homepage;
	String title;
	String overview;
	String tel;
	String evnetTitle;
	
	
	
	public String getEvnetTitle() {
		return evnetTitle;
	}
	public void setEvnetTitle(String evnetTitle) {
		this.evnetTitle = evnetTitle;
	}
	public List<String> getImage() {
		return image;
	}
	public void setImage(List<String> image) {
		this.image = image;
	}
	public Map<String, Object> getLocation() {
		return location;
	}
	public void setLocation(Map<String, Object> location) {
		this.location = location;
	}
	public Map<String, Object> getCost() {
		return cost;
	}
	public void setCost(Map<String, Object> cost) {
		this.cost = cost;
	}
	public Map<String, Object> getPrograms() {
		return programs;
	}
	public void setPrograms(Map<String, Object> programs) {
		this.programs = programs;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	
	
}
