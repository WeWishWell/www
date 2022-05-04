package com.wewishwell.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wewishwell.shop.dao.AdminDao;
import com.wewishwell.shop.vo.MemberVO;
import com.wewishwell.shop.vo.ProductVO;
import com.wewishwell.shop.vo.ReviewVO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDao dao;
	
	@Override
	public int prodMaxNum() {
		return dao.prodMaxNum();
	}
	
	//배송현황
	@Override
	public List<Map<String, Object>> getOrderList(Map<String, Object> search) {
		return dao.getOrderList(search);
	}
	
	@Override
	public int updateStatus(Map<String, Object> updateStatus) {
		return dao.updateStatus(updateStatus);
	}

	//상품관리
	@Override
	public List<ProductVO> getProd() {
		return dao.getProd();
	}

	@Override
	public ProductVO getProdOne(String id) {
		return dao.getProdOne(id);
	}

	@Override
	public int modifyProd(ProductVO vo) {
		return dao.modifyProd(vo);
	}

	@Override
	public int createProd(ProductVO vo) {
		return dao.createProd(vo);
	}

	@Override
	public int deleteProd(String id) {
		return dao.deleteProd(id);
	}

	@Override
	public List<ProductVO> prodNameSrch(String val) {
		return dao.prodNameSrch(val);
	}

	@Override
	public List<ProductVO> prodCateSrch(String val) {
		return dao.prodCateSrch(val);
	}
	
	//진희누나
	@Override
	public List<Map<String, Object>> adminMemList(Map<String, Object> map){
		return dao.adminMemList(map);
	} 
	
	@Override
	public int adminMemDel(MemberVO vo) {
		return dao.adminMemDel(vo);
	}
	
	@Override
	public List<Map<String, Object>> reviewList(Map<String, Object> map){
		return dao.reviewList(map);
	}
	
	@Override
	public int reviewDel(ReviewVO vo) {
		return dao.reviewDel(vo);
	}

}
