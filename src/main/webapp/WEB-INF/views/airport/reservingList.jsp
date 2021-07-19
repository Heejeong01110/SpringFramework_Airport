<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="org.kpu.myweb.domain.ReservationVO"%>
<%@ page import="org.kpu.myweb.domain.AirportVO"%>



<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>예약 티켓 조회</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/jumbotron/">

    <!-- Bootstrap core CSS -->
<link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">
	<link rel="stylesheet" href="../resources/ticket.css" type="text/css"></link>

<%@ include file="../include/menu.jsp" %>
<br>
<%
	List<ReservationVO> reservationList =(List<ReservationVO>)request.getAttribute("reservations");
	String[] checks =(String[])request.getAttribute("checks");
	ArrayList<String> seats = new ArrayList<String>();
	String seatlocation = "";
	Integer seatNumber=0;
	System.out.println("reservingList checks : "+checks.toString());
	System.out.println("reservingList reservationList : "+reservationList.toString());
	for(int i=0;i<reservationList.size();i++){
		seatlocation = "";
		seatlocation += Integer.toString(reservationList.get(i).getReserveSeat()/6 + 1);
	     
		switch(reservationList.get(i).getReserveSeat()%6){
			case 0:
				seatlocation +="A";
				break;
			case 1:
				seatlocation +="B";
				break;
			case 2:
				seatlocation +="C";
				break;
			case 3:
				seatlocation +="D";
				break;
			case 4:
				seatlocation +="E";
				break;
			case 5:
				seatlocation +="F";
				break;
		}
		seats.add(i,seatlocation);
	}
	System.out.print("seat test : "+seats.toString());
%>

<script type="text/javascript">
    function sendto() {
        // 자바스트립트에서 표현식 사용 가능
        
        var n = 0;
        var resultName="";
        var resultPassport="";

    	var count = document.getElementById("count").value;
        
        for (var i = 0; i < count; i++) {
        	var checkN = document.getElementById("reserveNewname"+i).value;
        	var checkP = document.getElementById("passportNewNumber"+i).value;
        	
        	if (checkN) {
        		resultName+=checkN+","
            	resultPassport+=checkP+","
        	  }
        	
        }

        document.getElementById("namelist").value = resultName;
        document.getElementById("passportlist").value = resultPassport;
        document.form1.action="http://localhost:8080/myweb/airport/reserveSuccess"
    	document.form1.submit();
    }
</script>
</head>

<body>

<form name=form1 method="post">
    <input type="hidden" id="namelist" name="namelist"/>
    <input type="hidden" id="passportlist" name="passportlist"/>
    <input type="hidden" id="seatlist" name="seatlist" value="${seatString}"/>
    <input type="hidden" id="airportId" name="airportId" value="${airportId}"/>
    <input type="hidden" id="count" name="count" value = "<%=checks.length %>"/>
<div class="boarding-parents">
<c:forEach var="airport" items="${airports}" varStatus="status">

<div class="boarding-pass">
  <header>
    <div class="logo">
      <strong>TICKET</strong>
    </div>
    <div class="flight">
      <small>비행기 번호</small>
      <strong>${airport.airportId}</strong>
    </div>
    </header>
  <section class="cities">
    <div class="city">
      <small>출발지</small>
      <strong>${airport.departureCountry}</strong>
    </div>
    <div class="city">
      <small>도착지</small>
      <strong>${airport.arriveCountry}</strong>
    </div>
  </section>
  <section class="infos">
    <div class="places">
      <div class="box">
        <small>좌석번호</small>
        <strong><%=seats.get(seatNumber++) %></strong>
      </div>
      
      <!-- 날짜 받아오기 -->
      <fmt:parseDate value='${ airport.departureTime }' var='regDate' pattern="yyyy-MM-dd-H-m" />
      <fmt:parseDate value='${ airport.arriveTime }' var='arriveDate' pattern="yyyy-MM-dd-H-m" />
      <!-- 시간 계산 -->
      <fmt:parseDate var="Time1_D" value='${ airport.departureTime }' pattern="yyyy-MM-dd-HH-mm" /> 
      <fmt:parseDate var="Time2_D" value='${ airport.arriveTime }' pattern="yyyy-MM-dd-HH-mm" /> 
                
      <fmt:parseNumber var="sum_dd" value="${(Time2_D.time/(1000*60*60) - Time1_D.time/(1000*60*60))/24}" integerOnly="true" />
      <fmt:parseNumber var="sum_hh" value="${(Time2_D.time/(1000*60*60) - Time1_D.time/(1000*60*60))%24}" integerOnly="true" />
	   <fmt:parseNumber var="sum_mm" value="${(Time2_D.time/(1000*60) - Time1_D.time/(1000*60))%60}" integerOnly="true" />
				
	   <fmt:formatNumber var="format_dd" value="${sum_dd}" minIntegerDigits="2" />
	   <fmt:formatNumber var="format_hh" value="${sum_hh}" minIntegerDigits="2" />
	   <fmt:formatNumber var="format_mm" value="${sum_mm}" minIntegerDigits="2" />
      
      <div class="box">
        <small>출발시간</small>
        <strong><fmt:formatDate value="${ regDate }" pattern="a h:m"/></strong>
      </div>
    </div>
    <div class="times">
      <div class="box">
        <small>비행시간</small>
        <strong>${sum_dd}d ${format_hh}h ${format_mm}m</strong>
      </div>
      <div class="box">
        <small>도착시간</small>
        <strong><fmt:formatDate value="${ arriveDate }" pattern="a h:m"/></strong>
      </div>
    </div>
  </section>
  <section class="strap">
    <div class="box">
      <div class="passenger">
        <small>예약자</small>
        <strong><input type="text" id="reserveNewname${status.index}" name="reserveNewname${status.index}" value="${reservations[status.index].reserveName}"></strong>
      </div>
      <div class="passenger">
        <small>여권번호</small>
        <strong><input type="text" id="passportNewNumber${status.index}" name="passportNewNumber${status.index}" value="${customer.passportNumber}"></strong>
      </div>
      <div class="date">
        <small>Date</small>
        <strong><fmt:formatDate value="${ regDate }" pattern="E, dd일, MM월, yyyy"/></strong>
      </div>
    </div>
  </section>
</div>

</c:forEach>

</div>
<button type="button" class="btn btn-secondary btn-lg"onclick='javascript:sendto()'">예약 확정</button>
</form>
<br>
<div class="button">
				<button type="button" class="btn btn-secondary btn-lg"onclick="location.href='/myweb/'">취소</button>
</div>

</body>




</html>