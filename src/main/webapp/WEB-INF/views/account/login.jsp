<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 페이지</title>
</head>

<script>
	function btn(){
		var login_id = document.getElementById("login_id").value;
		var login_password = document.getElementById("login_password").value;
		if(login_id == ""){
			alert("아이디를 입력하세요.");
			document.getElementById("login_id").focus();
			return;
		}
		if(login_password == ""){
			alert("비밀번호를 입력하세요.");
			document.getElementById("login_password").focus();
			return;
		}
		document.form1.action="http://localhost:8080/myweb/account/login"
		document.form1.submit();
	}
</script>
	
<body>
<%@ include file="../include/menu.jsp" %>
	<div align=center>
		<h2>로그인</h2><br>
		<div class="login">
  				<form name = "form1" method="post">
  					<input id="login_id" class="member_input_box"type="text"name="login_id" placeholder="아이디">
  					<input id="login_password" class="member_input_box"type="password"name="login_password"placeholder="비밀번호">
  					
  					<br>
  					<button onclick="javascript:btn()" type="button" class="member_button_login" ><strong>로그인</strong></button>
  					
  					<c:if test="${msg == 'failure'}">
  						<div style="color:red">
  							아이디 또는 비밀번호가 일치하지 않습니다.
  						</div>
  					</c:if>
  					<c:if test="${msg == 'logout'}">
  						<div style="color:red">
  							로그아웃 되었습니다.
  						</div>
  					</c:if>
  					<c:if test="${msg == 'REGISTERED'}">
  						<div style="color:red">
  								회원가입이 완료되었습니다.
  						</div>
  					</c:if>
  					
  				</form>
  				<c:url value="/account/signUp" var="url"/><a href="${url}">회원가입</a><br><br>
  		</div>
	</div>
</body>
</html>