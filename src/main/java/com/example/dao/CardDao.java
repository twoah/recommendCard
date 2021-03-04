package com.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.example.dto.CardVO;


public interface CardDao {
	public abstract List<CardVO> cardList(SqlSessionTemplate session);

	public abstract CardVO selectByCardid(SqlSessionTemplate session, int card_id);
	
	public abstract CardVO selectBenefitByCardid(SqlSessionTemplate session, String card_id);
	
	
	
}
