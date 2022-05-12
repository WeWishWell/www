package com.wewishwell.shop.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PagingDao {
	
	@Autowired
	SqlSessionTemplate sst;
	
	//배송현황 페이징 DAO
	public List<Map<String, Object>> pgGetOrderList(Map<String, Object> Search) {
		return sst.selectList("paging.pgGetOrderList", Search);
	}
	
	// 오더리스트 갯수
	public int getOrderListCnt(Map<String, Object> Search) {
		return sst.selectOne("paging.pgGetOrderListCnt", Search);
	}
	//회원리스
	public List<Map<String, Object>> pgAdminMemList(Map<String, Object> map){
		return sst.selectList("paging.pgAdminMemList", map);
	}
	
	public int pgAdminMemListCnt(Map<String, Object> map) {
		return sst.selectOne("paging.pgAdminMemListCnt", map);
	}
	
	//ADMIN상품페이지 count
	public int getProdCnt(Map<String, String> map) {
		return sst.selectOne("admin.getProdCnt", map);
	}

	public int getProductListCNT(Map<String, Object> map) {
		return sst.selectOne("paging.getProductListCNT",map);
	}
}
