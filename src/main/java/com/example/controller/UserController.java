package com.example.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dto.CardVO;
import com.example.dto.PerformVO;
import com.example.dto.UserVO;
import com.example.service.CardService;
import com.example.service.PerformService;
import com.example.service.UserService;

@Controller
public class UserController {

   @Autowired
   UserService service;

   @Autowired
   CardService card_service;

   @Autowired
   PerformService perform_service;

   // 로그인 화면
   @GetMapping(value = "/login")
   public String loginUI() {
      return "login";
   }

   // 메인 화면
   @GetMapping(value = "/main")
   public String Main(HttpServletRequest request) {
      HttpSession session = request.getSession();
      return "main";
   }

   // 회원가입UI
   @GetMapping(value = "/signup")
   public String writeUI() {
      return "signup";
   }

   // 1.목록보기
   @RequestMapping("/list")
   public ModelAndView list() {
      List<UserVO> list = service.userList();
      ModelAndView mav = new ModelAndView();
      mav.addObject("userlist", list); // Model
      mav.setViewName("user_list"); // View
      return mav;
   }

   // 삭제하기
   @GetMapping(value = "/delete")
   public String delete(@RequestParam String user_id) {
      int num = service.userDelete(user_id);
      return "redirect:list";
   }

   // 4.글자세히 보기
   @RequestMapping("/retrieve")
   @ModelAttribute("xyz") // reqeust.setAttribute("xyz", board)
   public UserVO retrieve(@RequestParam String user_id) {
      UserVO user = service.selectByUserid(user_id);
      System.out.println(user);
      return user;
   }

   // 5.글 수정하기
   @PostMapping("/update")
   public String update(UserVO user, HttpServletRequest req) {
	   HttpSession session = req.getSession(true);
	   System.out.println("user= "+user);
      int num = service.userUpdate(user);
      session.setAttribute("user", user);
      System.out.println("update= "+num);
      return "redirect:mypage";
   }

   // 3. 회원가입
   @PostMapping("/signup")
   public String write(UserVO user) {
      int result = service.userIdCheck(user.getUser_id());
      if(result == 1) {
         return "signup";
      }else if(result ==0) {
         int num = service.userWrite(user);
         if (num == 0) {
            System.out.println("들어오지 않네?");
         } else {
            System.out.println("들어와~!");
            System.out.println(user.getBenefit1());
            
         }
      }
      return "redirect:login";
   }

   // 로그인
   @RequestMapping(value = "/signin", method = { RequestMethod.GET, RequestMethod.POST })
   public String login(UserVO userVO, HttpServletRequest req, RedirectAttributes rttr) {
      HttpSession session = req.getSession(true);
      UserVO user = service.userLogin(userVO);
      if (user == null) {
         session.setAttribute("user", null);
         rttr.addFlashAttribute("msg", false);
      } else {
         session.setMaxInactiveInterval(3600); // 1800 = 60s*60 (30분)
         session.setAttribute("user", user);
         System.out.println(session.getAttribute("user"));

         Object[] perform = perform_recommend(user, req);
         Object[] benefit = benefit_recommend(user, req);
         
         List<Integer> perform_card_id= new ArrayList<Integer>();
         List<String> perform_card_note = new ArrayList<String>();
         List<Integer> benefit_card_id = new ArrayList<Integer>();
         List<String> benefit_card_note = new ArrayList<String>();
         
         if(perform==null && benefit ==null) {
            perform_card_id = new ArrayList<Integer>(Arrays.asList(1,2,3));
            perform_card_note = new ArrayList<String>(Arrays.asList("매일 곳곳에서 누리는 큰 할인<br>지금 이 순간의 기쁨","쿠키처럼 달콤한 혜택이 쏟아진다!?<br>&nbsp","SK주유소 리터당 50포인트 적립<br>인터넷 영화 예매 1,500원 할인"));
            benefit_card_id = new ArrayList<Integer>(Arrays.asList(1,2,3));
            benefit_card_note = new ArrayList<String>(Arrays.asList("매일 곳곳에서 누리는 큰 할인<br>지금 이 순간의 기쁨","쿠키처럼 달콤한 혜택이 쏟아진다!?<br>&nbsp","SK주유소 리터당 50포인트 적립<br>인터넷 영화 예매 1,500원 할인"));
         }else if(perform == null) {
            perform_card_id = (List<Integer>) benefit[0];
            perform_card_note = (List<String>) benefit[1];
            benefit_card_id = (List<Integer>) benefit[0];
            benefit_card_note = (List<String>) benefit[1];
         }else if(benefit == null) {
            perform_card_id = (List<Integer>) perform[0];
            perform_card_note = (List<String>) perform[1];
            benefit_card_id = (List<Integer>) perform[0];
            benefit_card_note = (List<String>) perform[1];
         }else {
            perform_card_id = (List<Integer>) perform[0];
            perform_card_note = (List<String>) perform[1];
            benefit_card_id = (List<Integer>) benefit[0];
            benefit_card_note = (List<String>) benefit[1];
         }
         
         session.setAttribute("perform_recommend_card_id", perform_card_id);
         session.setAttribute("perform_recommend_card_note", perform_card_note);
         session.setAttribute("benefit_recommend_card_id", benefit_card_id);
         session.setAttribute("benefit_recommend_card_note", benefit_card_note);
         
         System.out.println(session.getAttribute("perform_recommend_card_id"));
         System.out.println(session.getAttribute("perform_recommend_card_note"));
         System.out.println(session.getAttribute("benefit_recommend_card_id"));
         System.out.println(session.getAttribute("benefit_recommend_card_note"));
      }
      return "redirect:login";
   }

   // 로그아웃
   @GetMapping("/logout")
   public String logout(HttpServletRequest request, HttpServletResponse response) {
      HttpSession session = request.getSession(true);
      request.getSession().invalidate();
      request.getSession(true);
      return "redirect:login";
   }

   // 아이디 중복 체크
   @ResponseBody
   @RequestMapping(value = "/idChk", method = RequestMethod.POST)
   public int idCheck(String user_id) {
      System.out.println("???????");
      System.out.println(user_id);
      if(user_id=="") {
         return 3;
      }
      System.out.println(service.userIdCheck(user_id));
      int num = service.userIdCheck(user_id);
      return num;
   }

   public Object[] perform_recommend(UserVO userVO, HttpServletRequest req){
      
      List<PerformVO> perform = perform_service.performListByCategory(userVO.getUser_id());
      List<CardVO> card = card_service.cardList();
      Map<Integer, ArrayList<Integer>> card_performlist = new HashMap<Integer, ArrayList<Integer>>();
      Map<Integer, String> card_notelist = new HashMap<Integer, String>();
      Map<Integer, Integer> result = new HashMap<Integer, Integer>();
      
      ArrayList<Integer> user_perform = new ArrayList<Integer>(Arrays.asList(0,0,0,0,0,0,0,0));
      
      for (PerformVO performVO : perform) {
         user_perform.set(performVO.getCategory_id() - 1, performVO.getCategory_sum());
      }
      
      if(user_perform.get(0)+user_perform.get(1)+user_perform.get(2)+user_perform.get(3)+user_perform.get(4)+user_perform.get(5)+
         user_perform.get(6)+user_perform.get(7) == 0){
         return null;
      }
      
      for (CardVO i : card) {

         ArrayList<Integer> card1 = new ArrayList<Integer>(Arrays.asList(0, 0, 0, 0, 0, 0, 0, 0));
         if (i.getBenefit1() == 0) {

         } else {
            card1.set(i.getBenefit1() - 1, i.getBenefit1_grade());
         }

         if (i.getBenefit2() == 0) {

         } else {
            card1.set(i.getBenefit2() - 1, i.getBenefit2_grade());
         }

         if (i.getBenefit3() == 0) {

         } else {
            card1.set(i.getBenefit3() - 1, i.getBenefit2_grade());
         }

         if (i.getBenefit4() == 0) {

         } else {
            card1.set(i.getBenefit4() - 1, i.getBenefit2_grade());
         }

         if (i.getBenefit5() == 0) {

         } else {
            card1.set(i.getBenefit5() - 1, i.getBenefit2_grade());
         }

         card_performlist.put(i.getCard_id(), card1);
         if(i.getNote().replace("&", "<br>").length()<23) {
             card_notelist.put(i.getCard_id(), i.getNote().replace("&", "<br>")+"<br>&nbsp");
         }
         else {
         card_notelist.put(i.getCard_id(), i.getNote().replace("&", "<br>"));
         }
      }
      
      for (Integer key : card_performlist.keySet()) {
         int sum = 0;
         ArrayList<Integer> _ = card_performlist.get(key);
         for (int i = 0; i < user_perform.size(); i++) {
            sum += (_.get(i)) * user_perform.get(i) * 0.01;
         }
         result.put(key, sum);
      }

      
      List<Integer> result1 = new ArrayList<>(result.keySet());
      ArrayList<String> card_note = new ArrayList<String>();
      
      result1.sort((o1, o2) -> result.get(o2) - result.get(o1));
      System.out.println(result);
      System.out.println(result1);
      card_note.add(card_notelist.get(result1.get(0)));
      card_note.add(card_notelist.get(result1.get(1)));
      card_note.add(card_notelist.get(result1.get(2)));
      
      return new Object[]{result1.subList(0,3),card_note};
   }
   
   public Object[] benefit_recommend(UserVO userVO, HttpServletRequest req){
      
      List<PerformVO> perform = perform_service.performListByCategory(userVO.getUser_id());
      List<CardVO> card = card_service.cardList();
      Map<Integer, ArrayList<Integer>> card_performlist = new HashMap<Integer, ArrayList<Integer>>();
      Map<Integer, String> card_notelist = new HashMap<Integer, String>();
      Map<Integer, Integer> result_benefit = new HashMap<Integer, Integer>();
      
      ArrayList<Integer> user_benefit = new ArrayList<Integer>(Arrays.asList(0,0,0,0,0,0,0,0));
      
      if(userVO.getBenefit1()==0) {
         return null;
      }else {
         user_benefit.set(userVO.getBenefit1()-1,15);
      }
      if (userVO.getBenefit2() == 0) {

      } else {
         user_benefit.set(userVO.getBenefit2() - 1, 9);
      }
      if (userVO.getBenefit3() == 0) {

      } else {
         user_benefit.set(userVO.getBenefit3() - 1, 6);
      }

      for (CardVO i : card) {

         ArrayList<Integer> card1 = new ArrayList<Integer>(Arrays.asList(0, 0, 0, 0, 0, 0, 0, 0));

         if (i.getBenefit1() == 0) {

         } else {
            card1.set(i.getBenefit1() - 1, i.getBenefit1_grade());
         }

         if (i.getBenefit2() == 0) {

         } else {
            card1.set(i.getBenefit2() - 1, i.getBenefit2_grade());
         }

         if (i.getBenefit3() == 0) {

         } else {
            card1.set(i.getBenefit3() - 1, i.getBenefit2_grade());
         }

         if (i.getBenefit4() == 0) {

         } else {
            card1.set(i.getBenefit4() - 1, i.getBenefit2_grade());
         }

         if (i.getBenefit5() == 0) {

         } else {
            card1.set(i.getBenefit5() - 1, i.getBenefit2_grade());
         }

         
         card_performlist.put(i.getCard_id(), card1);
         if(i.getNote().replace("&", "<br>").length()<23) {
             card_notelist.put(i.getCard_id(), i.getNote().replace("&", "<br>")+"<br>&nbsp");
         }
         else {
        	 card_notelist.put(i.getCard_id(), i.getNote().replace("&", "<br>"));
         }
      }
      
      for (Integer key : card_performlist.keySet()) {
         int sum = 0;
         ArrayList<Integer> _ = card_performlist.get(key);
         for (int i = 0; i < user_benefit.size(); i++) {
            sum += (_.get(i)) * user_benefit.get(i) * 0.01;
         }
         result_benefit.put(key, sum);
      }
      
      List<Integer> result2 = new ArrayList<>(result_benefit.keySet());
      
      result2.sort((o1, o2) -> result_benefit.get(o2) - result_benefit.get(o1));
      ArrayList<String> card_note = new ArrayList<String>();
      
      card_note.add(card_notelist.get(result2.get(0)));
      card_note.add(card_notelist.get(result2.get(1)));
      card_note.add(card_notelist.get(result2.get(2)));
      
      return new Object[]{result2.subList(0,3),card_note};
   }
}