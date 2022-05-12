package com.wewishwell.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wewishwell.shop.dao.PagingDao;

@Service
public class PagingServiceImpl implements PagingService{
	
	@Autowired
	PagingDao dao;
	
	@Override
	public List<Map<String, Object>> pgGetOrderList(Map<String, Object> Search) {
		return dao.pgGetOrderList(Search);
	}
	
	//총 게시글 개수 확인
	@Override
	public int getOrderListCnt(Map<String, Object> Search) {
		return dao.getOrderListCnt(Search);
	}
	
	//회원관리
	@Override
	public List<Map<String, Object>> pgAdminMemList(Map<String, Object> map){
		return dao.pgAdminMemList(map);
	}
	
	@Override
	public int pgAdminMemListCnt(Map<String, Object> map) {
		return dao.pgAdminMemListCnt(map);
	}

	//ADMIN상품 count
	@Override
	public int getProdCnt(Map<String, String> map) {
		return dao.getProdCnt(map);
	}

	@Override
	public int getProductListCNT(Map<String, Object> map) {
		return dao.getProductListCNT(map);
	}
}
