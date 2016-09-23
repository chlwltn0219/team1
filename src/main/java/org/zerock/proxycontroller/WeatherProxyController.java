package org.zerock.proxycontroller;

import java.net.URI;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.zerock.openapi.weather.Weather;
import org.zerock.openapi.weather.WeatherResult;

@RestController
@RequestMapping("/weather")
public class WeatherProxyController {
	
	static Logger logger = LoggerFactory.getLogger(WeatherProxyController.class);
	private static final String SERVICE_KEY = "e27cfd2b-1ec1-3895-857a-104942ee2709";
	
	// SK Planet Open API
	@RequestMapping(value="/summary", method = RequestMethod.GET )
	public ResponseEntity<List<Map<String, Object>>> summary(@RequestParam("lat") Double lat, @RequestParam("lon") Double lon) {
		
		WeatherResult weatherResult = null;
		
		RestTemplate restTemplate = new RestTemplate();
		String baseURI = "http://apis.skplanetx.com/weather/summary"
							+ "?version=" + "1"
							+ "&appKey=" + SERVICE_KEY
							+ "&lat=" + lat
							+ "&lon=" + lon;

		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		weatherResult = restTemplate.getForObject(uri, WeatherResult.class);
		logger.info(weatherResult.toString());
		
		List<Map<String, Object>> summary = weatherResult.getWeather().getSummary();
		logger.info(summary.toString());
		
		return new ResponseEntity<List<Map<String, Object>>>(summary, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/forecast6days", method = RequestMethod.GET )
	public ResponseEntity<List<Map<String, Object>>> forecast6days(@RequestParam("lat") Double lat, @RequestParam("lon") Double lon) {
		
		WeatherResult weatherResult = null;
		
		RestTemplate restTemplate = new RestTemplate();
		String baseURI = "http://apis.skplanetx.com/weather/forecast/6days"
							+ "?version=" + "1"
							+ "&appKey=" + SERVICE_KEY
							+ "&foretxt="+"Y"
							+ "&lat=" + lat
							+ "&lon=" + lon;

		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		weatherResult = restTemplate.getForObject(uri, WeatherResult.class);
		logger.info(weatherResult.toString());
		
		List<Map<String, Object>> forecast6days = weatherResult.getWeather().getForecast6days();
		logger.info(forecast6days.toString());
		
		return new ResponseEntity<List<Map<String, Object>>>(forecast6days, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/forecast", method = RequestMethod.GET )
	public ResponseEntity<Weather> forecast(@RequestParam("lat") Double lat, @RequestParam("lon") Double lon) {
		
		WeatherResult weatherResult = null;
		WeatherResult forecastAll = null;
		
		RestTemplate restTemplate = new RestTemplate();
		
		// Summary
		String baseURI = "http://apis.skplanetx.com/weather/summary"
				+ "?version=" + "1"
				+ "&appKey=" + SERVICE_KEY
				+ "&lat=" + lat
				+ "&lon=" + lon;

		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		weatherResult = restTemplate.getForObject(uri, WeatherResult.class);
		logger.info(weatherResult.toString());
		
		forecastAll = weatherResult;
		
		// Forecast6Days
		baseURI = "http://apis.skplanetx.com/weather/forecast/6days"
							+ "?version=" + "1"
							+ "&appKey=" + SERVICE_KEY
							+ "&foretxt="+"Y"
							+ "&lat=" + lat
							+ "&lon=" + lon;

		uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		weatherResult = restTemplate.getForObject(uri, WeatherResult.class);
		logger.info(weatherResult.toString());
		
		forecastAll.getWeather().setForecast6days(weatherResult.getWeather().getForecast6days());
		Weather weatherAll = forecastAll.getWeather();
		
		logger.info("Add Icon");
		weatherAll = addIcon(weatherAll);
		return new ResponseEntity<Weather>(weatherAll, HttpStatus.OK);
		
	}
	
	private Weather addIcon(Weather weather) {
		
		List<Map<String,Object>> summary = weather.getSummary();
		List<Map<String,Object>> forecast6days = weather.getForecast6days();
		
		logger.info("Add Icon Summary");
		// Summary
		if(summary!=null) {
			Map<String,Map<String, String>> today 
						= (Map<String,Map<String, String>>) summary.get(0).get("today");
			Map<String,Map<String, String>> tomorrow 
						= (Map<String,Map<String, String>>) summary.get(0).get("tomorrow");
			Map<String,Map<String, String>> dayAfterTomorrow 
						= (Map<String,Map<String, String>>) summary.get(0).get("dayAfterTomorrow");
			
			weather.getSummary().get(0).put("today", selectSummaryIcon(today));
			weather.getSummary().get(0).put("tomorrow", selectSummaryIcon(tomorrow));
			weather.getSummary().get(0).put("dayAfterTomorrow", selectSummaryIcon(dayAfterTomorrow));
		}
		
		logger.info("Add Icon Forecast6Day");
		// Forecast6Day
		if(forecast6days!=null) {
			Map<String, String> sky
						= (Map<String, String>) forecast6days.get(0).get("sky");

			weather.getForecast6days().get(0).put("sky", selectForecast6DaysIcon(sky));
		}
		
		logger.info("return icons");
		return weather;
	}
	
	private Map<String, Map<String, String>> selectSummaryIcon(Map<String,Map<String, String>> day) {
		
		String name = day.get("sky").get("name");
		Date date = new Date();
		
		switch (name) {
		case "맑음":
			day.get("sky").put("icon", "/resources/img/weather_icons/01.png");
			break;
		case "구름조금":
			day.get("sky").put("icon", "/resources/img/weather_icons/02.png");
			break;
		case "구름많음":
			day.get("sky").put("icon", "/resources/img/weather_icons/03.png");
			break;
		case "흐림":
			day.get("sky").put("icon", "/resources/img/weather_icons/18.png");
			break;
		case "비":
			day.get("sky").put("icon", "/resources/img/weather_icons/21.png");
			break;
		case "눈":
			day.get("sky").put("icon", "/resources/img/weather_icons/32.png");
			break;
		case "비 또는 눈":
			day.get("sky").put("icon", "/resources/img/weather_icons/4.png");
			break;
		default:
			day.get("sky").put("icon", "/resources/img/weather_icons/38.png");
			break;
		}
		
		day.get("temperature").put("tmax", Double.valueOf(day.get("temperature").get("tmax")).intValue()+"");
		day.get("temperature").put("tmin", Double.valueOf(day.get("temperature").get("tmin")).intValue()+"");	
		
		return day;
	}
	
	private Map<String, String> selectForecast6DaysIcon(Map<String, String> sky) {
		
		boolean ampm = true;
	
		for (int i=2; i <= 10; i++) {
			
			String name = "";
			String icon = "";
			
			if(ampm) {
				icon = "amIcon" + i + "day";
				name = sky.get("amName" + i + "day");
			}
			else {
				icon = "pmIcon" + i + "day";
				name = sky.get("pmName" + i + "day");
			}
			
			switch (name) {
			case "맑음":
				sky.put(icon, "/resources/img/weather_icons/01.png");
				break;
			case "구름조금":
				sky.put(icon, "/resources/img/weather_icons/02.png");
				break;
			case "구름많음":
				sky.put(icon, "/resources/img/weather_icons/03.png");
				break;
			case "흐림":
				sky.put(icon, "/resources/img/weather_icons/18.png");
				break;
			case "비":
				sky.put(icon, "/resources/img/weather_icons/21.png");
				break;
			case "눈":
				sky.put(icon, "/resources/img/weather_icons/32.png");
				break;
			case "비 또는 눈":
				sky.put(icon, "/resources/img/weather_icons/4.png");
				break;
			default:
				sky.put(icon, "/resources/img/weather_icons/38.png");
				break;
			}
			
			if(i==10 && ampm){
				ampm = false;
				i = 1;
			}
			
		}
		
		return sky;
		
	}
	
//	@RequestMapping(value="/test", method = RequestMethod.GET )
//	public ResponseEntity<Body> test() {
//		
//		Result result = null;
//		
//		DateUtil date = new DateUtil();
//		String tmFc = date.gettmFc();
//		logger.info("tmFc = " + date.gettmFc());
//		
//		RestTemplate restTemplate = new RestTemplate();
//		String baseURI = "http://newsky2.kma.go.kr/service/MiddleFrcstInfoService/getMiddleLandWeather"
//							+ "?ServiceKey=" + SERVICE_KEY
//							+ "&regId=11B00000"				/* 서울,경기도,인천 */
//							+ "&tmFc=" + tmFc				/* 예보 발표 시각 */
//							+ "&numOfRows=10"
//							+ "&pageNo=1"
//							+ "&_type=json";
//
//		URI uri = URI.create(baseURI);
//		logger.info("request uri : " + uri);
//		
//		result = restTemplate.getForObject(uri, Result.class);
//		
//		Body body = result.getResponse().getBody();
//		
//		return new ResponseEntity<Body>(body, HttpStatus.OK);
//		
//	}
//
//	@RequestMapping(value="/middleFrcst", method = RequestMethod.GET )
//	public ResponseEntity<Body> MiddleFrcstInfo() {
//		
//		Result result = null;
//		Body body = null;
//		
//		DateUtil date = new DateUtil();
//		String tmFc = date.gettmFc();
//		logger.info("tmFc = " + date.gettmFc());
//		
//		RestTemplate restTemplate = new RestTemplate();
//		String baseURI = "http://newsky2.kma.go.kr/service/MiddleFrcstInfoService/getMiddleLandWeather"
//							+ "?ServiceKey=" + SERVICE_KEY
//							+ "&regId=11B00000"				/* 서울,경기도,인천 */
//							+ "&tmFc=" + tmFc				/* 예보 발표 시각 */
//							+ "&numOfRows=1"
//							+ "&pageNo=1"
//							+ "&_type=json";
//
//		URI uri = URI.create(baseURI);
//		logger.info("request uri : " + uri);
//		
//		result = restTemplate.getForObject(uri, Result.class);
//		logger.info(result.toString());
//		
//		body = result.getResponse().getBody();
//		logger.info(body.getItems().getItem().toString());
//		
//		return new ResponseEntity<Body>(body, HttpStatus.OK);
//		
//	}
}