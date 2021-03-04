<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
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


    <div class="nsb-font user_perform_month_title">${year}년 ${month}월 실적</div>
      
      <div class = "ns-font perform_table" style="align-items: center">
          <table class="ns-font table perform_table" style="table-layout: fixed;" >
            <thead>
              <tr>
                <th class="ns-font text-center" scope="col" width="30%">월</th>
                <th class="ns-font text-center" scope="col" width="50%">카드 번호</th>
                <th class="ns-font text-center" scope="col" width="25%">카테고리</th>
                <th class="ns-font text-center" scope="col" width="25%">실적</th>
              </tr>
            </thead>
            <tbody>
           <c:forEach var="perform" items="${performList}">
              <tr>
                 <td class="ns-font">${perform.paytime}</td>
                 <td class="ns-font">${perform.card_num}</td>
                 <td class="ns-font">${perform.category_name}</td>
                 <td class="ns-font">${perform.category_perform}</td>
              </tr>
           </c:forEach>
              
            </tbody>
          </table>
      </div>
