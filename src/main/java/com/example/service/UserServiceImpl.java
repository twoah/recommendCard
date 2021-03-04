package com.example.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.dao.UserDao;
import com.example.dto.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;

	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<UserVO> userList() {
		return dao.userList(session);
	}

	@Override
	public int userDelete(String user_id) {
		return dao.userDelete(session, user_id);
	}

	@Override
	public UserVO selectByUserid(String user_id) {
		return dao.selectByUserid(session, user_id);
	}

	@Override
	public int userUpdate(UserVO user) {
		return dao.userUpdate(session, user);
	}

	@Transactional
	public UserVO userLogin(UserVO user) {
		// 비밀번호 암호화
		String passwd = UserSha256.getEncrypt(user.getPw(), user.getUser_id());
		user.setPw(passwd);
		return dao.userLogin(session, user);
	}

	@Override
	public int userWrite(UserVO user) {
		String passwd = UserSha256.getEncrypt(user.getPw(), user.getUser_id());
		user.setPw(passwd);
		return dao.userWrite(session, user);
	}

	@Override
	public int userIdCheck(String user_id) {
		return dao.userIdCheck(session, user_id);
	}

}
