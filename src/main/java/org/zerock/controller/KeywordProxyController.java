package org.zerock.controller;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLEncoder;
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
import org.zerock.openapi.tour.Body;
import org.zerock.openapi.tour.Items;
import org.zerock.openapi.tour.Result;
import org.zerock.util.DateUtil;

@RestController
@RequestMapping("/keyword")
public class KeywordProxyController {
	
	static Logger logger = LoggerFactory.getLogger(KeywordProxyController.class);
	private static final String SERVICE_KEY = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";
	
	@RequestMapping(value="/test2", method = RequestMethod.GET )
	public ResponseEntity<Body> test() throws UnsupportedEncodingException {
		
		Result result = null;
		
		DateUtil date = new DateUtil();
		String tmFc = date.gettmFc();
		logger.info("tmFc = " + date.gettmFc());
		String encordedKeyword = URLEncoder.encode("축제", "UTF-8");
		logger.info("tmFc = " + encordedKeyword);
		
		RestTemplate restTemplate = new RestTemplate();
		String baseURI = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword"
							+ "?ServiceKey=" + SERVICE_KEY
							+ "&arrange=c"
							+ "&contentTypeId=15"
							+ "&areaCode=1"
							+ "&keyword=" + encordedKeyword
							+ "&numOfRows=10"
							+ "&MobileOS=ETC"
							+ "&MobileApp=testApp"
							+ "&listYN=Y"
							+ "&pageNo=2"
							+ "&_type=json";

		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		result = restTemplate.getForObject(uri, Result.class);
		logger.info(result.toString());
		
		Body body = result.getResponse().getBody();
		logger.info(body.getItems().getItem().toString());
		
		return new ResponseEntity<Body>(body, HttpStatus.OK);
		
	}
	
	
}