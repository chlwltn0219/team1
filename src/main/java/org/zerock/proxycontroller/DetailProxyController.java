package org.zerock.proxycontroller;

import java.net.URI;
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
import org.zerock.jboardobj.Info;
import org.zerock.openapi.Body;
import org.zerock.openapi.Items;
import org.zerock.openapi.Result;
import org.zerock.openapi.SingleBody;
import org.zerock.openapi.SingleItems;
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
	public ResponseEntity<Body> image(@RequestParam Integer contentId) {
		
		Result result = null;
		
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
		
		result = restTemplate.getForObject(uri, Result.class);
		
		Body body = result.getResponse().getBody();
		System.out.println("items = " + body.getItems().getItem());

		return new ResponseEntity<Body>(body, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/jboardInfo", method = RequestMethod.GET )
	public ResponseEntity<Info> jboardInfo(@RequestParam Integer contentId, @RequestParam Integer contentTypeId) {
		
		SingleResult commonResult = null;
		SingleResult introResult = null;
		Result imageResult = null;
		
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
		imageResult = restTemplate.getForObject(uri, Result.class);
		List<Map<String, Object>> imageItems = imageResult.getResponse().getBody().getItems().getItem();
		logger.info("image items : " + imageItems);
		
//		Map<String, Object> rtn = new HashMap<String, Object>();
//		
//		rtn.put("common", commonItems);
//		rtn.put("intro", introItems);
//		rtn.put("image", imageItems);
		
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
		
		// image, homepage, title, overview
		info.setImage(imageItems);
		info.setHomepage((String)commonItems.get("homepage"));
		info.setTitle((String)commonItems.get("title"));
		info.setTel((String)commonItems.get("tel"));
		info.setOverview((String)commonItems.get("overview"));
		
		
		return new ResponseEntity<Info>(info, HttpStatus.OK);

	}
	
}