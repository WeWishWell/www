package com.wewishwell.shop.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wewishwell.shop.common.Pagination;
import com.wewishwell.shop.vo.MemberVO;
import com.wewishwell.shop.vo.ProductVO;
import com.wewishwell.shop.vo.ReviewVO;

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
}
