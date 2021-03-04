package com.example.service;

import java.util.List;

import com.example.dto.ReviewVO;

public interface ReviewService {
	public abstract List<ReviewVO> reviewListByCardid(int card_id);

	public abstract int reviewDelete(String review_id);
	
	public abstract int statusGoodcnt(String review_id);
	
	public abstract int statusBadcnt(String review_id);
	
	public abstract int reviewWrite(ReviewVO review);
	
	
}
