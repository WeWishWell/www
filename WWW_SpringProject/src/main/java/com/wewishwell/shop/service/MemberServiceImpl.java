package com.wewishwell.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wewishwell.shop.dao.MemberDao;
import com.wewishwell.shop.vo.MemberVO;
import com.wewishwell.shop.vo.ReviewVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao mdao;

	@Override
	public int memberinsert(MemberVO vo) {
		return mdao.insertmember(vo);
	}
	@Override
	public MemberVO memberLogin(MemberVO vo){
		return mdao.memberLogin(vo);
	}
	@Override
	public int memberUpdate(MemberVO vo) {
		return mdao.memberUpdate(vo);
	}
	@Override
	public MemberVO memberdetail(MemberVO vo) {
		return mdao.memberdetail(vo);
	}
	@Override
	public int delete(MemberVO vo) {
		return mdao.delete(vo);
	}
	@Override
	public int loginCheck(MemberVO vo) {
		return mdao.loginCheck(vo);
	}
	@Override
	public int idCheck(MemberVO vo) {
		return mdao.idCheck(vo);
	}
	@Override
	public int pwTrue(MemberVO vo) {
		return mdao.pwTrue(vo);
	}
	
	//리뷰
	@Override
	public List<ReviewVO> review() {
		return mdao.review();
	}
	@Override
	public List<Integer> findReview(String id) {
		return mdao.findReview(id);
	}
	@Override
	public int insertReview(ReviewVO vo) {
		return mdao.insertReview(vo);
	}
}
