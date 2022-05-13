package com.wewishwell.shop.service;

import java.util.List;
import java.util.Map;

import com.wewishwell.shop.vo.MemberVO;
import com.wewishwell.shop.vo.ReviewVO;

public interface MemberService {
	public int memberinsert(MemberVO vo);
	public MemberVO memberLogin(MemberVO vo);
	public int memberUpdate(MemberVO vo);
	public MemberVO memberdetail(MemberVO vo);
	public int delete(MemberVO vo);
	public int loginCheck(MemberVO vo);
	public int idCheck(MemberVO vo);
	public int pwTrue(MemberVO vo);
	//리뷰
	public List<ReviewVO> review(Map<String, Object> map);
	public List<Integer> findReview(String id);
	public int insertReview(ReviewVO vo);

}
