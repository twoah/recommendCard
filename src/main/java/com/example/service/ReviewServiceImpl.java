package com.example.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.ReviewDao;
import com.example.dto.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<ReviewVO> reviewListByCardid(int card_id) {
		return dao.reviewListByCardid(session, card_id);
	}

	@Override
	public int reviewDelete(String review_id) {
		return dao.reviewDelete(session, review_id);
	}

	@Override
	public int statusGoodcnt(String review_id) {
		return dao.statusGoodcnt(session, review_id);
	}

	@Override
	public int statusBadcnt(String review_id) {
		return dao.statusBadcnt(session, review_id);
	}

	@Override
	public int reviewWrite(ReviewVO review) {
		return dao.reviewWrite(session, review);
	}



}
