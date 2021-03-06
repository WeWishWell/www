package com.wewishwell.shop.service;

import java.util.List;
import java.util.Map;

public interface PagingService {
	
	
	//배송현황
	public List<Map<String, Object>> pgGetOrderList(Map<String, Object> Search);
	
	//총 게시글 개수 확인
	public int getOrderListCnt(Map<String, Object> Search); 
	
	//회원관리 cnt
	public int adminMemListCnt(Map<String, Object> map);
	
	//ADMIN상품 count
	public int getProdCnt(Map<String, String> map);
	
	//상품리스트 count
	public int getProductListCNT(Map<String, Object> map);
	
	//상품검색 count
	public int getProductSearchCNT(Map<String, Object> map);
	
	//리뷰관리 cnt
	public int reviewListCnt(Map<String, Object> map);
	
	//구매내역 cnt
	public int getBuyListCnt(Map<String, Object> map);
}
