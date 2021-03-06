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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.zerock.domain.SearchCriteria;
import org.zerock.openapi.tour.Body;
import org.zerock.openapi.tour.Result;
import org.zerock.util.DateUtil;

@Controller
@RequestMapping("/festival/*")
public class FestivalBoardController {

	private static final Logger logger = LoggerFactory.getLogger(FestivalBoardController.class);

	@RequestMapping(value = "/festival")
	public void festival(@ModelAttribute("cri") SearchCriteria cri, Model model) {
		// logger.info(cri.toString());
	}

	@RequestMapping(value = "/fRead", method = RequestMethod.GET)
	public void read(@RequestParam("contentid") int contentid, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		model.addAttribute("contentid", contentid);
	}

	@RequestMapping(value = "/openAPI")
	public void openAPI(@ModelAttribute("cri") SearchCriteria cri, Model model) {
		logger.info(cri.toString());
	}
}
