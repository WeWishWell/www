package com.wewishwell.shop.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wewishwell.shop.vo.EventBoardVO;
import com.wewishwell.shop.vo.EventReplyVO;


@Repository
public class EventDao {

	@Autowired
	SqlSessionTemplate sst;

	public List<EventBoardVO> eventListWinner(){
		return sst.selectList("event.boardListWinner");	
	}
	
	public List<EventBoardVO> eventListOn(){
		return sst.selectList("event.boardListOn");	
	}
	
	public List<EventBoardVO> eventListEnd(){
		return sst.selectList("event.boardListEnd");	
	}
	
	public EventBoardVO eventDetailWinner(EventBoardVO vo) {
		return sst.selectOne("event.eventDetailWinner", vo);
	}

	public EventBoardVO eventDetail(EventBoardVO vo) {
		return sst.selectOne("event.eventDetail", vo);
	}
	
	public int insertEvent(EventBoardVO vo) {
		return sst.insert("event.insertBoard", vo);
	}

	public int deleteEvent(EventBoardVO vo) {
		return sst.delete("event.deleteBoard", vo);
	}
	
	public int updateEvent(EventBoardVO vo) {
		return sst.update("event.updateBoard", vo);
	}

	public List<EventBoardVO> eventSearch(Map<String, String> search) {
		return sst.selectList("event.boardSearch", search);
	}

	// reply
	public int insertReply(EventReplyVO vo) {
		return sst.insert("event.insertReply", vo);
	}

	public int updateReply(EventReplyVO vo) {
		return sst.update("event.updateReply", vo);
	}

	public int deleteReply(EventReplyVO vo) {
		return sst.delete("event.deleteReply", vo);
	}

	public List<EventReplyVO> selectReplyList(int event_seq){
		return sst.selectList("event.selectReplyList", event_seq);
	}

	public int selectReplyCnt(int event_seq) {
		return sst.selectOne("event.selectReplyCnt", event_seq);
	}
			
}
