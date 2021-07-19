<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="org.kpu.myweb.domain.AirportVO"%>
<%@ page import="org.kpu.myweb.domain.ReservationVO"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>마이페이지</title>

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

</head>
<body>
<%
	List<ReservationVO> reservationList =(List<ReservationVO>)request.getAttribute("reservations"); //customerid가 일치하는 목로만 맏아옴
	List<AirportVO> airportList =(List<AirportVO>)request.getAttribute("airports"); //전체 airport 받아옴
	ArrayList<Integer> airportOutput = new ArrayList<Integer>(); //예약 순서에 따른 비행기 인덱스를 순서대로 저장
	Integer reserveNumber=0;
	
	for(int i=0;i<reservationList.size();i++){
		airportOutput.add(reservationList.get(i).getAirportId());
	}
%>
	<%@ include file="../include/menu.jsp" %>
	<div align=center>
		<h2>내정보</h2><br>
		<div class="row" align=center>
    		<div class="col-sm-6" align=center><!-- 전체 컨테이너의 절반 크기로 띄우게 됨 -->
       	 	<!-- 여기에 테이블 삽입 --> 
        	<table class="table table-bordered">
		    	<tr><th scope="col"> 아이디 </th><td><c:out value="${customer.id}"/></td></tr>
				<tr><th scope="col"> 이름 </th><td><c:out value="${customer.name}"/></td></tr>
				<tr><th scope="col"> 비밀번호 </th><td><c:out value="${customer.passwd}"/></td></tr>
				<tr><th scope="col"> 휴대폰번호 </th><td><c:out value="${customer.phoneNumber}"/></td></tr>
				<tr><th scope="col"> 여권번호 </th><td><c:out value="${customer.passportNumber}"/></td></tr>
			</table>
			<button type="button" class="btn btn-outline-dark" onclick="location.href='/myweb/account/modify?id=${customer.customerId}'">정보 수정</button>
    		</div>
		</div>
	</div>
	
	<div align=center>
		
		
		
		
		<div align=center>
		<h2>예약 리스트</h2><br>
		<table class="table">
		<thead>
		  <tr>
		    <th scope="col">순서</th>
		    <th scope="col">비행기번호</th>
		    <th scope="col">출발위치</th>
		    <th scope="col">출발시간</th>
		    <th scope="col">도착위치</th>
		    <th scope="col">도착시간</th>
		    <th scope="col">예약좌석</th>
		    <th scope="col">예약자 이름</th>
		    <th scope="col">예약자 여권번호</th>
		    <th scope="col">예약시간</th>
		  </tr>
		  </thead>
		  <tbody>
		  <c:forEach var="reservation" items="${reservations}" varStatus="status">
		  	
		  	  <!-- 날짜 받아오기 -->
        	  <fmt:parseDate value='${ reservation.reserveTime }' var='regDate' pattern="yyyy-MM-dd-H-m" />
			  <tr>
			  	<!-- airport에서 받아오기 -->
			  	<th scope="row"><c:out value="${status.index}"/></th>
			    <td><%= airportList.get(airportOutput.get(reserveNumber)-1).getAirportId()%></td>
			    <td><%= airportList.get(airportOutput.get(reserveNumber)-1).getDepartureCountry()%></td>
			    <td><%= airportList.get(airportOutput.get(reserveNumber)-1).getDepartureTime()%></td>
			    <td><%= airportList.get(airportOutput.get(reserveNumber)-1).getArriveCountry()%></td>
			    <td><%= airportList.get(airportOutput.get(reserveNumber)-1).getArriveTime()%></td>
			    <td><c:out value="${reservation.reserveSeat}"/></td>
			    <td><c:out value="${reservation.reserveName}"/></td>
			    <td><c:out value="${reservation.reservePassport}"/></td>
			    <td><fmt:formatDate value="${ regDate }" pattern="yyyy년 MM월 dd일 a h:m"/></td>
			    <td>
			    <button type="button" class="btn btn-outline-dark" onclick="location.href='/myweb/account/reserceCancel?id=${reservation.reservId}'">예약취소</button>
			    </td>
			    <% reserveNumber++; %>
			  </tr>
		  </c:forEach>
		  </tbody>
		</table>
		</div>
	</div>
</body>
</html>