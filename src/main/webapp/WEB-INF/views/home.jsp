<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>main Page</title>

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


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
</head>

<body>
<%@ include file="include/menu.jsp" %>
	<main>
  <div class="container py-4">
    <div class="row align-items-md-stretch">
    
      <div class="col-md-6">
        <div class="h-100 p-5 text-white bg-dark rounded-3">
          <h2>비행기 조회</h2>
          <p>비행기 출발국가, 도착국가 및 시간 등에 대한 정보를 확인한 후 최대 5명까지 한번에 예약할 수 있습니다.</p>
          <button class="btn btn-outline-light" type="button" onclick="location.href='/myweb/airport/list'">항공예약</button>
        </div>
      </div>
      
      <div class="col-md-6">
        <div class="h-100 p-5 bg-light border rounded-3">
          <h2>마이페이지</h2>
          <p>사용자의 정보 조회및 수정, 회원탈퇴, 비행기좌석 예약 리스트 조회 및 취소를 할 수 있습니다.</p>
          <button class="btn btn-outline-secondary" type="button" onclick="location.href='/myweb/account/myPage'">이동</button>
        </div>
      </div>
    </div>
  </div>
</main>


	
	<c:if test="${msg == 'RESERVATIONSUCCESS'}">
		<%
			out.println("<script>alert('예약에 성공하였습니다.')</script>");
		%>
	</c:if>
	<c:if test="${msg == 'RESERVATIONFAIL'}">
		<%
			out.println("<script>alert('이미 예약된 좌석이 포함되어있습니다. 다시 예약해주세요.')</script>");
		%>
	</c:if>
	

	
</body>
</html>
