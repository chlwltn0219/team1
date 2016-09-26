package org.zerock.proxycontroller;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.openapi.tour.Body;
import org.zerock.openapi.tour.CheckBody;
import org.zerock.openapi.tour.CheckResult;
import org.zerock.openapi.tour.Items;
import org.zerock.openapi.tour.Response;
import org.zerock.openapi.tour.Result;
import org.zerock.openapi.tour.SingleResult;

@RestController
@RequestMapping("/place")
public class PlaceProxyController {
	
	static Logger logger = LoggerFactory.getLogger(PlaceProxyController.class);
	private static final String SERVICE_KEY = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";
			
	@RequestMapping(value="/common", method = RequestMethod.GET )
	public ResponseEntity<Body> test(@ModelAttribute("cri") SearchCriteria cri, @RequestParam Integer sigunguCode, @RequestParam Integer pageNo) {
		
		CheckResult checkResult = null;
		SingleResult singleResult = null;
		Result result = null;
		
		RestTemplate restTemplate = new RestTemplate();
		String baseURI = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList"
							+ "?ServiceKey=" + SERVICE_KEY
							+ "&numOfRows=15"
							+ "&areaCode=1"
							+ "&sigunguCode=" + sigunguCode
							+ "&pageNo=" + pageNo
							+ "&contentTypeId=" + "12"
							+ "&MobileOS=ETC"
							+ "&MobileApp=AppTesting"
							+ "&_type=json";

		URI uri = URI.create(baseURI);
		logger.info(uri.toString());
		
		checkResult = restTemplate.getForObject(uri, CheckResult.class);
		CheckBody checkBody = checkResult.getResponse().getBody();
		
		if((checkBody.getTotalCount()%checkBody.getNumOfRows() < 2) && (pageNo == checkBody.getTotalCount()/checkBody.getNumOfRows() + 1)) {
			logger.info("Single Result");
			singleResult = restTemplate.getForObject(uri, SingleResult.class);
			
			result = new Result();
			result.setResponse(new Response());
			result.getResponse().setHeader(singleResult.getResponse().getHeader());
			result.getResponse().setBody(new Body());
			
			List<Map<String, Object>> item = new ArrayList<>();
			item.add(singleResult.getResponse().getBody().getItems().getItem());
			result.getResponse().getBody().setItems(new Items());
			result.getResponse().getBody().getItems().setItem(item);
			
			result.getResponse().getBody().setNumOfRows(singleResult.getResponse().getBody().getNumOfRows());
			result.getResponse().getBody().setPageNo(singleResult.getResponse().getBody().getPageNo());
			result.getResponse().getBody().setTotalCount(singleResult.getResponse().getBody().getTotalCount());
		} else {
			result = restTemplate.getForObject(uri, Result.class);
			logger.info(result.toString());
		}
		//
		Body body = result.getResponse().getBody();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(new Criteria(body.getPageNo(), body.getNumOfRows()));
		pageMaker.setDisplayPageNum(5);
		pageMaker.setTotalCount(body.getTotalCount());
		
		body.setPageMaker(pageMaker);

		System.out.println(body.getPageNo());
		System.out.println(pageMaker);
		
		return new ResponseEntity<Body>(body, HttpStatus.OK);
		
	}	
}