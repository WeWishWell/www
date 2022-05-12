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
import com.wewishwell.shop.service.AdminService;
import com.wewishwell.shop.service.PagingService;
import com.wewishwell.shop.vo.MemberVO;
import com.wewishwell.shop.vo.ProductVO;
import com.wewishwell.shop.vo.ReviewVO;

@Controller
public class AdminController {
	
	@Autowired
	AdminService as;
	
	@Autowired
	PagingService ps;
	
	
	private boolean isThisAdmin() {
		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession s = req.getSession();
		if(s.getAttribute("roleCheck") == null) {
			return false;
		} else {
			return true;
		}
	}
	
	// 배송현황 페이징
		@GetMapping("pgGetOrderList")
		public ModelAndView pgGetOrderList(@RequestParam Map<String, Object> Search, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) {
			ModelAndView mav = new ModelAndView();
			if(isThisAdmin()) {
				//전체 게시글 개수
				int listCnt = ps.getOrderListCnt(Search);
				
				//Pagination 객체생성
				Pagination pagination = new Pagination();
				pagination.pageInfo(page, range, listCnt);
				
				Search.put("startList", pagination.getStartList());
				Search.put("listSize", pagination.getListSize());
				
				// order테이블 리스트
				mav.addObject("searchkw", Search); // 검색 키워드
				
				mav.addObject("pagination", pagination);
				mav.addObject("data", ps.pgGetOrderList(Search));
				
				mav.setViewName("admin/adminOrderPg");
			}
			return mav;
		}	
		
	// === 배송상태 변경
	@GetMapping("updateStatus")
	public ModelAndView updateStatus(@RequestParam Map<String, Object> updateStatus) {
		
		as.updateStatus(updateStatus);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/pgGetOrderList");
		return mav;
	}
	
	//상품관리 INDEX
	@GetMapping("adminProd")
	public ModelAndView getProd(@RequestParam Map<String, String> map, @RequestParam Map<String, Object> Search, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) {
		ModelAndView mav = new ModelAndView();
		if(isThisAdmin()) {
			Pagination pgn = new Pagination();
			pgn.pageInfo(page, range, ps.getProdCnt(map));
			map.put("startList", Integer.toString(pgn.getStartList()));
			map.put("listSize", Integer.toString(pgn.getListSize()));
			
			mav.addObject("search", map);
			mav.addObject("pagination", pgn);
			mav.addObject("data", as.getProd(map));
			mav.setViewName("admin/adminProd");
		}
		return mav;
	}
	
	@PostMapping("adminProd")
	public String ModifyProd(ProductVO vo, String getValue) {
		int check = 0;
		if(vo.getId() == as.prodMaxNum()) {
			check = as.createProd(vo);
			if(check == 1) {
				return "redirect:/adminProd";
			}
		} else {
			check = as.modifyProd(vo);
			if(check == 1) {
				return "redirect:/adminProd"+getValue;
			}
		}
		return "index";
	}
	
	//회원관리
	@GetMapping("adminList")
	public ModelAndView adminMemList(@RequestParam Map<String, Object> map,@RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) {
		//System.out.println(map);
		ModelAndView mav = new ModelAndView();
				
		int listCnt = ps.adminMemListCnt(map);
				
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
				
		map.put("startList", pagination.getStartList());
		map.put("listSize", pagination.getListSize());
				
		mav.addObject("pagination",pagination);
		mav.addObject("data", as.adminMemList(map));
		mav.setViewName("admin/adminList");
				
		return mav;
	}
	
	@GetMapping("adminMemDel")
	public String adminMemDel(MemberVO vo) {
		as.adminMemDel(vo);
		
		return "redirect:pgAdminMemList";
	}
	
	//리뷰관리
	@GetMapping("adminReview")
	public ModelAndView reviewList(@RequestParam Map<String, Object> map, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) {
		ModelAndView mav = new ModelAndView();
		
		int listCnt = ps.reviewListCnt(map);
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);

		map.put("startList", pagination.getStartList());
		map.put("listSize", pagination.getListSize());
		
		mav.addObject("pagination",pagination);
		mav.addObject("data", as.reviewList(map));
		mav.setViewName("admin/adminReview");
		
		return mav;
	}
	
	@GetMapping("reviewDel")
	public String reviewDel(ReviewVO vo) {
		as.reviewDel(vo);
		
		return "redirect:adminReview";
	}
}
