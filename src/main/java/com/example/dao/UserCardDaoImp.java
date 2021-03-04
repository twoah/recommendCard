package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.UserCardVO;

@Repository
public class UserCardDaoImp implements UserCardDao {

	@Autowired
	SqlSession session;

	@Override
	public List<UserCardVO> usercardList(String user_id) {
		return session.selectList("UserCardMapper.usercardList", user_id);
	}

	@Override
	public UserCardVO selectByCardid(UserCardVO usercard) {
		return session.selectOne("UserCardMapper.selectByCardid", usercard);
	}

	@Override
	public UserCardVO selectByCardname(UserCardVO usercard) {
		return session.selectOne("UserCardMapper.selectByCardname", usercard);
	}

	@Override
	public int insertUsercard(UserCardVO usercard) {
		// TODO Auto-generated method stub
		return session.insert("UserCardMapper.insertUsercard", usercard);
	}

}
