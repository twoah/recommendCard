package com.example.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.dto.UserCardVO;

@Service
public interface UserCardService {

	public abstract List<UserCardVO> usercardList(String user_id);
	public abstract UserCardVO selectByCardid(UserCardVO vo);
	public abstract UserCardVO selectByCardname(UserCardVO vo);
	public abstract int insertUsercard(UserCardVO vo);
	public abstract String numberGen(int len, int dupCd);
}
