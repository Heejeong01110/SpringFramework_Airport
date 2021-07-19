<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>정보 수정</title>

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
		<header>내정보 수정</header><br>
		<div class="row" align=center>
		<form name=form1 action="http://localhost:8080/myweb/account/modify/" method="post">
		<table class="table table-bordered">
		<input type="hidden"  name="customerId" value="${customer.customerId}">
		    <tr><th scope="col"> 아이디 </th><td><input type="text" name="id" readonly value="${customer.id}"></td></tr>
			<tr><th scope="col"> 이름 </th><td><input type="text" name="name" value="${customer.name}"></td></tr>
			<tr><th scope="col"> 비밀번호 </th><td><input type="text" name="passwd" value="${customer.passwd}"></td></tr>
			<tr><th scope="col"> 휴대폰번호 </th><td><input type="text" name="phoneNumber" value="${customer.phoneNumber}"></td></tr>
			<tr><th scope="col"> 여권번호 </th><td><input type="text" name="passportNumber" value="${customer.passportNumber}"></td></tr>
		</table><br>
			<button type="submit" class="btn btn-outline-dark">최종 수정</button>
			<button type="reset" class="btn btn-outline-dark">다시 작성</button>
			<button type="button" class="btn btn-outline-dark" onclick="location.href='/myweb/account/delete'">회원 탈퇴</button>
    		
		</form>
	</div>
	</div>

	
</body>
</html>