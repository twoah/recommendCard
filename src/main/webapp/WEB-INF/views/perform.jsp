<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
   integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
   crossorigin="anonymous">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript" src="resources/js/script.js"></script>
<link rel="stylesheet" href="resources/css/mypage_perform.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/perform.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   $("#search_btn").trigger('click');
});
</script>

	<style>
	/*나눔스퀘어 웹 폰트 지정*/
	@import url(//cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);
	
	.ns-font{
		font-family:'NanumSquare', serif;
	}
	
	.nsb-font{
		font-family:'NanumSquare', serif;
		font-weight: bold;
	}
	</style>	

</head>

<body>
   
   <div class = "ns-font down_container">
      <div class= "nsb-font user_perform">
         <span>실적 상세 조회</span>
      </div>
      <div class="perform-select">
         <div class = "perform-select-div">
            <div class="user_perform">
               <div class="select_2">
                  <span class="nsb-font user_perform_select">카드선택</span>
                     <select id="select_card" class="ns-font select_box_card">
                        <option value="all">전체</option>
                        <c:forEach var="card" items="${cardList}">
                           <option value='${card.card_name}'>${card.card_name}</option>
                        </c:forEach>
                     </select>
                  <div class="ns-font select__arrow"></div>   
               </div>
               <div class="ns-font select_1">
                  <form name="select_form" id="select_form" method="POST">
                  <span class="nsb-font user_perform_select">월 선택</span>
                     <select id="select_month" class="ns-font select_box_month">
                        <option value=1>1월</option>
                        <option value=2 selected="selected">2월</option>
                        <option value=3>3월</option>
                        <option value=4>4월</option>
                        <option value=5>5월</option>
                        <option value=6>6월</option>
                        <option value=7>7월</option>
                        <option value=8>8월</option>
                        <option value=9>9월</option>
                        <option value=10>10월</option>
                        <option value=11>11월</option>
                        <option value=12>12월</option>
                     </select>
                     <select id="select_year" class="ns-font select_box_month">
                        <option value=2019>2019년</option>
                        <option value=2020>2020년</option>
                        <option value=2021 selected="selected">2021년</option>
                     </select>
                     <div class="ns-font select__arrow"></div>
                  </form>
               </div>
               <div class="ns-font select_2_btn">
                  <button id="search_btn" class="ns-font btn btn-danger">Search</button>
               </div>
               
            </div>
         </div>
         
      </div>
      <div id="user_perform_div" class="ns-font user_perform_div">
         <!--<div class="nsb-font user_perform_month_title">2월 실적</div>
      
         <div class = "ns-font perform_table" style="align-items: center">
             <table class="perform_table" >
               <thead>
                 <tr>
                   <th class="ns-font text-center" scope="col">날짜</th>
                   <th class="ns-font text-center" scope="col">카드 번호</th>
                   <th class="ns-font text-center" scope="col">카테고리</th>
                   <th class="ns-font text-center" scope="col">실적</th>
                 </tr>
               </thead>
               <tbody>
                 <tr>
                  <td class="ns-font">2</td>
                   <td class="ns-font">1234-1234-1234-1234</td>
                   <td class="ns-font">생활</td>
                   <td class="ns-font">600000</td>
                 </tr>
             
                 <tr>
               <td class="ns-font">2</td>
                   <td class="ns-font">1234-1234-1234-1234</td>
                   <td class="ns-font">교육</td>
                   <td class="ns-font">300000</td>
                 </tr>
             
                 <tr>
               <td class="ns-font">2</td>
                   <td class="ns-font">1234-1234-1234-1234</td>
                   <td class="ns-font">문화</td>
                   <td class="ns-font">150000</td>
                 </tr>
             
                 <tr>
               <td class="ns-font">2</td>
                   <td class="ns-font">1234-1234-1234-1234</td>
                   <td class="ns-font">통신</td>
                   <td class="ns-font">80000</td>
                 </tr>
             
                 <tr>
               <td class="ns-font">2</td>
                   <td class="ns-font">1234-1234-1234-1234</td>
                   <td class="ns-font">교통</td>
                   <td class="ns-font">50000</td>
                 </tr>
                 
               </tbody>
             </table>
         </div>      
		   </div>-->
      </div>

   </div>
</body>
</html>
