package com.example.service;


import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.dto.PerformVO;

@Service
public interface PerformService {
	public abstract List<PerformVO> performListByAll(PerformVO performVO);
	public abstract List<PerformVO> performListByCategory(String user_id);
	public abstract List<PerformVO> performListByDate(PerformVO performVO);
	public abstract int selectCardSumByCardnum(String card_num);
	public abstract String selectLastPayTimeByCardnum(String card_num);
	public abstract List<PerformVO> performListByCardname(PerformVO perfomrVO);
}
