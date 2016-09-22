package org.zerock.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.UserVO;
import org.zerock.service.UserService;

@RestController
@RequestMapping("/check")
public class CheckIDController {
	
	static Logger logger = LoggerFactory.getLogger(CheckIDController.class);
	
	@Inject
	private UserService service;

	@RequestMapping(value = "/dup", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Boolean>> list(@RequestParam("uid") String uid) {

		ResponseEntity<Map<String, Boolean>> entity = null;
		Map<String, Boolean> rtn = new HashMap<>(); 
		UserVO who = null;
		
		try {
			who = service.checkID(uid); 
			if(who==null) {
				rtn.put("IDchecking", true);
			
			System.out.println(rtn.get("avaluable"));
			
			} else {
				rtn.put("IDchecking", false);
			
			System.out.println(rtn.get("disavaluable"));
			
			}
			entity = new ResponseEntity<>(rtn, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

}
