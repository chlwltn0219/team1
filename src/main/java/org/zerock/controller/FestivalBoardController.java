package org.zerock.controller;



import java.net.URI;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.zerock.domain.SearchCriteria;
import org.zerock.openapi.Body;
import org.zerock.openapi.Results;
import org.zerock.util.DateUtil;

@Controller
@RequestMapping("/festival/*")
public class FestivalBoardController {
  private static final Logger logger = LoggerFactory.getLogger(FestivalBoardController.class);
//  private static final String SERVICE_KEY = "oMYSCkfnU%2BrM%2F6ad8zAICkGBj0eUCOxJc9bR%2F8MHuzhfo62P6cGA1YVZ7iY5QnDedVyfk5tMhc0Wu42fjDJ%2BcA%3D%3D";

  @RequestMapping(value = "/festival")
  public void festival(@ModelAttribute("cri") SearchCriteria cri, Model model){
//	  logger.info(cri.toString());
  }
  
  @RequestMapping(value = "/openAPI")
  public void openAPI(@ModelAttribute("cri") SearchCriteria cri, Model model){
	  logger.info(cri.toString());
  }
}
