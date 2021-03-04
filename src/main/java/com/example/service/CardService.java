package com.example.service;

import java.util.List;

import com.example.dto.CardVO;


public interface CardService {
	
	public abstract List<CardVO> cardList();
	public abstract CardVO selectByCardid(int card_id);
	public abstract CardVO selectBenefitByCardid(String card_id);


}
