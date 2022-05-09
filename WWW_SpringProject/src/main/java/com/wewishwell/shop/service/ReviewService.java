package com.wewishwell.shop.service;

import java.util.List;

import com.wewishwell.shop.vo.ProductVO;
import com.wewishwell.shop.vo.ReviewVO;
import com.wewishwell.shop.vo.ReviewlikeVO;

public interface ReviewService {
	
	public int cnt5star(ProductVO productVO);

	public int cnt4star(ProductVO productVO);

	public int cnt3star(ProductVO productVO);

	public int cnt2star(ProductVO productVO);

	public int cnt1star(ProductVO productVO);

	public int cntreview(ProductVO productVO);

	public Object getRelventList(ProductVO productVO);

	public Double avgreview(ProductVO productVO);

	public int Insert_like_review(ReviewlikeVO reviewlikeVO);
	
	public List<ReviewVO> getreviewlist(ProductVO productVO);

	public int Increase_likeCNT(ReviewVO vo);

	public int Decrease_likeCNT(ReviewVO vo);

	public int check_reviewLike(ReviewlikeVO reviewlikeVO);

	public List<ReviewlikeVO> checkreviewnum(String id);

	public int delete_reviewlike(ReviewlikeVO reviewlikeVO);

	public int update_reviewlikee(ReviewlikeVO reviewlikeVO);

	public int checkreviewcnt(ReviewlikeVO reviewlikeVO);

	public List<ReviewVO> reviewlist_sort_by_star(ProductVO productVO);

	public ReviewVO getcntlike(ReviewVO reviewVO);

	public int Modify_un2likeCNT(ReviewVO vo);

	public int Modify_li2unlikeCNT(ReviewVO vo);

	public ReviewlikeVO getreviewlike(ReviewlikeVO vo);

}
