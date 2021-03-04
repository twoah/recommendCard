package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.dto.CardVO;
import com.example.dto.ReviewVO;
import com.example.dto.UserVO;
import com.example.service.ReviewService;
import com.example.service.UserService;

@Controller
public class ReviewController {

	@Autowired
	ReviewService service;
	@Autowired
	UserService user_service;

	// card detail -> 해당 카드 ID에 해당하는 리뷰 목록보기
	@RequestMapping("/review_carddetail_ajax")
	@ResponseBody
	public List<ReviewVO> listByCardid(@RequestParam int card_id) {
		List<ReviewVO> list = service.reviewListByCardid(card_id);
		return list;
	}

	@RequestMapping("/review_carddetail_on_ajax")
	@ResponseBody
	public String reviewOn(@RequestParam String reviewOn) {
		return reviewOn;
	}

	@PostMapping("/reviewWrite")
	public String write(@ModelAttribute ReviewVO review) {
		int isReviewSuccess = service.reviewWrite(review);

		System.out.println("!!!!!!!!!!!!!!" + review.getCard_id());

		if (isReviewSuccess != 0) {
			return "redirect:carddetail?card_id=" + review.getCard_id() + "&reviewOn=1";
		} else {
			return "redirect:carddetail?card_id=" + review.getCard_id() + "&reviewOn=1";
		}
	}

	@PostMapping("/review_good_ajax")
	@ResponseBody
	public int review_good(@RequestParam String review_id, @RequestParam int status) {
		int num = 0;
		if (status == 1) {
			num = service.statusGoodcnt(review_id);
			return num;
		} else {
			num = service.statusBadcnt(review_id);
			return num;
		}
	}

	// 리뷰 삭제하기
	@GetMapping("/review_delete")
	@ResponseBody
	public int delete(@RequestParam String review_id) {
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!! :: " + review_id);
		
		
		return service.reviewDelete(review_id);
	}

	// 좋아요
	@GetMapping("/statusGoodcnt")
	public String statusgoodcnt(@RequestParam String review_id) {
		int num = service.statusGoodcnt(review_id);
		System.out.println("Good");
		return "redirect:review";
	}

	// 싫어요
	@GetMapping("/statusBadcnt")
	public String statusbadcnt(@RequestParam String review_id) {
		int num = service.statusBadcnt(review_id);
		System.out.println("Bad");
		return "redirect:review";
	}

}
