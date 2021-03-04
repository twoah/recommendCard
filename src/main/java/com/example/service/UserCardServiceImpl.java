package com.example.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dao.UserCardDao;
import com.example.dto.UserCardVO;

@Repository
public class UserCardServiceImpl implements UserCardService {

	@Autowired
	UserCardDao dao;

	@Override
	public List<UserCardVO> usercardList(String user_id) {
		return dao.usercardList(user_id);
	}

	@Override
	public UserCardVO selectByCardid(UserCardVO vo) {
		return dao.selectByCardid(vo);
	}

	@Override
	public UserCardVO selectByCardname(UserCardVO vo) {
		return dao.selectByCardname(vo);
	}

	@Override
	public int insertUsercard(UserCardVO vo) {
		// TODO Auto-generated method stub
		return dao.insertUsercard(vo);
	}

	@Override
	public String numberGen(int len, int dupCd) {
		Random rand = new Random();
        String numStr = ""; //난수가 저장될 변수
        
        for(int i=0;i<len;i++) {
            
            //0~9 까지 난수 생성
            String ran = Integer.toString(rand.nextInt(10));
            
            if(dupCd==1) {
                //중복 허용시 numStr에 append
                numStr += ran;
            }else if(dupCd==2) {
                //중복을 허용하지 않을시 중복된 값이 있는지 검사한다
                if(!numStr.contains(ran)) {
                    //중복된 값이 없으면 numStr에 append
                    numStr += ran;
                }else {
                    //생성된 난수가 중복되면 루틴을 다시 실행한다
                    i-=1;
                }
            }
        }
        return numStr;
	}

		
	

}
