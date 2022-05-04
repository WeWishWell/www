package com.wewishwell.shop.service;

import java.util.List;
import java.util.Map;

import com.wewishwell.shop.vo.EventBoardVO;
import com.wewishwell.shop.vo.EventReplyVO;

public interface EventService {

	public List<EventBoardVO> eventListWinner();
	
	public List<EventBoardVO> eventListOn();
	
	public List<EventBoardVO> eventListEnd();
	
	public EventBoardVO eventDetailWinner(EventBoardVO vo);
	
	public EventBoardVO eventDetail(EventBoardVO vo);

	public int insertEvent(EventBoardVO vo);

	public int deleteEvent(EventBoardVO vo);

	public int updateEvent(EventBoardVO vo);

	public List<EventBoardVO> eventSearch(Map<String, String> search);

	// reply
	public int insertReply(EventReplyVO vo);

	public int updateReply(EventReplyVO vo);

	public int deleteReply(EventReplyVO vo);

	public List<EventReplyVO> selectReplyList(int event_seq);

	public int selectReplyCnt(int event_seq);
	
}
