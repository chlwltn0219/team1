package org.zerock.proxycontroller;

import java.net.URI;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.openapi.Body;
import org.zerock.openapi.Result;
import org.zerock.util.AreaUtil;
import org.zerock.util.DateUtil;

@RestController
@RequestMapping("/festival")
public class FestivalProxyController {
	
	static Logger logger = LoggerFactory.getLogger(FestivalProxyController.class);
	private static final String SERVICE_KEY = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";
			
	@RequestMapping(value="/list", method = RequestMethod.GET )
	public ResponseEntity<Body> test(@RequestParam Integer sigunguCode) {
		
		Result result = null;
		
		RestTemplate restTemplate = new RestTemplate();
		String baseURI = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival"
							+ "?ServiceKey=" + SERVICE_KEY
							+ "&numOfRows=9"
							+ "&areaCode=1"
							+ "&sigunguCode=" + sigunguCode
//							+ "&pageNo=" + page
							+ "&pageNo=1"
							+ "&MobileOS=ETC"
							+ "&MobileApp=TestApp"
							+ "&_type=json";

		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		result = restTemplate.getForObject(uri, Result.class);
		
		Body body = result.getResponse().getBody();
		System.out.println("items = " + body.getItems().getItem());
		
		
		return new ResponseEntity<Body>(body, HttpStatus.OK);
		
//		logger.info(cri.toString());
//
//		model.addAttribute("list", service.listSearchCriteria(cri));
//
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
//
//		pageMaker.setTotalCount(items.totalCount);
//
//		model.addAttribute("pageMaker", pageMaker);
		
	}	
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public ResponseEntity<Body> test123(){
		
		Result result = null;
		
		RestTemplate restTemplate = new RestTemplate();
		String baseURI = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival"
							+ "?ServiceKey=" + SERVICE_KEY
							+ "&areaCode=1"
							+ "&numOfRows=20"
							+ "&pageNo=1"
							+ "&MobileOS=ETC"
							+ "&MobileApp=TestApp"
							+ "&_type=json";

		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		result = restTemplate.getForObject(uri, Result.class);
		
		Body body = result.getResponse().getBody();
		System.out.println("items = " + body.getItems().getItem());
		
		
		return new ResponseEntity<Body>(body, HttpStatus.OK);
	}
}