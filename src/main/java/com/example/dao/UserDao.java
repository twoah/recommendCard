package com.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.example.dto.UserVO;

public interface UserDao {

	public abstract List<UserVO> userList(SqlSessionTemplate session);

	public abstract UserVO selectByUserid(SqlSessionTemplate session, String user_id);

	public abstract int userDelete(SqlSessionTemplate session, String user_id);
	
	public abstract int userUpdate(SqlSessionTemplate session, UserVO user);
	
	public abstract UserVO userLogin(SqlSessionTemplate session, UserVO user);
	
	public abstract int userWrite(SqlSessionTemplate session, UserVO user);
	
	public abstract int userIdCheck(SqlSessionTemplate session, String user_id);

}
