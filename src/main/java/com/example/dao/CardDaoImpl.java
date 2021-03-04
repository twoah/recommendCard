package com.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.example.dto.CardVO;

@Repository
public class CardDaoImpl implements CardDao {

	@Override
	public List<CardVO> cardList(SqlSessionTemplate session) {
		return session.selectList("CardMapper.cardList");
	}

	@Override
	public CardVO selectByCardid(SqlSessionTemplate session, int card_id) {
		return session.selectOne("CardMapper.selectByCardid", card_id);
	}

	@Override
	public CardVO selectBenefitByCardid(SqlSessionTemplate session, String card_id) {
		return session.selectOne("CardMapper.selectBenefitByCardid", card_id);
	}

}
