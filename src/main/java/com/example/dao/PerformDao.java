package com.example.dao;

import java.sql.Date;
import java.util.List;

import com.example.dto.PerformVO;

public interface PerformDao {

	public List<PerformVO> performListByAll(PerformVO performVO);

	public List<PerformVO> performListByCategory(String user_id);

	public List<PerformVO> performListByDate(PerformVO performVO);

	public int selectCardSumByCardnum(String card_num);
	
	public String selectLastPayTimeByCardnum(String card_num);

	public List<PerformVO> performListByCardname(PerformVO performVO);
	
}
