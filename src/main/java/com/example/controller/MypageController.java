package com.example.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.dto.PerformVO;
import com.example.dto.UserCardVO;
import com.example.dto.UserVO;
import com.example.service.PerformService;
import com.example.service.UserCardService;

@Controller
public class MypageController {

	@Autowired
	PerformService performService;

	@Autowired
	UserCardService usercardService;

	@RequestMapping(value = "/navbar", method = RequestMethod.GET)
	public String navbar(Model model) {
		return "navbar";
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Model model) {

		return "mypage";
	}

	@RequestMapping(value = "/summary", method = RequestMethod.GET)
	public String summary(Model model, HttpSession session) {

		int sum = 0;
		UserVO user = (UserVO) session.getAttribute("user");
		List<UserCardVO> ucList = usercardService.usercardList(user.getUser_id());// 임의로 세팅

		// 카드 결제 금액(이전 달의 카드 별 결제 금액)
		for (int i=0;i<ucList.size();i++) {
			
			UserCardVO ucVO = ucList.get(i);
			ucVO.setIdx(i);
			String card_num = ucVO.getCard_num();
			ucVO.setCard_url(ucVO.getCard_id() + "_card.png");

			String last_paytime = performService.selectLastPayTimeByCardnum(card_num);
			if(last_paytime != null)
				ucVO.setPaytime(last_paytime.substring(0, 10));

			int prev_sum = 0;
			prev_sum = performService.selectCardSumByCardnum(card_num);
			ucVO.setPrev_sum(prev_sum);
			sum += prev_sum;
		}

		// 카드 카테고리별 이용분석 (원형 그래프 데이터) : Map에 구현
		List<PerformVO> performList = performService.performListByCategory(user.getUser_id());// 임의로 세팅
		performList = setCategory(performList);

		model.addAttribute("performList", performList);
		model.addAttribute("userCardList", ucList);
		model.addAttribute("totalSum", sum);
		model.addAttribute("month", prevMonth().substring(5, 7));
		return "summary";
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

	public String prevMonth() {
		Calendar cal = Calendar.getInstance();
		cal.add(cal.MONTH, -1); // 다음달
		String format = "MM";
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD");
		String date = sdf.format(cal.getTime());
		System.out.println(date);
		return date;
	}

	@RequestMapping(value = "/perform", method = RequestMethod.GET)
	public String perform(Model model, HttpSession session, HttpServletRequest req) {

		String year = (req.getAttribute("year") != null) ? req.getParameter("year") : "2021";
		String month = (req.getAttribute("month") != null) ? req.getParameter("year") : "02";

		Date date = Date.valueOf(year + "-" + month + "-" + "01");
		UserVO user = (UserVO) session.getAttribute("user");
		List<PerformVO> performList;
		List<UserCardVO> cardList;

		cardList = usercardService.usercardList(user.getUser_id());

		// 전체 실적 조회인경우
		performList = performService.performListByAll(new PerformVO("user10", date));

		// 날짜별 조회인경우
		performList = performService.performListByDate(new PerformVO("user10", "1234-5678-7878-7878", date));
		model.addAttribute("cardList", cardList);

		return "perform";
	}

	@RequestMapping(value = "/personal", method = RequestMethod.GET)
	public String personal(Model model) {
		return "personal";
	}

}
