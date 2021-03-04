package com.example.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.CardVO;
import com.example.service.CardService;

@Controller
public class CardController {
	@Autowired
	CardService service;
	
	// 1.목록보기
	@RequestMapping("/cardlist")
	public void list() {
	}
	
	// 1.목록보기_ajax
	@RequestMapping("/cardlist_ajax")
	@ResponseBody
	public List<CardVO> cardList() {
		List<CardVO> list = service.cardList();
		return list;
	}
	
	// 2. 상세조회
	@RequestMapping("/carddetail")
	public String detail(@RequestParam int card_id,@RequestParam String reviewOn, Model model) {
		CardVO card = service.selectByCardid(card_id);
		ArrayList<String> list = new ArrayList<String>();
		
		list.add(reviewOn);
		
		model.addAttribute("cardDetail", card);
		model.addAttribute("reviewOn", list);
		return "carddetail";
	}
	
	

	
}
