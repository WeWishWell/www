package com.wewishwell.shop.service;

import java.util.List;
import java.util.Map;

import com.wewishwell.shop.vo.MemberVO;
import com.wewishwell.shop.vo.ProductVO;
import com.wewishwell.shop.vo.ReviewVO;

public interface AdminService {
	
	public int prodMaxNum();
	
	//배송현황
	public List<Map<String, Object>> getOrderList(Map<String, Object> search);
	public int updateStatus(Map<String, Object> updateStatus);
	
	//상품관리
	public List<ProductVO> getProd(Map<String, String> map);
	public ProductVO getProdOne(String id);
	public int modifyProd(ProductVO vo);
	public int createProd(ProductVO vo);
	public int deleteProd(String id);
	
	//회원관리
	public List<Map<String, Object>> adminMemList(Map<String, Object> map);
	public int adminMemDel(MemberVO vo);
	//리뷰관리
	public List<Map<String, Object>> reviewList(Map<String, Object> map);
	public int reviewDel(ReviewVO vo);
}
