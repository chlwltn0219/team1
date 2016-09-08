package org.zerock.controller;

import java.net.URI;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.zerock.domain.ItemsVO;
import org.zerock.openapi.Result;
import org.zerock.util.DateUtil;

@RestController
@RequestMapping("/content")
public class ProxyController {
	
	static Logger logger = LoggerFactory.getLogger(ProxyController.class);
	private static final String SERVICE_KEY = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";
	
	@RequestMapping(value="/middleFrcst", method = RequestMethod.GET )
	public ResponseEntity<Result> MiddleFrcstInfo() {
		
		Result result = null;
		
		DateUtil date = new DateUtil();
		String tmFc = date.gettmFc();
		logger.info("tmFc = " + date.gettmFc());
		
		RestTemplate restTemplate = new RestTemplate();
		String baseURI = "http://newsky2.kma.go.kr/service/MiddleFrcstInfoService/getMiddleLandWeather"
							+ "?ServiceKey=" + SERVICE_KEY
							+ "&regId=11B00000"				/* 서울,경기도,인천 */
							+ "&tmFc=" + tmFc				/* 예보 발표 시각 */
							+ "&numOfRows=1"
							+ "&pageNo=1"
							+ "&_type=json";

		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		result = restTemplate.getForObject(uri, Result.class);
		logger.info(restTemplate.getForObject(uri, String.class));
		
		return new ResponseEntity<Result>(result, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/festivalList", method = RequestMethod.GET )
	public ResponseEntity<ItemsVO> getFestivalList(
			@RequestParam String eventStartDate, @RequestParam String eventEndDate) {
		
		RestTemplate restTemplate = new RestTemplate();
		ItemsVO items = null;

		String serviceKey = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";
		String baseURI = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival"
						+ "?ServiceKey=" + serviceKey
						+ "&eventStartDate=" + eventStartDate
						+ "&eventEndDate=" + eventEndDate
						+ "&areaCode=1"			/* Seoul */	
						+ "&arrange=D"			/* arrange : insert date*/	
						+ "&listYN=Y"
						+ "&pageNo=1"
						+ "&numOfRows=10"
						+ "&MobileOS=ETC"
						+ "&MobileApp=AppTesting"
						+ "&_type=json";		/* return type */	

		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		String str = restTemplate.getForObject(uri, String.class);
		logger.info("return "+ str);
		
		items = restTemplate.getForObject(uri, ItemsVO.class);
		logger.info("return "+ items);
		
		return new ResponseEntity<ItemsVO>(items, HttpStatus.OK);
	}
	
	@RequestMapping(value="/json", method = RequestMethod.GET )
	public ResponseEntity<String> getJSON() {
		
		String str = null;
		
		RestTemplate restTemplate = new RestTemplate();
		String serviceKey = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";

		String baseURI = "http://newsky2.kma.go.kr/service/MiddleFrcstInfoService/getMiddleForecast"
							+ "?ServiceKey=" + serviceKey
							+ "&stnId=108"
							+ "&tmFc=201609050600"
							+ "&_type=json";

		URI uri = URI.create(baseURI);
		
		logger.info("request uri : " + uri);
		
		str = restTemplate.getForObject(uri, String.class);
		
		logger.info(str);
		
		return new ResponseEntity<String>(str, HttpStatus.OK);
	}
	
	@RequestMapping(value="/json2", method = RequestMethod.GET )
	public ResponseEntity<String> getJSON2() {
		
		ResponseEntity<String> entity = null;
		
		RestTemplate restTemplate = new RestTemplate();
		String serviceKey = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";

		String baseURI = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode"
						+ "?ServiceKey=" + serviceKey
						+ "&MobileOS=ETC"
						+ "&MobileApp=testApp"
						+ "&_type=json";

		URI uri = URI.create(baseURI);
		
		logger.info("request uri : " + uri);
		
		entity = restTemplate.getForEntity(uri, String.class);
		
		logger.info(entity.toString());
		
		return entity;
	}
}
