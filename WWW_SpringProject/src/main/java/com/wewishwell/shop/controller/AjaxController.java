package com.wewishwell.shop.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wewishwell.shop.service.MainService;
import com.wewishwell.shop.service.MemberService;
import com.wewishwell.shop.service.ReviewService;
import com.wewishwell.shop.vo.BasketVO;
import com.wewishwell.shop.vo.MemberVO;
import com.wewishwell.shop.vo.ProdLikeVO;
import com.wewishwell.shop.vo.ProductVO;
import com.wewishwell.shop.vo.ReviewVO;
import com.wewishwell.shop.vo.ReviewlikeVO;

@RestController
public class AjaxController {

	@Autowired
	MainService ms;
	
	@Autowired
	MemberService mbs;
	
	@Autowired
	ReviewService rvs;
	
	@PostMapping("loginCheck")
	public int loginCheck(MemberVO vo) {
		return mbs.loginCheck(vo);
	}
	
	@GetMapping("idCheck")
	public int idCheck(MemberVO vo) {
		return mbs.idCheck(vo);
	}
	
	@PostMapping("/pwTrueCheck")
	public int pwTrueCheck(MemberVO vo) {
		return mbs.pwTrue(vo);
	}
	
	@GetMapping("likeInsert")
	public int likeInsert(ProdLikeVO vo) {
		return ms.likeInsert(vo);
	}
	
	@GetMapping("likeDelete")
	public int likeDelete(ProdLikeVO vo) {
		return ms.likeDelete(vo);
	}
	
	@GetMapping("basketCheck")
	public int basket(BasketVO basketVo) {
		BasketVO check = ms.checkBasket(basketVo);
		int rs = 0;
		
		if(check == null) {
			rs = ms.addBasket(basketVo);
		} else {
			rs = ms.updateBasket(basketVo);
		}
		return rs;
	}
	
	@GetMapping("/ajaxLikeList")
	public List<Map<String, Object>> ajaxLikeList(@RequestParam Map<String, String> map) {
		return ms.likeList(map);
	}
	
	@GetMapping("/ajaxBasketList")
	public List<Map<String, Object>> ajaxBasketList(MemberVO memberVO) {
		return ms.basketList(memberVO);
	}
	
	@GetMapping("/ajaxRecentList")
	public Map<String,Object> ajaxRecentList(@RequestParam Map<String, Object> map){
		return ms.getproductList(map);
	}
	
	@GetMapping("/ajaxPopup")
	public void ajaxPopup() {}
	
	@PostMapping("reviewWrite")
	public int insertReview(ReviewVO vo) {
		return mbs.insertReview(vo);
	}
	
	@GetMapping("insert_reviewlike")
	public int insert_reviewlike(ReviewlikeVO reviewlikeVO) {
		return rvs.Insert_like_review(reviewlikeVO);
	}
	@GetMapping("Increase_likeCNT")
	public int Increase_likeCNT(ReviewVO vo) {
		return rvs.Increase_likeCNT(vo);
	}
	@GetMapping("Decrease_likeCNT")
	public int Decrease_likeCNT(ReviewVO vo) {
		return rvs.Decrease_likeCNT(vo);
	}
	@GetMapping("check_reviewLike")
	public int check_reviewLike(ReviewlikeVO reviewlikeVO) {
		return rvs.check_reviewLike(reviewlikeVO); 
	}
	@GetMapping("delete_reviewlike")
	public int delete_reviewlike(ReviewlikeVO reviewlikeVO) {
		return rvs.delete_reviewlike(reviewlikeVO);
	}
	@GetMapping("update_reviewlike")
	public int update_reviewlike(ReviewlikeVO reviewlikeVO) {
		return rvs.update_reviewlikee(reviewlikeVO);
	}
}
