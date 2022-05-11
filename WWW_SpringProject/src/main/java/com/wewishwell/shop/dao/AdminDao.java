package com.wewishwell.shop.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wewishwell.shop.vo.MemberVO;
import com.wewishwell.shop.vo.ProductVO;
import com.wewishwell.shop.vo.ReviewVO;

@Repository
public class AdminDao {
	
	@Autowired
	SqlSessionTemplate sst;
	
	public int prodMaxNum() {
		int i = sst.selectOne("admin.prodMaxNum");
		return i+1;
	}
	
	//배송현황 DAO
	public List<Map<String, Object>> getOrderList(Map<String, Object> search) {
		return sst.selectList("admin.getOrderList", search);
	}
	
	public int updateStatus(Map<String, Object> updateStatus) {
		return sst.update("admin.updateStatus", updateStatus);
	}
	
	//상품관리 DAO
	public List<ProductVO> getProd(Map<String, String> map) {
		return sst.selectList("admin.getProd", map);
	}
	
	public ProductVO getProdOne(String id) {
		return sst.selectOne("admin.getProdOne", id);
	}
	
	public int modifyProd(ProductVO vo) {
		return sst.update("admin.modifyProd", vo);
	}
	
	public int createProd(ProductVO vo) {
		return sst.insert("admin.createProd", vo);
	}
	
	public int deleteProd(String id) {
		return sst.delete("admin.deleteProd", id);
	}
	
	//회원관리
	public List<Map<String, Object>> adminMemList(Map<String, Object> map){
		return sst.selectList("admin.adminMemList", map);
	}

	public int adminMemDel(MemberVO vo) {
		return sst.delete("admin.adminMemDel", vo);
	}
	
	//리뷰관리
	public List<Map<String, Object>> reviewList(Map<String, Object> map){
		return sst.selectList("admin.reviewList", map);
	}
	
	public int reviewDel(ReviewVO vo) {
		return sst.delete("admin.reviewDel", vo);
	}
}
