package com.example.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.PerformVO;

@Repository
public class PerformDaoImpl implements PerformDao {

	@Autowired
	SqlSession session;

	@Override
	public List<PerformVO> performListByAll(PerformVO performVO) {
		return session.selectList("PerformMapper.performListByAll", performVO);
	}

	@Override
	public List<PerformVO> performListByCategory(String user_id) {
		return session.selectList("PerformMapper.performListByCategory", user_id);
	}

	@Override
	public List<PerformVO> performListByDate(PerformVO performVO) {
		return session.selectList("PerformMapper.performListByDate", performVO);
	}

	@Override
	public int selectCardSumByCardnum(String card_num) {
		return session.selectOne("PerformMapper.selectCardSumByCardnum", card_num);
	}

	@Override
	public String selectLastPayTimeByCardnum(String card_num) {
		return session.selectOne("PerformMapper.selectLastPayTimeByCardnum", card_num);
	}

	@Override
	public List<PerformVO> performListByCardname(PerformVO performVO){
		return session.selectList("PerformMapper.performListByCardname", performVO);
	}

}
