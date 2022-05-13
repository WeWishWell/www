package com.wewishwell.shop.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.wewishwell.shop.common.Pagination;
import com.wewishwell.shop.service.AdminEventService;
import com.wewishwell.shop.vo.EventBoardVO;

@Controller
public class AdminEventController {

	@Autowired
	AdminEventService aes;
	
	private boolean isThisAdmin() {
		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession s = req.getSession();
		if(s.getAttribute("roleCheck") == null) {
			return false;
		} else {
			return true;
		}
	}
	
	@GetMapping("/adminEvent")
	public ModelAndView selectEventList(@RequestParam Map<String, Object> map, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range){
		ModelAndView mav = new ModelAndView();
		
		if(isThisAdmin()) {
			Pagination pgn = new Pagination();
			pgn.pageInfo(page, range, aes.eventBoardListCnt(map));
			map.put("startList", pgn.getStartList());
			map.put("listSize", pgn.getListSize());
			
			mav.addObject("search", map);
			mav.addObject("pagination", pgn);
			mav.addObject("data", aes.selectEventList(map));
			mav.setViewName("admin/adminEvent");
		}
		return mav;
	}
	
	@GetMapping("/adminEventInsert")
	public String adminEventInsert() {
		if(isThisAdmin()) {
			return "admin/adminEventInsert";
		}
		return "index";
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
		ModelAndView mav = new ModelAndView();
		
		if(isThisAdmin()) {
			EventBoardVO adminEventDetail = aes.adminEventDetail(seq);
			// System.out.println(adminEventDetail);
			
			mav.addObject("data", adminEventDetail);
			mav.setViewName("admin/adminEventUpdate");
		}
		return mav;
	}
	
	@PostMapping("/adminEventUpdate")
	public ModelAndView updateEventPost(EventBoardVO vo, String getValue) {
		int rs = aes.updateEvent(vo);
		ModelAndView mav = new ModelAndView();
		if(rs == 1) {
			mav.setViewName("redirect:/adminEvent"+getValue);
		} else {
			mav.setViewName("redirect:/adminEventUpdate?seq=" + vo.getSeq());
		}
		return mav;
	}
	
	@GetMapping("/deleteEvent")
	public String deleteEvent(EventBoardVO vo) {
		// System.out.println("deleteEvent" + vo);
		if(isThisAdmin()) {
			aes.deleteEvent(vo);
		}
		return "redirect:/adminEvent";
	}
	
}	