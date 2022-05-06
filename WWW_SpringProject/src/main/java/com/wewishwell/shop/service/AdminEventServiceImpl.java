package com.wewishwell.shop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wewishwell.shop.dao.AdminEventDao;
import com.wewishwell.shop.vo.EventBoardVO;

@Service
public class AdminEventServiceImpl implements AdminEventService {

	@Autowired
	AdminEventDao dao;
	
	@Override
	public List<EventBoardVO> selectEventList() {
		return dao.selectEventList();
	}

	@Override
	public int insertEvent(EventBoardVO vo) {
		return dao.insertEvent(vo);
	}

	@Override
	public int updateEvent(EventBoardVO vo) {
		return dao.updateEvent(vo);
	}

	@Override
	public int deleteEvent(EventBoardVO vo) {
		return dao.deleteEvent(vo);
	}

	@Override
	public List<EventBoardVO> eventSearch(Map<String, String> search) {
		return dao.eventSearch(search);
	}

	@Override
	public EventBoardVO adminEventDetail(String seq) {
		return dao.adminEventDetail(seq);
	}

	@Override
	public int eventMaxNum() {
		int i = dao.eventMaxNum();
		return i+1;
	}

}
