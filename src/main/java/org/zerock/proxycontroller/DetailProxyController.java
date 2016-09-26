package org.zerock.proxycontroller;

import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
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
import org.zerock.openapi.tour.Body;
import org.zerock.openapi.tour.CheckResult;
import org.zerock.openapi.tour.Info;
import org.zerock.openapi.tour.Result;
import org.zerock.openapi.tour.SingleBody;
import org.zerock.openapi.tour.SingleResult;
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
		
		SingleBody body = result.getResponse().getBody();
		System.out.println("items = " + body.getItems().getItem());

		return new ResponseEntity<SingleBody>(body, HttpStatus.OK);
		
	}

	@RequestMapping(value="/info", method = RequestMethod.GET )
	public ResponseEntity<Body> info(@RequestParam Integer contentId, @RequestParam Integer contentTypeId) {
		
		Result result = null;
		
		RestTemplate restTemplate = new RestTemplate();
		String baseURI = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo"
							+ "?ServiceKey=" + SERVICE_KEY
							+ "&contentId=" + contentId
							+ "&contentTypeId=" + contentTypeId
							+ "&MobileOS=ETC"
							+ "&MobileApp=AppTesting"
							+ "&_type=json";
					
		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		result = restTemplate.getForObject(uri, Result.class);
		
		Body body = result.getResponse().getBody();
		System.out.println("items = " + body.getItems().getItem());

		return new ResponseEntity<Body>(body, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/image", method = RequestMethod.GET )
	public ResponseEntity<Object> image(@RequestParam Integer contentId) {
		
		CheckResult checkResult = null;
		Result result = null;
		SingleResult singleResult = null;
		
		RestTemplate restTemplate = new RestTemplate();
		String baseURI = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage"
							+ "?ServiceKey=" + SERVICE_KEY
							+ "&contentId=" + contentId
							+ "&imageYN=Y"
							+ "&MobileOS=ETC"
							+ "&MobileApp=AppTesting"
							+ "&_type=json";
					
		URI uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		
		checkResult = restTemplate.getForObject(uri, CheckResult.class);
		
		if(checkResult.getResponse().getBody().getTotalCount()>1) {
			result = restTemplate.getForObject(uri, Result.class);
			
			Body body = result.getResponse().getBody();
			System.out.println("items = " + body.getItems().getItem());

			return new ResponseEntity<Object>(body, HttpStatus.OK);
		} else if (checkResult.getResponse().getBody().getTotalCount() == 1) {
			singleResult = restTemplate.getForObject(uri, SingleResult.class);
			
			SingleBody body = singleResult.getResponse().getBody();
			System.out.println("items = " + body.getItems().getItem());

			return new ResponseEntity<Object>(body, HttpStatus.OK);
		} else {
			return null;
		}

		
	}
	
	@RequestMapping(value="/jboardInfo", method = RequestMethod.GET )
	public ResponseEntity<Info> jboardInfo(@RequestParam Integer contentId, @RequestParam Integer contentTypeId) {
		
		SingleResult commonResult = null;
		SingleResult introResult = null;
		Result imageResult = null;
		SingleResult singleImageResult = null;
		
		List<String> imageList = new ArrayList<>();
		
		Info info = new Info();
		
		RestTemplate restTemplate = new RestTemplate();
		
		// Get DetailCommon
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
		commonResult = restTemplate.getForObject(uri, SingleResult.class);
		Map<String, Object> commonItems = commonResult.getResponse().getBody().getItems().getItem();
		logger.info("common items : " + commonItems);
		
		Object commonImage = commonItems.get("firstimage");
		if(commonImage!=null)
			imageList.add((String) commonItems.get("firstimage"));
		
		// Get DetailIntro
		baseURI = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro"
				+ "?ServiceKey=" + SERVICE_KEY
				+ "&contentId=" + contentId
				+ "&contentTypeId=" + contentTypeId
				+ "&MobileOS=ETC"
				+ "&MobileApp=AppTesting"
				+ "&_type=json";
		
		uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		introResult = restTemplate.getForObject(uri, SingleResult.class);
		Map<String, Object> introItems = introResult.getResponse().getBody().getItems().getItem();
		logger.info("intro items : " + introItems);
		
		// Get DetailImage
		baseURI = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage"
							+ "?ServiceKey=" + SERVICE_KEY
							+ "&contentId=" + contentId
							+ "&imageYN=Y"
							+ "&MobileOS=ETC"
							+ "&MobileApp=AppTesting"
							+ "&_type=json";
					
		uri = URI.create(baseURI);
		logger.info("request uri : " + uri);
		CheckResult checkResult = restTemplate.getForObject(uri, CheckResult.class);
		
		if(checkResult.getResponse().getBody().getTotalCount()>1) {
			imageResult = restTemplate.getForObject(uri, Result.class);
			List<Map<String, Object>> imageItems = imageResult.getResponse().getBody().getItems().getItem();
			logger.info("image items : " + imageItems);
			
			for(int i=0; i<imageItems.size(); i++) {
				imageList.add((String) imageItems.get(i).get("originimgurl"));
			}
		} else if (checkResult.getResponse().getBody().getTotalCount() == 1) {
			singleImageResult = restTemplate.getForObject(uri, SingleResult.class);
			Map<String, Object> singleImageItems = singleImageResult.getResponse().getBody().getItems().getItem();
			logger.info("image items : " + singleImageItems);
			
			imageList.add((String) singleImageItems.get("originimgurl"));
		} 
		
		//image
		info.setImage(imageList);
		
		// location
		Map<String, Object> loc = new HashMap<String, Object>();
		loc.put("mapx", commonItems.get("mapx"));
		loc.put("mapy", commonItems.get("mapy"));
		loc.put("mlevel", commonItems.get("mlevel"));
		loc.put("addr1", commonItems.get("addr1"));
		loc.put("playtime", introItems.get("playtime"));
		loc.put("eventplace", introItems.get("eventplace"));
		info.setLocation(loc);
		
		// cost
		Map<String, Object> cost = new HashMap<String, Object>();
		cost.put("usetimefestival", introItems.get("usetimefestival"));
		cost.put("discountinfofestival", introItems.get("discountinfofestival"));
		info.setCost(cost);

		// programs
		Map<String, Object> prog = new HashMap<String, Object>();
		prog.put("program", introItems.get("program"));
		prog.put("subevent", introItems.get("subevent"));
		info.setPrograms(prog);
		
		// homepage, title, overview, playtime
		info.setHomepage((String)commonItems.get("homepage"));
		info.setTitle((String)commonItems.get("title"));
		info.setTel((String)commonItems.get("tel"));
		info.setOverview((String)commonItems.get("overview"));
		info.setPlaytime((String)introItems.get("playtime"));
		
		return new ResponseEntity<Info>(info, HttpStatus.OK);

	}
	
}