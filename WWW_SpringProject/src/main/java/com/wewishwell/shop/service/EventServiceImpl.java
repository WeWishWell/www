package com.wewishwell.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wewishwell.shop.dao.EventDao;
import com.wewishwell.shop.vo.EventBoardVO;
import com.wewishwell.shop.vo.EventReplyVO;

@Service
public class EventServiceImpl implements EventService{

	@Autowired
	EventDao dao;
	
	@Override
	public List<EventBoardVO> eventListWinner() {
		return dao.eventListWinner();
	}

	@Override
	public EventBoardVO eventDetailWinner(EventBoardVO vo) {
		return dao.eventDetailWinner(vo);
	}

	@Override
	public EventBoardVO eventDetail(EventBoardVO vo) {
		return dao.eventDetail(vo);
	}
	
	@Override
	public int insertEvent(EventBoardVO vo) {
		return dao.insertEvent(vo);
	}

	@Override
	public int deleteEvent(EventBoardVO vo) {
		return dao.deleteEvent(vo);
	}

	@Override
	public int updateEvent(EventBoardVO vo) {
		return dao.deleteEvent(vo);
	}
 
	@Override
	public List<EventBoardVO> eventListOn() {
		return dao.eventListOn();
	}

	@Override
	public List<EventBoardVO> eventListEnd() {
		return dao.eventListEnd();
	}

	@Override
	public List<EventBoardVO> eventSearch(Map<String, String> search) {
		return dao.eventSearch(search);
	}

	
	// reply
	
	@Override
	public int insertReply(EventReplyVO vo) {
		return dao.insertReply(vo);
	}

	@Override
	public int updateReply(EventReplyVO vo) {
		return dao.updateReply(vo);
	}

	@Override
	public int deleteReply(EventReplyVO vo) {
		return dao.deleteReply(vo);
	}

	@Override
	public List<EventReplyVO> selectReplyList(int event_seq) {
		return dao.selectReplyList(event_seq);
	}

	@Override
	public int selectReplyCnt(int event_seq) {
		return dao.selectReplyCnt(event_seq);
	}
		
}
