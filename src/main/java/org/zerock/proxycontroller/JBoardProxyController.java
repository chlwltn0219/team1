package org.zerock.proxycontroller;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLEncoder;
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
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.openapi.Body;
import org.zerock.openapi.Result;
import org.zerock.openapi.SingleBody;
import org.zerock.openapi.SingleResult;
import org.zerock.util.DateUtil;

@RestController
@RequestMapping("/jboard")
public class JBoardProxyController {
	
	static Logger logger = LoggerFactory.getLogger(JBoardProxyController.class);
	private static final String SERVICE_KEY = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";
	DateUtil date = new DateUtil();
	
	@RequestMapping(value="/nearFestival", method = RequestMethod.GET )
	public ResponseEntity<Body> nearFestival() {
		
		Result result = null;
		Map<String, String> eventDate = date.getFestivalDate();
		logger.info("eventStartDate = " + eventDate.get("eventStartDate"));
		logger.info("eventEndDate = " + eventDate.get("eventEndDate"));
		
		RestTemplate restTemplate = new RestTemplate();
		String baseURI = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival"
							+ "?ServiceKey=" + SERVICE_KEY
							+ "&numOfRows=6"
							+ "&pageNo=1"
							+ "&arrange=B"
							+ "&MobileOS=ETC"
							+ "&MobileApp=TestApp"
							+ "&_type=json"
							+ "&eventStartDate=" + eventDate.get("eventStartDate")
							+ "&eventEndDate=" + eventDate.get("eventEndDate")
							+ "&listYN=Y"
							+ "&areaCode=1";
					

		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		result = restTemplate.getForObject(uri, Result.class);
		logger.info(restTemplate.getForObject(uri, String.class));
		
		Body body = result.getResponse().getBody();
		System.out.println("items = " + body.getItems().getItem());

		return new ResponseEntity<Body>(body, HttpStatus.OK);
		
	}	
	
	@RequestMapping(value="/keywordFestival", method = RequestMethod.GET )
	public ResponseEntity<Body> keywordFestival(@RequestParam String keyword, @RequestParam Integer pageNo) throws UnsupportedEncodingException {
		
		Result result = null;
		
		String encordedKeyword = URLEncoder.encode(keyword, "UTF-8");
		
		RestTemplate restTemplate = new RestTemplate();
		String baseURI = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword"
							+ "?ServiceKey=" + SERVICE_KEY
							+ "&_type=json"
							+ "&keyword=" + encordedKeyword
							+ "&contentTypeId=15"
							+ "&arrange=B"
							+ "&listYN=Y"
							+ "&pageNo=" + pageNo
							+ "&numOfRows=10"
							+ "&MobileOS=ETC"
							+ "&MobileApp=AppTesting"
							+ "&areaCode=1";
					

		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		result = restTemplate.getForObject(uri, Result.class);
		logger.info(restTemplate.getForObject(uri, String.class));
		
		Body body = result.getResponse().getBody();
		System.out.println("items = " + body.getItems().getItem());

		return new ResponseEntity<Body>(body, HttpStatus.OK);
		
	}	
	
	@RequestMapping(value="/threeMonth", method = RequestMethod.GET )
	public ResponseEntity<Body> threeMonth(@RequestParam Integer pageNo) {
		
		Result result = null;
		Map<String, Integer> eventDate = date.getThreeMonth();
		logger.info("eventStartDate = " + eventDate.get("eventStartDate"));
		logger.info("eventEndDate = " + eventDate.get("eventEndDate"));
		
		RestTemplate restTemplate = new RestTemplate();
		String baseURI = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival"
							+ "?ServiceKey=" + SERVICE_KEY
							+ "&numOfRows=" + "10"
							+ "&pageNo=" + pageNo
							+ "&arrange=" + "B"
							+ "&MobileOS=ETC"
							+ "&MobileApp=TestApp"
							+ "&_type=json"
							+ "&eventStartDate=" + eventDate.get("eventStartDate")
							+ "&eventEndDate=" + eventDate.get("eventEndDate")
							+ "&listYN=Y"
							+ "&areaCode=" + "1";
					

		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		result = restTemplate.getForObject(uri, Result.class);
		logger.info(result.toString());
		
		Body body = result.getResponse().getBody();
		System.out.println("items = " + body.getItems().getItem());
		
		List<Map<String, Object>> item = body.getItems().getItem(); 
		
		for(int i=0; i<item.size(); i++) {
			item.get(i).put("today", date.getToday());
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(new Criteria());
		pageMaker.setDisplayPageNum(5);
		pageMaker.setTotalCount(body.getTotalCount());
		
		body.setPageMaker(pageMaker);
		
		return new ResponseEntity<Body>(body, HttpStatus.OK);
		
	}
	
	
}