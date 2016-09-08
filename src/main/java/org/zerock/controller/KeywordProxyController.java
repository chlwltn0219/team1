package org.zerock.controller;

import java.net.URI;
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
import org.zerock.openapi.Body;
import org.zerock.openapi.Items;
import org.zerock.openapi.Result;
import org.zerock.util.DateUtil;

@RestController
@RequestMapping("/content")
public class KeywordProxyController {
	
	static Logger logger = LoggerFactory.getLogger(KeywordProxyController.class);
	private static final String SERVICE_KEY = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";
	
	@RequestMapping(value="/test", method = RequestMethod.GET )
	public ResponseEntity<Body> test(@RequestParam String keyword) {
		
		Result result = null;
		
		DateUtil date = new DateUtil();
		String tmFc = date.gettmFc();
		logger.info("tmFc = " + date.gettmFc());
		
		RestTemplate restTemplate = new RestTemplate();
		String baseURI = "http://newsky2.kma.go.kr/service/MiddleFrcstInfoService/searchKeyword"
							+ "?ServiceKey=" + SERVICE_KEY
							+ "&regId=11B00000"				/* 서울,경기도,인천 */
							+ "&arrange=d"
							+ "&numOfRows=1"
							+ "&MobileOS=ETC"
							+ "&listYN=Y"
							+ "&pageNo=1"
							+ "&_type=json";

		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		result = restTemplate.getForObject(uri, Result.class);
		logger.info(restTemplate.getForObject(uri, String.class));
		
		Body body = result.getResponse().getBody();
		
		return new ResponseEntity<Body>(body, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/middleFrcst", method = RequestMethod.GET )
	public ResponseEntity<Body> MiddleFrcstInfo() {
		
		Result result = null;
		Body body = null;
		
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
		logger.info(result.toString());
		
		body = result.getResponse().getBody();
		logger.info(body.toString());
		
		return new ResponseEntity<Body>(body, HttpStatus.OK);
		
	}
	
}