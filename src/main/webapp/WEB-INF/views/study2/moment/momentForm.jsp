<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<c:set var="today" value="<%=java.time.LocalDate.now()%>"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/WEB-INF/views/include/bs5.jsp" />
  <title>momentForm.jsp</title>
  <!-- 날짜를 시간으로 계산해서 돌려주기위한 monent.js 외부라이브러리를 사용하고 있다.(한국어로 번역처리)  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
  <script>
	  'use strict'; 
	  
	  // 화면의 날짜를 moment라이브러리를 사용하여 시간으로 환산하고 있다.
		$(document).ready(function() {
			let wDate = document.getElementsByClassName('wDate');
			for(let i=0; i<wDate.length; i++) {		// 여러개의 날짜를 숫자로 변환하는부분이 있다면 그 클래스 갯수만큼 돌린다.
				var fromNow = moment(wDate[i].value).fromNow();		// 해당클래스의 value값을 넘겨주면 현재날짜와의 차이를 시간으로 계산해서 돌려준다.
		    document.getElementsByClassName('inputDate')[i].innerText = fromNow;	// 재계산된 시간을 inputDate클래스에 뿌려준다.
			}
		});
	  
	  function momentCheck() {
		  $("#content").hide();
		  $("#demo").show();
		  
		  let str = '';
		  str += '<p>0.오늘날짜 : ${today}</p>';
		  let momentToday = moment();
		  str += '<p>1.오늘날짜 : const today = moment() ==>> '+momentToday+'</p>';
		  
		  let date = moment("2025-10-16");
		  str += '<p>2.지정 날짜와 시간 : moment("2025-10-16") ==>> '+date+'</p>';

		  date.format("YYYY/MM/DD");
		  str += '<p>3.날짜 형식 지정 : format() : date.format("YYYY-MM-DD"); ==>> '+date.format("YYYY-MM-DD");+'</p>';
		  
		  str += '<p>4.날짜나 시간 더하기 : add() : '+date.add(1, "years")+'</p>';
		  str += '<p>5.날짜나 시간 빼기 : subtract() : '+date.subtract(1, "years")+'</p>';
		  
		  //let date2 = moment("2025-10-16").format();
		  let date1 = moment().format();
			let date2 = moment("2025-10-16").format();
			//let res = date1.diff(date2);
		  //str += '<p>날짜나 시간 차이 : diff() : '+res+'</p>';
		  
		  str += '<p>7.현재 날짜와의 차이 : fromNow() : '+moment("2025-10-16").fromNow()+'</p>';
		  
		  str += '<p>8.지정 날짜와의 차이 : from() : '+moment("2025-10-16").from(moment("2025-10-1"))+'</p>';
		  
		  str += '<p>9.날짜가 같은지 여부 : isSame() : '+date.isSame("2025-10-16")+'</p>';
		  
		  str += '<p>10.날짜가 이전인지 여부 : isBefore() : '+date.isBefore("2025-10-16")+'</p>';
		  
		  str += '<p>12.날짜가 특정 기간 사이에 있는지 여부 : isBetween() : '+date.isBetween("2025-10-1","2025-10-17")+'</p>';
		  
		  $("#demoView").html(str);
	  }
	  
	  function showCheck() {
		  $("#content").show();
		  $("#demo").hide();
	  }
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
  <h2>Moment.js 학습</h2>
  <div id="content">
		<hr class="border-1 border-dark">
	  <pre>
			◈ Moment.js 사용 방법
			
			- Moment.js로 자주 사용하는 메서드
			
			1. moment() : 현재 날짜와 시간 
				const today = moment();
			 
			2. moment(지정 날짜) : 지정 날짜와 시간 
				const date = moment("2025-06-23");
			 
			3. format() : 날짜 형식 지정
				const date = moment("2025-06-23");
				date.format("YYYY/MM/DD"); // 포맷의 형식은 더 다양함
			 
			4. add() : 날짜나 시간 더하기
				const date = moment("2025-06-23");
				date.add(1, "years"); // 그 외 months, weeks, days, hours, minutes, seconds, milliseconds 가능
			 
			5. subtract() : 날짜나 시간 빼기
				const date = moment("2025-06-23");
				date.subtract(1, "years"); // 그 외 months, weeks, days, hours, minutes, seconds, milliseconds 가능
			 
			6. diff() : 날짜나 시간 차이
				const today = moment().format();
				const date = moment("2025-06-22").format();
				
				today.diff(date);
				today.diff(date, "years"); // 그 외 months, weeks, days, hours, minutes, seconds, milliseconds 가능
			 
			7. fromNow() : 현재 날짜와의 차이
				moment().fromNow();
				moment("2025-06-22").fromNow();
			 
			8. from() : 지정 날짜와의 차이
				moment().from(moment());
				moment("2025-06-22").from("2025-06-20");
			 
			9. isSame() : 날짜가 같은지 여부
				const date = moment("2025-06-22");
				
				date.isSame("2025-06-20");
				date.isSame("2025-06-22", "year"); // 그 외 month, day 가능
			 
			10. isBefore(), isSameOrBefore() : 날짜가 같거나 이전인지 여부
				const date = moment("2025-06-22");
				
				date.isBefore("2025-06-23");
				date.isSameOrBefore("2025-06-22", "year"); // 그 외 month, day 가능
			 
			11. isAfter(), isSameOrAfter() : 날짜가 같거나 이전인지 여부
				const date = moment("2025-06-22");
				
				date.isAfter("2025-06-20");
				date.isAfterOrBefore("2025-06-02", "year"); // 그 외 month, day 가능
			 
			12. isBetween() : 특정 기간 사이에 있는지 여부
				const date = moment("2025-06-22");
				
				date.isBetween("2025-06-20", "2025-06-23");
	  </pre>
	  <hr class="border-1 border-dark">
	  <input type="button" value="결과확인" onclick="momentCheck()" class="btn btn-success"/>
  </div>
  <div id="demo" style="display:none;">
	  <hr class="border-1 border-dark">
	  <div id="demoView"></div>
	  <hr class="border-1 border-dark">
	  <input type="button" value="돌아가기" onclick="showCheck()" class="btn btn-primary"/>
  </div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>