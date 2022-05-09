package com.wewishwell.shop.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wewishwell.shop.vo.ProductVO;
import com.wewishwell.shop.vo.ReviewVO;
import com.wewishwell.shop.vo.ReviewlikeVO;

@Repository
public class ReviewDao {

	@Autowired
	SqlSessionTemplate sst;

	public int cnt5star(ProductVO productVO) {
		return sst.selectOne("review.cnt5star", productVO);
	}

	public int cnt4star(ProductVO productVO) {
		return sst.selectOne("review.cnt4star", productVO);
	}

	public int cnt3star(ProductVO productVO) {
		return sst.selectOne("review.cnt3star", productVO);
	}

	public int cnt2star(ProductVO productVO) {
		return sst.selectOne("review.cnt2star", productVO);
	}

	public int cnt1star(ProductVO productVO) {
		return sst.selectOne("review.cnt1star", productVO);
	}

	public int cntreview(ProductVO productVO) {
		return sst.selectOne("review.cntreview", productVO);
	}

	public Double avgreview(ProductVO productVO) {
		return sst.selectOne("review.avgreview", productVO);
	}

	public int Insert_like_review(ReviewlikeVO reviewlikeVO) {
		return sst.insert("review.Insert_like_review", reviewlikeVO);
	}
	public List<ReviewVO> getreviewlist(ProductVO productVO) {
		return sst.selectList("review.getreviewlist", productVO);
	}

	public int Increase_likeCNT(ReviewVO vo) {
		return sst.update("review.Update_likeCNT",vo);
	}

	public int Decrease_likeCNT(ReviewVO vo) {
		return sst.update("review.Update_unlikeCNT",vo);
	}

	public int check_reviewLike(ReviewlikeVO reviewlikeVO) {
		return sst.selectOne("review.check_reviewLike",reviewlikeVO);
	}

	public List<ReviewlikeVO> checkreviewnum(String id) {
		return sst.selectList("review.checkreviewnum", id);
	}

	public int delete_reviewlike(ReviewlikeVO reviewlikeVO) {
		return sst.delete("review.delete_reviewlike", reviewlikeVO);
	}

	public int update_reviewlike(ReviewlikeVO reviewlikeVO) {
		return sst.update("review.update_reviewlike", reviewlikeVO);
	}

	public int checkreviewcnt(ReviewlikeVO reviewlikeVO) {
		return sst.selectOne("review.checkreviewcnt", reviewlikeVO);
	}

	public List<ReviewVO> reviewlist_sort_by_star(ProductVO productVO) {
		return sst.selectList("review.reviewlist_sort_by_star", productVO);
	}

	public ReviewVO getcntlike(ReviewVO reviewVO) {
		return sst.selectOne("review.getcntlike", reviewVO);
	}

	public int Modify_un2likeCNT(ReviewVO vo) {
		return sst.update("review.Modify_un2likeCNT", vo);
	}

	public int Modify_li2unlikeCNT(ReviewVO vo) {
		return sst.update("review.Modify_li2unlikeCNT", vo);
	}

	public ReviewlikeVO getreviewlike(ReviewlikeVO vo) {
		return sst.selectOne("review.getreviewlike", vo);
	}

}
