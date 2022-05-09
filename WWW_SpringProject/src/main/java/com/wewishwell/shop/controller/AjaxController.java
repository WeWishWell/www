package com.wewishwell.shop.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wewishwell.shop.service.AdminService;
import com.wewishwell.shop.service.EventService;
import com.wewishwell.shop.service.MainService;
import com.wewishwell.shop.service.MemberService;
import com.wewishwell.shop.service.ReviewService;
import com.wewishwell.shop.vo.BasketVO;
import com.wewishwell.shop.vo.EventReplyVO;
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
	EventService es;
	
	@Autowired
	AdminService as;
	
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
	
	@PostMapping("prodListForIndex")
	public List<ProductVO> prodListForIndex() {
		return ms.prodListForIndex();
	}
	
	// reply
	@PostMapping("/insertReply")
	public List<EventReplyVO> insertReply(EventReplyVO vo) {
		if(!vo.getContent().equals("")) {
			es.insertReply(vo);
		}
		return es.selectReplyList(vo.getEvent_seq());
	}
	
	@PostMapping("/updateReply")
	public int updateReply(EventReplyVO vo) {
		return es.updateReply(vo);
	}

	@GetMapping("/deleteReply")
	public int deleteReply(EventReplyVO vo) {
		return es.deleteReply(vo);
	}
	
	//ADMIN AJAX
	@GetMapping("adminProdModify")
	public ProductVO adminProdModify_getProdOne(String id) {
		return as.getProdOne(id);
	}
	
	@GetMapping("adminProdCreate")
	public int adminProdCreate() {
		return as.prodMaxNum();
	}
	
	@GetMapping("adminProdDel")
	public int deleteProd(String id) {
		return as.deleteProd(id);
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
	@GetMapping("checkreviewcnt")
	public int checkreviewcnt(ReviewlikeVO reviewlikeVO) {
		return rvs.checkreviewcnt(reviewlikeVO);
	}
	
	@GetMapping("Modify_un2likeCNT")
	public int Modify_un2likeCNT(ReviewVO vo) {
		return rvs.Modify_un2likeCNT(vo);
	}
	
	@GetMapping("Modify_li2unlikeCNT")
	public int Modify_li2unlikeCNT(ReviewVO vo) {
		return rvs.Modify_li2unlikeCNT(vo);
	}
	
	@GetMapping("getcntlike")
	public ReviewVO getcntlike(ReviewVO reviewVO) {
		return rvs.getcntlike(reviewVO);
	}
	
	@GetMapping("getreviewlike")
	public ReviewlikeVO getreviewlike(ReviewlikeVO vo) {
		return rvs.getreviewlike(vo);
	}
	
	// === 배송상태 변경
	@PostMapping("updateStatus")
	public int updateStatus(@RequestParam Map<String, Object> updateStatus) {
		return as.updateStatus(updateStatus);
	}
}
