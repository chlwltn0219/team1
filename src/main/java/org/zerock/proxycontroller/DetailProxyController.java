package org.zerock.proxycontroller;

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
import org.zerock.openapi.Body;
import org.zerock.openapi.Result;
import org.zerock.openapi.SingleBody;
import org.zerock.openapi.SingleResult;
import org.zerock.util.DateUtil;

@RestController
@RequestMapping("/detail")
public class DetailProxyController {
	
	static Logger logger = LoggerFactory.getLogger(DetailProxyController.class);
	private static final String SERVICE_KEY = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";
	DateUtil date = new DateUtil();
	
	@RequestMapping(value="/common", method = RequestMethod.GET )
	public ResponseEntity<SingleBody> common(@RequestParam Integer contentId) {
		
		SingleResult result = null;
		
		RestTemplate restTemplate = new RestTemplate();
		String baseURI = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"
							+ "?ServiceKey=" + SERVICE_KEY
							+ "&contentId=" + contentId
							+ "&defaultYN=Y"
							+ "&firstImageYN=Y"
							+ "&addrinfoYN=Y"
							+ "&mapinfoYN=Y"
							+ "&overviewYN=Y"
							+ "&MobileOS=ETC"
							+ "&MobileApp=AppTesting"
							+ "&_type=json";
					
		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		result = restTemplate.getForObject(uri, SingleResult.class);
		logger.info(result.toString());
		
		SingleBody body = result.getResponse().getBody();
		System.out.println("items = " + body.getItems().getItem());

		return new ResponseEntity<SingleBody>(body, HttpStatus.OK);
		
	}

	@RequestMapping(value="/intro", method = RequestMethod.GET )
	public ResponseEntity<SingleBody> intro(@RequestParam Integer contentId, @RequestParam Integer contentTypeId) {
		
		SingleResult result = null;
		
		RestTemplate restTemplate = new RestTemplate();
		String baseURI = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro"
							+ "?ServiceKey=" + SERVICE_KEY
							+ "&contentId=" + contentId
							+ "&contentTypeId=" + contentTypeId
							+ "&MobileOS=ETC"
							+ "&MobileApp=AppTesting"
							+ "&_type=json";
					
		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		result = restTemplate.getForObject(uri, SingleResult.class);
		logger.info(restTemplate.getForObject(uri, String.class));
		
		SingleBody body = result.getResponse().getBody();
		System.out.println("items = " + body.getItems().getItem());

		return new ResponseEntity<SingleBody>(body, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/image", method = RequestMethod.GET )
	public ResponseEntity<Body> image(@RequestParam Integer contnetId) {
		
		Result result = null;
		
		RestTemplate restTemplate = new RestTemplate();
		String baseURI = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage"
							+ "?ServiceKey=" + SERVICE_KEY
							+ "&contentId=" + contnetId
							+ "&imageYN=Y"
							+ "&MobileOS=ETC"
							+ "&MobileApp=AppTesting"
							+ "&_type=json";
					
		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		result = restTemplate.getForObject(uri, Result.class);
		logger.info(restTemplate.getForObject(uri, String.class));
		
		Body body = result.getResponse().getBody();
		System.out.println("items = " + body.getItems().getItem());

		return new ResponseEntity<Body>(body, HttpStatus.OK);
		
	}
	
}