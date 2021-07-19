<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 페이지</title>
	
<script> 
	
	function btn(){
		var id = document.getElementById("id").value;
		var name = document.getElementById("name").value;
		var phoneNumber = document.getElementById("phoneNumber").value;
		var passportNumber = document.getElementById("passportNumber").value;
		var passwd = document.getElementById("passwd").value;
		var passwdRe = document.getElementById("passwdRe").value;

		var expid = /^[a-z0-9]{5,20}$/;
		var exppwd = /^[A-Za-z0-9]{8,16}$/;

		if (id == '') {
			alert("아이디를 입력하세요.");
			document.getElementById("id").focus();
			return;
		} else if (expid.test(id) == false) {//아이디 형식
			alert("아이디형식이 올바르지 않습니다. 5~20자의 영문 소문자, 숫자만 사용 가능합니다.");
			document.getElementById("id").focus();
			return;
		}
		
		
		if(name == ""){
			alert("이름을 입력하세요.");
			document.getElementById("name").focus();
			return;
		}
		
		if(phoneNumber == ""){
			alert("휴대폰번호를 입력하세요.");
			document.getElementById("phoneNumber").focus();
			return;
		}
		
		if(passportNumber == ""){
			alert("여권번호를 입력하세요.");
			document.getElementById("passportNumber").focus();
			return;
		}
		
		if (passwd == '') {
			alert("패스워드를 입력해주세요.");
			document.getElementById("passwd").focus();
			return;
		} else if (exppwd.test(passwd) == false) {//비밀번호 형식	
			alert("패스워드 형식이 올바르지 않습니다.");
			document.getElementById("passwd").focus();
			return;
		}
		
		if (passwd != passwdRe) {
			alert("패스워드 값이 일치하지 않습니다.");
			document.getElementById("passwdRe").focus();
			return;
		}
		document.getElementById("passwdRe").parentNode.removeChild(document.getElementById("passwdRe"));
		
		
		document.signupForm.action="http://localhost:8080/myweb/account/signUp"
		document.signupForm.submit();
	}
</script>
</head>
<%@ include file="../include/menu.jsp" %>
        <body class="hold-transition register-page">
            <div class="register-box">
                <div class="register-logo"><b>회원가입</b></a> </div>
                
                <c:if test="${msg == 'REGISTERED-fail'}">
  					<div style="color:red">
  						중복되는 아이디입니다. 다시 입력해주세요.
  					</div>
  				</c:if>
  						
                <div class="card">
                    <div class="card-body register-card-body">
                        <p class="login-box-msg">Register a new membership</p>
                        
                        <form name = "signupForm" method="post">
                        
                            <div class="input-group mb-3"> <input type="text" id="id" name="id" class="form-control"
                                    placeholder="아아디">
                                <div class="input-group-append">
                                    <div class="input-group-text"> <span class="fas fa-exclamation"></span> </div>
                                </div>
                            </div>
                            
                            <div class="input-group mb-3"> <input type="text" id="name" name="name" class="form-control"
                                    placeholder="이름">
                                <div class="input-group-append">
                                    <div class="input-group-text"> <span class="fas fa-user"></span> </div>
                                </div>
                            </div>
                            
                            <div class="input-group mb-3"> <input type="text" id="phoneNumber" name="phoneNumber" class="form-control"
                                    placeholder="휴대폰번호">
                                <div class="input-group-append">
                                    <div class="input-group-text"> <span class="fas fa-envelope"></span> </div>
                                </div>
                            </div>
                            
                            <div class="input-group mb-3"> <input type="text" id="passportNumber" name="passportNumber" class="form-control"
                                    placeholder="여권번호">
                                <div class="input-group-append">
                                    <div class="input-group-text"> <span class="fas fa-envelope"></span> </div>
                                </div>
                            </div>
                            
                            <div class="input-group mb-3"> <input type="password" id="passwd" name="passwd" class="form-control"
                                    placeholder="비밀번호">
                                <div class="input-group-append">
                                    <div class="input-group-text"> <span class="fas fa-lock"></span> </div>
                                </div>
                            </div>
                            
                            <div class="input-group mb-3"> <input type="password" id="passwdRe" name="passwdRe" class="form-control"
                                    placeholder="비밀번호 확인">
                                <div class="input-group-append">
                                    <div class="input-group-text"> <span class="fas fa-lock"></span> </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-8">
                                    <div class="icheck-primary"> <input type="checkbox" id="agreeTerms" name="terms"
                                            value="agree"> <label for="agreeTerms"> I agree to the <a href="#">terms</a>
                                        </label> </div>
                                </div> <!-- /.col -->
                                <div class="col-4"> 
                                	<button type="button" onclick="javascript:btn()"  class="btn btn-primary btn-block">회원가입</button> </div></div>
                        </form> 
                        <a href="http://localhost:8080/myweb/account/login" class="text-center">I already have a membership</a>
  						
                        
                    </div> <!-- /.form-box -->
                </div><!-- /.card -->
            </div> <!-- /.register-box -->
                
        </body>

    </html>
