package com.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.example.dto.ReviewVO;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Override
	public List<ReviewVO> reviewListByCardid(SqlSessionTemplate session, int card_id) {
		return session.selectList("ReviewMapper.reviewListByCardid", card_id);
	}

	@Override
	public int reviewDelete(SqlSessionTemplate session, String review_id) {
		return session.delete("ReviewMapper.reviewDelete", review_id);
	}

	@Override
	public int statusGoodcnt(SqlSessionTemplate session, String review_id) {
		return session.update("ReviewMapper.statusGoodcnt",review_id);
	}

	@Override
	public int statusBadcnt(SqlSessionTemplate session, String review_id) {
		return session.update("ReviewMapper.statusBadcnt",review_id);
	}

	@Override
	public int reviewWrite(SqlSessionTemplate session, ReviewVO review) {
		return session.insert("ReviewMapper.reviewWrite",review);
	}


}
