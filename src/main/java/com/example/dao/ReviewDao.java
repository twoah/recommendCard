package com.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.example.dto.ReviewVO;

public interface ReviewDao {
	public abstract List<ReviewVO> reviewListByCardid(SqlSessionTemplate session, int card_id);

	public abstract int reviewDelete(SqlSessionTemplate session, String review_id);
	
	public abstract int statusGoodcnt(SqlSessionTemplate session, String review_id);
	
	public abstract int statusBadcnt(SqlSessionTemplate session, String review_id);
	
	public abstract int reviewWrite(SqlSessionTemplate session, ReviewVO review);
}
