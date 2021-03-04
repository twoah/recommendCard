package com.example.service;

import java.util.List;

import com.example.dto.UserVO;

public interface UserService {

	public abstract List<UserVO> userList();

	public abstract UserVO selectByUserid(String user_id);

	public abstract int userDelete(String user_id);
	
	public abstract int userUpdate(UserVO user);
	
	public abstract UserVO userLogin(UserVO user);
	
	public abstract int userWrite(UserVO user);
	
	public abstract int userIdCheck(String user_id);

}
