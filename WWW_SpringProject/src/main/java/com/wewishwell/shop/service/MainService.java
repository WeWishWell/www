package com.wewishwell.shop.service;

import java.util.List;
import java.util.Map;

import com.wewishwell.shop.vo.BasketVO;
import com.wewishwell.shop.vo.MemberVO;
import com.wewishwell.shop.vo.ProdLikeVO;
import com.wewishwell.shop.vo.ProductVO;

public interface MainService {

	public List<ProductVO> productList(Map<String, String> map);

	public ProductVO productDetail(ProductVO productVO);

	public BasketVO checkBasket(BasketVO basketVo);
	
	public int addBasket(BasketVO basketVo);

	public int updateBasket(BasketVO basketVo);
	
	public int deleteBasket(BasketVO basketVo);
	
	public List<Map<String, Object>> basketList(MemberVO MemberVO);
	
	public Map<String, Object> orderInfo(MemberVO memberVO);
	
	public int likeCheck(ProdLikeVO vo);
	
	public int likeInsert(ProdLikeVO vo);
	
	public int likeDelete(ProdLikeVO vo);
	
	public List<Map<String, Object>> likeList(Map<String, String> map);

	public int deleteLike(ProdLikeVO vo);
	
	public List<Map<String, String>> buyList(String id);
	
	public int delReview(String odm);
	
	public Map<String, Object> getproductList(Map<String, Object> map);

	public List<ProductVO> getSearchList(Map<String, String> map);

	public int insertOrder(Map<String, Object> order);
	
	public int selectOrderNum(Map<String, Object> order);

	public int insertOrderDetail(Map<String, Object> order);

	public List<Map<String, Object>> getOrderList(Map<String, Object> order);

	public int insertOrderDetailOne(Map<String, Object> order);
	
	public List<ProductVO> prodListForIndex();
	
}
