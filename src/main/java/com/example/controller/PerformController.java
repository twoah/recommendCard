package com.example.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.PerformVO;
import com.example.dto.PerformSelectVO;
import com.example.dto.UserVO;
import com.example.service.PerformService;

@Controller
public class PerformController {

	@Autowired
	PerformService service;

	Date date;
	String time = "2021-02-25";
	String user_id;
	String card_name = "[IBK기업은행] 일상의 기쁨카드";

	//전체 카드의 월별 실적  (default: 현재 날짜 기준 이전 달)
	@GetMapping("/perform_all")
	public String performListByAll(Model model, HttpSession session) {

		user_id = loginCheck(session);
		if (user_id == null)
			return "redirect:/loginpage";

		date = Date.valueOf(time);
		PerformVO performVO = new PerformVO(user_id, date);
		List<PerformVO> list = service.performListByAll(performVO);

		model.addAttribute("user_id", user_id);
		model.addAttribute("performList", list);

		return "/perform_all";
	}
	
	@PostMapping(value = "/perform_month", consumes = {MediaType.APPLICATION_FORM_URLENCODED_VALUE})
	public String performListByAllPost(Model model, HttpSession session, @ModelAttribute PerformSelectVO performSelectVO) {
		user_id = loginCheck(session);
		if (user_id == null){
			return "redirect:/loginpage";
			//date = Date.valueOf(time);
		}

		String card_name = performSelectVO.getCard_name();
		int select_month = performSelectVO.getSelect_month();
		int select_year = performSelectVO.getSelect_year();
		time = select_year + "-" + select_month + "-01";
		date = Date.valueOf(time);
		PerformVO performVO = new PerformVO(user_id, date);
		performVO.setCard_num(card_name);

		model.addAttribute("user_id", user_id);
		model.addAttribute("month", select_month);
		model.addAttribute("year", select_year);
		List<PerformVO> list = service.performListByAll(performVO);

		// card_name == "all"
		if(card_name.equals("all")){
			//모든 카드에 대한 해당월 실적이 list에 담김
			list = service.performListByAll(performVO);
			setCategory(list);

		}
		else{
			//해당 카드에 대한 해당월 실적이 list에 담김 
			list = service.performListByDate(new PerformVO(user_id,card_name, date));
			setCategory(list);
		}
		

		model.addAttribute("performList", list);

		return "/perform_month";

	}


	//카테고리, 월별 사용자 실적
	@GetMapping("/perform_category")
	public String performListByCategory(Model model, HttpSession session) {
		user_id = loginCheck(session);
		if (user_id == null)
			return "redirect:/loginpage";
		List<PerformVO> list = service.performListByCategory(user_id);
		model.addAttribute("performList", list);
		return "/perform_category";
	}

	//개별 카드의 월별 실적 (default: 현재 날짜 기준 이전 달)
	@GetMapping("/perform_date")
	public String performListByDate(Model model, HttpSession session) {
		user_id = loginCheck(session);
		if (user_id == null)
			return "redirect:/loginpage";
		
		date = Date.valueOf(time);
		PerformVO performVO = new PerformVO(user_id, card_name, date);
		List<PerformVO> list = service.performListByDate(performVO);
		model.addAttribute("performList", list);
		return "/perform_date";
	}

	public String loginCheck(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null)
			return null;
		return user.getUser_id();
	}

	public List<PerformVO> setCategory(List<PerformVO> list) {

		for (PerformVO performVO : list) {
			if (performVO.getCategory_id() == 1)
				performVO.setCategory_name("생활");
			else if (performVO.getCategory_id() == 2)
				performVO.setCategory_name("문화");
			else if (performVO.getCategory_id() == 3)
				performVO.setCategory_name("교육");
			else if (performVO.getCategory_id() == 4)
				performVO.setCategory_name("쇼핑");
			else if (performVO.getCategory_id() == 5)
				performVO.setCategory_name("외식");
			else if (performVO.getCategory_id() == 6)
				performVO.setCategory_name("자동차");
			else if (performVO.getCategory_id() == 7)
				performVO.setCategory_name("통신");
			else if (performVO.getCategory_id() == 8)
				performVO.setCategory_name("교통");
		}
		return list;
	}

}
