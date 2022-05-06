package com.wewishwell.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wewishwell.shop.service.AdminEventService;
import com.wewishwell.shop.vo.EventBoardVO;

@Controller
public class AdminEventController {

	@Autowired
	AdminEventService aes;
	
	@GetMapping("/adminEvent")
	public ModelAndView selectEventList(){
		
		List<EventBoardVO> selectEventList = aes.selectEventList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", selectEventList);
		mav.setViewName("admin/adminEvent");
		
		return mav;
	}
	
	@GetMapping("/adminEventInsert")
	public String adminEventInsert() {
		return "admin/adminEventInsert";
	}
	
	@PostMapping("/adminEventInsert")
	public ModelAndView insertEvent(EventBoardVO vo) {
		int rs = aes.insertEvent(vo);
		ModelAndView mav = new ModelAndView();
		if(rs == 1) {
			mav.setViewName("redirect:/adminEvent");
		} else {
			mav.setViewName("admin/adminEventInsert");
		}
		return mav;
	}
	
	@GetMapping("/adminEventUpdate")
	public ModelAndView updateEvent(String seq) {
		// System.out.println(seq);
		
		EventBoardVO adminEventDetail = aes.adminEventDetail(seq);
		// System.out.println(adminEventDetail);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", adminEventDetail);
		mav.setViewName("admin/adminEventUpdate");
		return mav;
	}
	
	@PostMapping("/adminEventUpdate")
	public ModelAndView updateEventPost(EventBoardVO vo) {
		
		int rs = aes.updateEvent(vo);
		ModelAndView mav = new ModelAndView();
		if(rs == 1) {
			mav.setViewName("redirect:/adminEvent");
		} else {
			mav.setViewName("redirect:/adminEventUpdate?seq=" + vo.getSeq());
		}
		return mav;
	}
	
	@GetMapping("/deleteEvent")
	public String deleteEvent(EventBoardVO vo) {
		// System.out.println("deleteEvent" + vo);
		aes.deleteEvent(vo);
		return "redirect:/adminEvent";
	}
	
}	