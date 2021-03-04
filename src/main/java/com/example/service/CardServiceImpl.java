package com.example.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.CardDao;
import com.example.dto.CardVO;

@Service
public class CardServiceImpl implements CardService {

	
	@Autowired
	CardDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	
	@Override
	public List<CardVO> cardList() {
		// TODO Auto-generated method stub
		return dao.cardList(session);
	}

	@Override
	public CardVO selectByCardid(int card_id) {
		// TODO Auto-generated method stub
		return dao.selectByCardid(session, card_id);
	}

	@Override
	public CardVO selectBenefitByCardid(String card_id) {
		// TODO Auto-generated method stub
		return dao.selectBenefitByCardid(session, card_id);
	}



}
