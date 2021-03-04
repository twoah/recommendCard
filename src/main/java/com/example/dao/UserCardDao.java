package com.example.dao;

import java.util.List;

import com.example.dto.UserCardVO;

public interface UserCardDao {
	
	public abstract List<UserCardVO> usercardList(String user_id);
	public abstract UserCardVO selectByCardid(UserCardVO usercard);
	public abstract UserCardVO selectByCardname(UserCardVO usercard);
	public abstract int insertUsercard(UserCardVO usercard);
	
	
	
}
