package com.wewishwell.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wewishwell.shop.dao.MainDao;
import com.wewishwell.shop.vo.BasketVO;
import com.wewishwell.shop.vo.MemberVO;
import com.wewishwell.shop.vo.ProdLikeVO;
import com.wewishwell.shop.vo.ProductVO;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainDao dao;
	
	@Override
	public List<ProductVO> productList(Map<String, String> map) {
		return dao.productList(map);
	}
	
	@Override
	public ProductVO productDetail(ProductVO productVO) {
		return dao.productDetail(productVO);
	}
	
	@Override
	public int addBasket(BasketVO basketVo) {
		return dao.addBasket(basketVo);
	}
	
	@Override
	public int updateBasket(BasketVO basketVo) {
		return dao.updateBasket(basketVo);
	}
	
	@Override
	public int deleteBasket(BasketVO basketVo) {
		return dao.deleteBasket(basketVo);
	}
	
	@Override
	public List<Map<String, Object>> basketList(MemberVO MemberVO) {
		return dao.basketList(MemberVO);
	}
	
	@Override
	public BasketVO checkBasket(BasketVO basketVo) {
		return dao.checkBasket(basketVo);
	}
	
	@Override
	public Map<String, Object> orderInfo(MemberVO memberVO) {
		return dao.orderInfo(memberVO);
	}

	@Override
	public int likeCheck(ProdLikeVO vo) {
		return dao.likeCheck(vo);
	}

	@Override
	public int likeInsert(ProdLikeVO vo) {
		return dao.likeInsert(vo);
	}

	@Override
	public int likeDelete(ProdLikeVO vo) {
		return dao.likeDelete(vo);
	}
	
	@Override 
	public List<Map<String, Object>> likeList(Map<String, String> map){
		return dao.likeList(map);
	}
	
	@Override
	public int deleteLike(ProdLikeVO vo) {
		return dao.deleteLike(vo);
	}

	@Override
	public List<Map<String, String>> buyList(String id) {
		return dao.buyList(id);
	}
	
	@Override
	public int delReview(String odm) {
		return dao.delReview(odm);
	}

	@Override
	public Map<String, Object> getproductList(Map<String, Object> map) {
		return dao.getproductList(map);
	}

	@Override
	public List<ProductVO> getSearchList(Map<String, String> map) {
		return dao.getSearchList(map);
	}

	@Override
	public int insertOrder(Map<String, Object> order) {
		return dao.insertOrder(order);
	}
	
	@Override
	public int selectOrderNum(Map<String, Object> order) {
		return dao.selectOrderNum(order);
	}
	
	@Override
	public int insertOrderDetail(Map<String, Object> order) {
		return dao.insertOrderList(order);
	}
	
	@Override
	public int insertOrderDetailOne(Map<String, Object> order) {
		return dao.insertOrderDetailOne(order);
	}
	
	@Override
	public List<Map<String, Object>> getOrderList(Map<String, Object> order) {
		return dao.getOrderList(order);
	}

	@Override
	public List<ProductVO> prodListForIndex() {
		return dao.prodListForIndex();
	}

}
