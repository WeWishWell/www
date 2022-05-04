package com.wewishwell.shop.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wewishwell.shop.vo.BasketVO;
import com.wewishwell.shop.vo.MemberVO;
import com.wewishwell.shop.vo.ProdLikeVO;
import com.wewishwell.shop.vo.ProductVO;

@Repository
public class MainDao {

	@Autowired
	SqlSessionTemplate sst;

	public List<ProductVO> productList(Map<String, String> map) {
		return sst.selectList("product.product_list", map);
	}

	public ProductVO productDetail(ProductVO productVO) {
//		System.out.println("dao-detail");
		return sst.selectOne("product.product_detail", productVO);
	}
	
	public BasketVO checkBasket(BasketVO basketVo) {
//		System.out.println("dao-checkBasket");
		return sst.selectOne("product.checkBasket", basketVo);
	}

	public int addBasket(BasketVO basketVo) {
//		System.out.println("dao-addBasket");
		return sst.insert("product.addBasket", basketVo);
	}
	
	public int updateBasket(BasketVO basketVo) {
//		System.out.println("dao-updateBasket");
		return sst.insert("product.updateBasket", basketVo);
	}
	
	public int deleteBasket(BasketVO basketVo) {
//		System.out.println("dao-deleteBasket");
		return sst.insert("product.deleteBasket", basketVo);
	}

	public List<Map<String, Object>> basketList(MemberVO memberVO) {
//		System.out.println("dao-basketlist");
		return sst.selectList("product.basketList", memberVO);
	}
	
	public Map<String, Object> orderInfo(MemberVO memberVO) {
//		System.out.println("dao-orderInfo");
		return sst.selectOne("product.orderInfo", memberVO);
	}
	
	public int likeCheck(ProdLikeVO vo) {
		return sst.selectOne("members.likeCheck", vo);
	}
	
	public int likeInsert(ProdLikeVO vo) {
		return sst.insert("members.likeInsert", vo);
	}
	
	public int likeDelete(ProdLikeVO vo) {
		return sst.delete("members.likeDelete", vo);
	}
	
	public List<Map<String,Object>> likeList(Map<String, String> map){
		return sst.selectList("product.likeList",map);
	}
	
	public int deleteLike(ProdLikeVO vo) {
		return sst.delete("product.deleteLike",vo);
	}
	
	public List<Map<String, String>> buyList(String id) {
		return sst.selectList("product.buyList", id);
	}
	
	public int delReview(String odm) {
		return sst.delete("product.delReview", odm);
	}
	
	public Map<String, Object> getproductList(Map<String, Object> map) {
		return sst.selectOne("product.getproductList",map);
	}

	public List<ProductVO> getSearchList(Map<String, String> map) {
		return sst.selectList("product.getSearchList", map);
	}

	public int insertOrder(Map<String, Object> order) {
		return sst.insert("product.insertOrder", order);
	}
	
	
	public int selectOrderNum(Map<String, Object> order) {
		return sst.selectOne("product.selectOrderNum", order);
	}
	
	public int insertOrderList(Map<String, Object> order) {
		return sst.insert("product.insertOrderList", order);
	}

	public int insertOrderDetailOne(Map<String, Object> order) {
		return sst.insert("product.insertOrderDetailOne", order);
	}
	
	public List<Map<String, Object>> getOrderList(Map<String, Object> order) {
		return sst.selectList("product.getOrderList", order);
	}

	public List<ProductVO> prodListForIndex() {
		return sst.selectList("product.prodListForIndex");
	}
	
}
