package com.wewishwell.shop.service;

import java.util.List;
import java.util.Map;

public interface PagingService {
	
	
	//배송현황
	public List<Map<String, Object>> pgGetOrderList(Map<String, Object> Search);
	
	//총 게시글 개수 확인
	public int getOrderListCnt(Map<String, Object> Search); 
	
	//회원관리
	public List<Map<String, Object>> pgAdminMemList(Map<String, Object> map);
	
	public int pgAdminMemListCnt(Map<String, Object> map);
	
	//ADMIN상품 count
	public int getProdCnt(Map<String, String> map);
	
	//상품리스트 count
	public int getProductListCNT(Map<String, Object> map);
}
