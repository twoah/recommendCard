package com.example.controller;

import javax.servlet.http.HttpSession;

import com.example.dto.UserVO;


public class HttpSessionUtils {
	public static final String USER_SESSION_KEY="sessionedUser";
	
	public static boolean isLoginUser(HttpSession session){
		Object sessionedUser =session.getAttribute(USER_SESSION_KEY);
		if(sessionedUser==null){
			return false;
		}
		return true;
	}
	
	public static UserVO getUserFromSession(HttpSession session){
		if(!isLoginUser(session)){
			return null;
		}
		return (UserVO)session.getAttribute(USER_SESSION_KEY);
	}
}