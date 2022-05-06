package com.wewishwell.shop.service;

import java.util.List;
import java.util.Map;

import com.wewishwell.shop.vo.EventBoardVO;

public interface AdminEventService {
	
	public List<EventBoardVO> selectEventList();

	public int insertEvent(EventBoardVO vo);
	
	public int updateEvent(EventBoardVO vo);

	public int deleteEvent(EventBoardVO vo);

	public List<EventBoardVO> eventSearch(Map<String, String> search);

	public EventBoardVO adminEventDetail(String seq);
	
	public int eventMaxNum();
	
}
