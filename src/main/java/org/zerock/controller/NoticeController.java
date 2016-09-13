package org.zerock.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.BoardService;


@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Inject
	private BoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	
	@RequestMapping("/board")
	public String board(Locale locale , Model model){
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "notice/board";
	}
	@RequestMapping("/readpage")
	public void readpage(@RequestParam("bno") int bno,Locale locale , Model model) throws Exception{
		logger.info("Welcome home! The client locale is {}.", locale);
		
		model.addAttribute(service.read(bno));
		
		
//		return "notice/readpage";
	}
	@RequestMapping(value="/register" , method=RequestMethod.GET )
	public void registerGET(Locale locale , Model model){
		logger.info("Welcome home! The client locale is {}.", locale);
		
//		return "notice/register";
	}
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception{
		
		logger.info("regist post ...........");
	    logger.info(board.toString());

	    service.regist(board);

	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect://notice/board";
		
	}
	
	
}
