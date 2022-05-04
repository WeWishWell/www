package com.wewishwell.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wewishwell.shop.service.EventService;
import com.wewishwell.shop.vo.EventBoardVO;
import com.wewishwell.shop.vo.EventReplyVO;

@Controller
public class EventController {

	@Autowired
	EventService es;
	
	@GetMapping("/event")
	public String event() {
		return "event";
	}
	
	@GetMapping("/eventListWinner")
	public ModelAndView eventListWinner(String searchType, String keyword){
		ModelAndView mav = new ModelAndView();
		Map<String, String> search = new HashMap<String, String>();
		
		if(searchType != null) {
			search.put("searchType", searchType);
			search.put("keyword", keyword);
			
			// service
			List<EventBoardVO> eventSearch = es.eventSearch(search);
			
			mav.addObject("data", eventSearch);
			mav.setViewName("eventListWinner");
		} else {
			List<EventBoardVO> eventListWinner = es.eventListWinner();
			mav.addObject("data", eventListWinner);
			mav.setViewName("eventListWinner");
		}
		
		return mav;
	}
	
	@GetMapping("/eventListOn")
	public ModelAndView eventListOn(String check){
		ModelAndView mav = new ModelAndView();
		
		if(check.equals("do")) {
			List<EventBoardVO> eventListOn = es.eventListOn();
			mav.addObject("data", eventListOn);
			mav.setViewName("eventListOn");
		} else {
			List<EventBoardVO> eventListEnd = es.eventListEnd();
			mav.addObject("data", eventListEnd);
			mav.setViewName("eventListEnd");
		}
		return mav;
	}
	
	@GetMapping("/eventDetailWinner")
	public ModelAndView eventDetailWinner(EventBoardVO vo) {
		// service
		EventBoardVO eventDetailWinner = es.eventDetailWinner(vo);
		// System.out.println(eventDetailWinner);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", eventDetailWinner); // request.setAttribute("data",list)
		mav.setViewName("eventDetailWinner"); // jsp
		return mav;
	}
	
	@GetMapping("/eventDetail")
	public ModelAndView eventDetail(EventBoardVO vo) {
		// service
		EventBoardVO eventDetail = es.eventDetail(vo);
		// System.out.println(eventDetail);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", eventDetail); // request.setAttribute("data",list)
		mav.setViewName("eventDetail"); // jsp
		
		// reply list
		List<EventReplyVO> selectReplyList = es.selectReplyList(vo.getSeq());
		mav.addObject("reply", selectReplyList);
		return mav;
	}
	

	@GetMapping("/insertEvent")
	public String insertEvent(EventBoardVO vo) {
		return "insertEvent";
	}
	
	@PostMapping("/insertEvent")
	public ModelAndView insertEventPost(EventBoardVO vo) {
		// service
		int rs = es.insertEvent(vo);
		ModelAndView mav = new ModelAndView();
		if(rs == 1) {
			mav.setViewName("eventList");
		} else {
			mav.setViewName("insertEvent");
		}
		return mav;
	}
		
	@GetMapping("/updateEvent")
	public ModelAndView updateEvent(EventBoardVO vo) {
		EventBoardVO detailMap = es.eventDetail(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", detailMap);
		mav.setViewName("updateEvent");
		return mav;
	}	
		
	@PostMapping("/updateEvent")
	public ModelAndView updateEventPost(EventBoardVO vo) {
		// service
		int rs = es.updateEvent(vo);
		ModelAndView mav = new ModelAndView();
		if(rs == 1) {
			mav.setViewName("eventList");
		} else {
			mav.setViewName("redirect:/updateEvent?seq=" + vo.getSeq());
		}
		return mav;
	}
	
	@GetMapping("/deleteEvent")
	public ModelAndView deleteEvent(EventBoardVO vo) {
		// service
		ModelAndView mav = new ModelAndView();
		int rs = es.deleteEvent(vo);
		if(rs == 1) {
			mav.setViewName("eventList");
		} else {
			mav.setViewName("redirect:/updateEvent?seq=" + vo.getSeq());
		}
		return mav;
	}
	
}
