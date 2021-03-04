package com.example.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.dto.CardVO;
import com.example.dto.PerformVO;
import com.example.dto.UserVO;
import com.example.service.CardService;
import com.example.service.PerformService;
import com.example.service.UserService;

@Controller
public class CardRecommendController {
	
	@Autowired
	UserService service;

	@Autowired
	PerformService perform_service;
	
	@Autowired
	CardService card_service;
	

	public List<Entry<String, Integer>> perform_recommend(UserVO userVO, HttpServletRequest req){
		HttpSession session = req.getSession(true);
		UserVO user = service.userLogin(userVO);
		
		session.setMaxInactiveInterval(3600); // 1800 = 60s*60 (30분) 
		session.setAttribute("user", user);
		
		List<PerformVO> perform = perform_service.performListByCategory(user.getUser_id());
		List<CardVO> card = card_service.cardList();
		Map<String, ArrayList<Integer>> card_performlist = new HashMap<String, ArrayList<Integer>>();
		Map<String, Integer> result = new HashMap<String, Integer>();
		
		ArrayList<Integer> user_perform = new ArrayList<Integer>(Arrays.asList(0,0,0,0,0,0,0,0));
		
		for (PerformVO performVO : perform) {
			user_perform.set(performVO.getCategory_id()-1, performVO.getCategory_sum());
		}
		
		for (CardVO i : card) {
			
			ArrayList<Integer> card1 = new ArrayList<Integer>(Arrays.asList(0,0,0,0,0,0,0,0));
			if(i.getBenefit1()==0) {
				
			}else {
				card1.set(i.getBenefit1()-1, i.getBenefit1_grade());
			}
			
			if(i.getBenefit2()==0) {
				
			}else {
				card1.set(i.getBenefit2()-1, i.getBenefit2_grade());
			}
			
			if(i.getBenefit3()==0) {
				
			}else {
				card1.set(i.getBenefit3()-1, i.getBenefit2_grade());
			}
			
			if(i.getBenefit4()==0) {
				
			}else {
				card1.set(i.getBenefit4()-1, i.getBenefit2_grade());
			}
			
			if(i.getBenefit5()==0) {
				
			}else {
				card1.set(i.getBenefit5()-1, i.getBenefit2_grade());
			}
			
			card_performlist.put(i.getCard_name(), card1);
		}
		
		for (String key : card_performlist.keySet()) {
			int sum = 0;
			ArrayList<Integer> _ = card_performlist.get(key);
			for (int i = 0; i < user_perform.size(); i++) {
				sum += (_.get(i)) * user_perform.get(i)*0.01;
			}
			result.put(key, sum);
		}
		
		List<Entry<String, Integer>> result1 = result.entrySet().stream()
		        .sorted(Map.Entry.comparingByValue())
		        .collect(Collectors.toList());
		
		Collections.reverse(result1);
		
		return result1.subList(0, 3);
	}
	
	public List<Entry<String, Integer>> benefit_recommend(UserVO userVO, HttpServletRequest req){
		HttpSession session = req.getSession(true);
		UserVO user = service.userLogin(userVO);
		
		session.setMaxInactiveInterval(3600); // 1800 = 60s*60 (30분) 
		session.setAttribute("user", user);
		
		List<PerformVO> perform = perform_service.performListByCategory(user.getUser_id());
		List<CardVO> card = card_service.cardList();
		Map<String, ArrayList<Integer>> card_performlist = new HashMap<String, ArrayList<Integer>>();
		Map<String, Integer> result_benefit = new HashMap<String, Integer>();
		
		ArrayList<Integer> user_benefit = new ArrayList<Integer>(Arrays.asList(0,0,0,0,0,0,0,0));
		
		if(user.getBenefit1()==0) {

		}else {
			user_benefit.set(user.getBenefit1()-1,15);
		}
		if(user.getBenefit2()==0) {
			
		}else {
			user_benefit.set(user.getBenefit2()-1,9);
		}
		if(user.getBenefit3()==0) {
			
		}else {
			user_benefit.set(user.getBenefit3()-1,6);
		}
		
		for (CardVO i : card) {
			
			ArrayList<Integer> card1 = new ArrayList<Integer>(Arrays.asList(0,0,0,0,0,0,0,0));
			
			if(i.getBenefit1()==0) {
				
			}else {
				card1.set(i.getBenefit1()-1, i.getBenefit1_grade());
			}
			
			if(i.getBenefit2()==0) {
				
			}else {
				card1.set(i.getBenefit2()-1, i.getBenefit2_grade());
			}
			
			if(i.getBenefit3()==0) {
				
			}else {
				card1.set(i.getBenefit3()-1, i.getBenefit2_grade());
			}
			
			if(i.getBenefit4()==0) {
				
			}else {
				card1.set(i.getBenefit4()-1, i.getBenefit2_grade());
			}
			
			if(i.getBenefit5()==0) {
				
			}else {
				card1.set(i.getBenefit5()-1, i.getBenefit2_grade());
			}
			
			card_performlist.put(i.getCard_name(), card1);
		}
		
		for (String key : card_performlist.keySet()) {
			int sum = 0;
			ArrayList<Integer> _ = card_performlist.get(key);
			for (int i = 0; i < user_benefit.size(); i++) {
				sum += (_.get(i)) * user_benefit.get(i)*0.01;
			}
			result_benefit.put(key, sum);
		}
		
		List<Entry<String, Integer>> result2 = result_benefit.entrySet().stream()
		        .sorted(Map.Entry.comparingByValue())
		        .collect(Collectors.toList());
		
		Collections.reverse(result2);
		
		return result2.subList(0,3);
	}
}