<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>비행기 조회</title>

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
	<%@ include file="../include/menu.jsp" %>
	
	<div align=center>
		<h2>항공권 정보</h2><br>
		<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">출발위치</th>
      <th scope="col">도착위치</th>
      <th scope="col">항공기번호</th>
      <th scope="col">출발시간</th>
      <th scope="col">도착시간</th>
      <th scope="col">가격</th>
      <th scope="col">인원</th>
      <th scope="col"></th>
    </tr>
    
    
    
  </thead>
  <tbody>
  <c:forEach var="airport" items="${airports}" >
  <!-- 날짜 받아오기 -->
    <fmt:parseDate value='${ airport.departureTime }' var='regDate' pattern="yyyy-MM-dd-H-m" />
    <fmt:parseDate value='${ airport.arriveTime }' var='arriveDate' pattern="yyyy-MM-dd-H-m" />
    
    <tr>
      <th scope="row"><c:out value="${airport.airportlistId}"/></th>
      <td><c:out value="${airport.departureCountry}"/></td>
      <td><c:out value="${airport.arriveCountry}"/></td>
      <td><c:out value="${airport.airportId}"/></td>
      <td><fmt:formatDate value="${ regDate }" pattern="yyyy년 MM월 dd일 a h:m"/></td>
      <td><fmt:formatDate value="${ arriveDate }" pattern="yyyy년 MM월 dd일 a h:m"/></td>
      <td><c:out value="${airport.price}"/></td>
      <td><c:out value="${airport.passengerNumber}/60"/></td>
      <td>
			<button type="button" class="btn btn-outline-dark" onclick="location.href='reserving?id=${airport.airportlistId}'">예약</button>
	  </td>
    </tr>
    </c:forEach>
  </tbody>
</table>
	</div>
</body>
</html>