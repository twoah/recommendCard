package com.example.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dao.PerformDao;
import com.example.dto.PerformVO;

@Repository
public class PerformServiceImpl implements PerformService{

	@Autowired
	PerformDao dao;


	@Override
	public List<PerformVO> performListByAll(PerformVO performVO) {
		return dao.performListByAll(performVO);
	}

	@Override
	public List<PerformVO> performListByCategory(String user_id) {
		return dao.performListByCategory(user_id);
	}

	@Override
	public List<PerformVO> performListByDate(PerformVO performVO) {
		return dao.performListByDate(performVO);
	}

	@Override
	public int selectCardSumByCardnum(String card_num) {
		return dao.selectCardSumByCardnum(card_num);
	}

	@Override
	public String selectLastPayTimeByCardnum(String card_num) {
		return dao.selectLastPayTimeByCardnum(card_num);
	}

	@Override
	public List<PerformVO> performListByCardname(PerformVO performVO){
		return dao.performListByCardname(performVO);
	}
}
