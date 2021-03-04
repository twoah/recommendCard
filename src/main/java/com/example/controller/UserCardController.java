package com.example.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.CardVO;
import com.example.dto.UserCardVO;
import com.example.dto.UserVO;
import com.example.service.CardService;
import com.example.service.UserCardService;

@Controller
public class UserCardController {

	@Autowired
	UserCardService service;

	@Autowired
	CardService service_Card;

	
	@GetMapping("/usercard")
	public String usercardList(Model model, HttpSession session) {

		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null)
			return "redirect:/loginpage";

		List<UserCardVO> list = service.usercardList(user.getUser_id());
		model.addAttribute("usercardList", list);
		return "/usercard_list";
	}

	@GetMapping("/usercard/{card_id}")
	public String usercardDetail(Model model, HttpSession session, @PathVariable int card_id) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null)
			return "redirect:/loginpage";

		UserCardVO usercard = service.selectByCardid(new UserCardVO(user.getUser_id(), card_id));
		model.addAttribute("usercard", usercard);
		return "/usercard_detail";
	}

	@PostMapping("/usercard_have_ajax")
	@ResponseBody
	public int card_have(@RequestParam String user_id, @RequestParam int card_id) {
		List<UserCardVO> list = service.usercardList(user_id);
		for (UserCardVO userCardVO : list) {
			if (userCardVO.getCard_id() == card_id) {
				return 1;
			}
		}
		return 0;
	}

	@PostMapping("/usercard_create_ajax")
	@ResponseBody
	public int card_create(@RequestParam String user_id, @RequestParam int card_id) {
		String first = service.numberGen(4,1);
		String second = service.numberGen(4,1);
		String third = service.numberGen(4,1);
		String fourth = service.numberGen(4,1);
		
		String card_num_rand = first + "-" + second + "-" + third + "-" + fourth;
		
		System.out.println(card_num_rand);
		
		CardVO card = service_Card.selectByCardid(card_id);
		
		UserCardVO usercard = new UserCardVO(user_id, card_id, card_num_rand, card.getCard_name(), "1");
		service.insertUsercard(usercard);
		return 0;
	}

}



