package com.wewishwell.shop.controller;

import java.util.List;
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

import com.wewishwell.shop.service.AdminService;
import com.wewishwell.shop.vo.MemberVO;
import com.wewishwell.shop.vo.ProductVO;
import com.wewishwell.shop.vo.ReviewVO;

@Controller
public class AdminController {
	
	@Autowired
	AdminService as;
	
	private boolean isThisAdmin() {
		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession s = req.getSession();
		if(s.getAttribute("roleCheck") == null) {
			return false;
		} else {
			return true;
		}
	}
	
	// === 배송현황 페이지
	@GetMapping("adminOrder")
	public ModelAndView orderManagement(@RequestParam Map<String, Object> Search) {
		ModelAndView mav = new ModelAndView();
		if(isThisAdmin()) {
			// order테이블 리스트
			List<Map<String, Object>> orderList = as.getOrderList(Search);
			mav.addObject("data", orderList);
			mav.setViewName("admin/adminOrder");
		}
		return mav;
	}
	
	// === 배송현황 페이지 검색
	@PostMapping("adminOrder")
	public ModelAndView orderManagementPost(@RequestParam Map<String, Object> Search) {
		
		//System.out.println(Search);
		
		// order테이블 검색 리스트
		List<Map<String, Object>> orderSearchList = as.getOrderList(Search);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", orderSearchList);
		mav.addObject("searchkw", Search); // 검색 키워드
		mav.setViewName("admin/adminOrder");

		return mav;
	}
	
	// === 배송상태 변경
	@GetMapping("updateStatus")
	public ModelAndView updateStatus(@RequestParam Map<String, Object> updateStatus) {
		
		as.updateStatus(updateStatus);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/adminOrder");
		return mav;
	}
	
	//상품관리 INDEX
	@GetMapping("adminProd")
	public ModelAndView getProd(@RequestParam Map<String, String> map) {
		ModelAndView mav = new ModelAndView();
		if(isThisAdmin()) {
			mav.addObject("search", map);
			if(map.get("sel") == null) {
				mav.addObject("data", as.getProd());
			} else if(map.get("sel").equals("1")){
				mav.addObject("data", as.prodNameSrch(map.get("val")));
			} else if(map.get("sel").equals("2")){
				mav.addObject("data", as.prodCateSrch(map.get("val")));
			} else {
				mav.addObject("data", as.getProd());
			}
			mav.setViewName("admin/adminProd");
		}
		return mav;
	}
	
	@PostMapping("adminProd")
	public String ModifyProd(ProductVO vo) {
		int check = 0;
		if(vo.getId() == as.prodMaxNum()) {
			check = as.createProd(vo);
		} else {
			check = as.modifyProd(vo);
		}
		if(check == 1) {
			return "redirect:/adminProd";
		}
		return "index";
	}
	
	//진희누나
	@GetMapping("adminList")
	public ModelAndView adminMemList(@RequestParam Map<String, Object> map) {
		List<Map<String, Object>> adminMemList = as.adminMemList(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", adminMemList);
		mav.setViewName("admin/adminList");
		
		return mav;
		
	}
	
	@PostMapping("adminList")
	public ModelAndView adminMemListPost(@RequestParam Map<String, Object> search) {
		List<Map<String, Object>> memberSerach = as.adminMemList(search);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data",memberSerach);
		mav.addObject("searchkeyword", search);
		mav.setViewName("admin/adminList");
		
		return mav;
	}
	
	@GetMapping("adminMemDel")
	public String adminMemDel(MemberVO vo) {
		as.adminMemDel(vo);
		
		return "redirect:adminList";
	}
	
	
	@GetMapping("adminReview")
	public ModelAndView reviewList(@RequestParam Map<String, Object> map) {
		List<Map<String, Object>> reviewList = as.reviewList(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", reviewList);
		mav.setViewName("admin/adminReview");
		
		return mav;
	}
	
	@PostMapping("adminReview")
	public ModelAndView reviewListPost(@RequestParam Map<String, Object> review) {
		List<Map<String, Object>> reviewSearch = as.adminMemList(review);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data",reviewSearch);
		mav.addObject("searchkeyword",review);
		mav.setViewName("admin/adminList");
		
		return mav;
	}
	
	@GetMapping("reviewDel")
	public String reviewDel(ReviewVO vo) {
		as.reviewDel(vo);
		
		return "redirect:adminReview";
	}
}
