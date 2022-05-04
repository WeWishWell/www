package com.wewishwell.shop.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wewishwell.shop.vo.MemberVO;
import com.wewishwell.shop.vo.ReviewVO;

@Repository
public class MemberDao {
	
	@Autowired
	SqlSessionTemplate sst;
	
	public int insertmember(MemberVO vo) {
		return sst.insert("members.insertmember", vo);
		
	}
	public MemberVO memberLogin(MemberVO vo) {
		return sst.selectOne("members.login", vo);
	
	}
	public int memberUpdate(MemberVO vo) {
		return sst.update("members.update",vo);
	}
	
	public MemberVO memberdetail(MemberVO vo) {
		return sst.selectOne("members.memberdetail", vo);
	}
	
	public int delete(MemberVO vo) {
		return sst.delete("members.delete", vo);
	}
	
	public int loginCheck(MemberVO vo) {
		return sst.selectOne("members.loginCheck", vo);
	}
	
	public int idCheck(MemberVO vo) {
		return sst.selectOne("members.idCheck", vo);
	}
	
	public int pwTrue(MemberVO vo) {
		return sst.selectOne("members.loginCheck", vo);
	}
	
	public List<ReviewVO> review() {
		return sst.selectList("members.review");
	}
	
	public List<Integer> findReview(String id) {
		return sst.selectList("members.findReview", id);
	}
	
	public int insertReview(ReviewVO vo) {
		return sst.insert("members.insertReview", vo);
	}
}
