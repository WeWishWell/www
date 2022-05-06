package com.wewishwell.shop.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wewishwell.shop.vo.EventBoardVO;

@Repository
public class AdminEventDao {

	@Autowired
	SqlSessionTemplate sst;
	
	public List<EventBoardVO> selectEventList(){
		return sst.selectList("adminE.eventBoardList");	
	}
	
	public int insertEvent(EventBoardVO vo) {
		return sst.insert("adminE.insertEvent", vo);
	}

	public int deleteEvent(EventBoardVO vo) {
		return sst.delete("adminE.deleteEvent", vo);
	}
	
	public int updateEvent(EventBoardVO vo) {
		return sst.update("adminE.updateEvent", vo);
	}

	public List<EventBoardVO> eventSearch(Map<String, String> search) {
		return sst.selectList("adminE.eventSearch", search);
	}

	public EventBoardVO adminEventDetail(String seq) {
		return sst.selectOne("adminE.eventDetail", seq);
	}
	
	public int eventMaxNum() {
		return sst.selectOne("adminE.eventMaxNum");
	}
			
}
