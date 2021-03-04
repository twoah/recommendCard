package com.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.example.dto.UserVO;

@Repository
public class UserDaoImpl implements UserDao {

	@Override
	public List<UserVO> userList(SqlSessionTemplate session) {
		return session.selectList("UserMapper.userList");
	}

	@Override
	public int userDelete(SqlSessionTemplate session, String user_id) {
		return session.delete("UserMapper.userDelete", user_id);
	}

	@Override
	public UserVO selectByUserid(SqlSessionTemplate session, String user_id) {
		return session.selectOne("UserMapper.selectByUserid", user_id);
	}

	@Override
	public int userUpdate(SqlSessionTemplate session, UserVO user) {
		return session.update("UserMapper.userUpdate",user);
	}

	@Override
	public UserVO userLogin(SqlSessionTemplate session, UserVO user) {
		return session.selectOne("UserMapper.userLogin", user);
	}

	@Override
	public int userWrite(SqlSessionTemplate session, UserVO user) {
		return session.insert("UserMapper.userWrite", user);
	}

	@Override
	public int userIdCheck(SqlSessionTemplate session, String user_id) {
		return session.selectOne("UserMapper.userIdCheck", user_id);
	}

}
