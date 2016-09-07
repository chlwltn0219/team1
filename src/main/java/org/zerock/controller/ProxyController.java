package org.zerock.controller;

import java.net.URI;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/proxy")
public class ProxyController {
	
	static Logger logger = LoggerFactory.getLogger(ProxyController.class);
	
	Object obj ;
	
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
