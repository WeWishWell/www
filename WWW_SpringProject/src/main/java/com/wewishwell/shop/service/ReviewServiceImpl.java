package com.wewishwell.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wewishwell.shop.dao.ReviewDao;
import com.wewishwell.shop.vo.ProductVO;
import com.wewishwell.shop.vo.ReviewVO;
import com.wewishwell.shop.vo.ReviewlikeVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao dao;
	
	@Override
	public int cnt5star(ProductVO productVO) {
		return dao.cnt5star(productVO);
	}

	@Override
	public int cnt4star(ProductVO productVO) {
		return dao.cnt4star(productVO);
	}

	@Override
	public int cnt3star(ProductVO productVO) {
		return dao.cnt3star(productVO);
	}

	@Override
	public int cnt2star(ProductVO productVO) {
		return dao.cnt2star(productVO);
	}

	@Override
	public int cnt1star(ProductVO productVO) {
		return dao.cnt1star(productVO);
	}

	@Override
	public int cntreview(ProductVO productVO) {
		return dao.cntreview(productVO);
	}

	@Override
	public Object getRelventList(ProductVO productVO) {
		return null;
	}

	@Override
	public Double avgreview(ProductVO productVO) {
		return dao.avgreview(productVO);
	}

	@Override
	public int Insert_like_review(ReviewlikeVO reviewlikeVO) {
		return dao.Insert_like_review(reviewlikeVO);
	}
	
	@Override
	public List<ReviewVO> getreviewlist(ProductVO productVO) {
		return dao.getreviewlist(productVO);
	}

	@Override
	public int Increase_likeCNT(ReviewVO vo) {
		return dao.Increase_likeCNT(vo);
	}

	@Override
	public int Decrease_likeCNT(ReviewVO vo) {
		return dao.Decrease_likeCNT(vo);
	}

	@Override
	public int check_reviewLike(ReviewlikeVO reviewlikeVO) {
		return dao.check_reviewLike(reviewlikeVO);
	}

	@Override
	public List<ReviewlikeVO> checkreviewnum(String id) {
		return dao.checkreviewnum(id);
	}

	@Override
	public int delete_reviewlike(ReviewlikeVO reviewlikeVO) {
		return dao.delete_reviewlike(reviewlikeVO);
	}

	@Override
	public int update_reviewlikee(ReviewlikeVO reviewlikeVO) {
		return dao.update_reviewlike(reviewlikeVO);
	}

	@Override
	public int checkreviewcnt(ReviewlikeVO reviewlikeVO) {
		return dao.checkreviewcnt(reviewlikeVO);
	}

	@Override
	public List<ReviewVO> reviewlist_sort_by_star(ProductVO productVO) {
		return dao.reviewlist_sort_by_star(productVO);
	}

	@Override
	public ReviewVO getcntlike(ReviewVO reviewVO) {
		return dao.getcntlike(reviewVO);
	}

	@Override
	public int Modify_un2likeCNT(ReviewVO vo) {
		return dao.Modify_un2likeCNT(vo);
	}

	@Override
	public int Modify_li2unlikeCNT(ReviewVO vo) {
		return dao.Modify_li2unlikeCNT(vo);
	}

	@Override
	public ReviewlikeVO getreviewlike(ReviewlikeVO vo) {
		return dao.getreviewlike(vo);
	}


}
