<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="EUC-KR">
<title>로그인</title>
<script>
var alert = function(msg, type) {
	swal({
		  title: "",
		  text: msg,
		  icon: type,
		  button: "확인",
		}).then((value) => {
			return;
		});
}
	function swapConfig(x) {
		var radioName = document.getElementsByName(x.name);
	   	for (i = 0; i < radioName.length; i++) {
			document.getElementById(radioName[i].id.concat("member")).style.display = "none";
	   	}
	   	document.getElementById(x.id.concat("member")).style.display = "initial";
	}
	
	$(function(){
		$(".searchIdPw").bind("click", function(e){
			location.href = "/hotel/user/searchIdNPw";
		});

		$(".joinUser").bind("click", function(){
			location.href = "/hotel/user/userTerms";
		});
		
		$("#ymemlogin").bind("click", function(e){
			e.preventDefault();

			if(!$("#userEmail").val()) {
				alert("이메일을 입력하세요.")
				return;
			}
			if(!$("#userPassword").val()) {
				alert("비밀번호를 입력하세요.")
				return;
			}
			
			$.ajax({
				url:"user/login",
				method:"GET",
				data: {
					userEmail:$("#userEmail").val(),
					userPassword:$("#userPassword").val()
				},
				success:function(result){
					if(result == true) location.href = "/hotel/";
					else alert("이메일 및 비밀번호가 정확하지 않습니다. \n다시 입력해 주세요")
				},
				error:function(a, b, errMsg){
					alert("로그인에 실패하였습니다.");
				}
			})
		});
		
		$("#nmemlogin").bind("click", function(e){
			e.preventDefault();
		});
	});
</script>
<style>
	@import url("<c:url value="/css/section.css" />");
	
	/* 섹션 타이틀 */
	div.location {
		float: right;
	    height: 47px;
	    padding: 40px 0 0 0;
	    margin: 0 0 -30px 0;
	    z-index: 9;
	    position: relative;
        text-align: right;
    }
    .location a{
    	text-decoration:none;
    	color:#4C4A4A;
    }
	div.headTit{
		border-bottom: #432c10 solid 2px;
	    height: 47px;
	    margin: 0 auto;
	    position: relative;
    	z-index: 8;
    	font-style:Sans-Serif;
    } 
	/* 섹션 타이틀 끝 */
	fieldset.login{
	   width: 50%;
	   text-align: center;
	   margin: 0 auto;
	}
	
	button.login{
	   left: 60%;
	}
	
	.login-input{
	   margin: 0 auto;
	   width: 300px;
	}
	
	.login-name{
	   left: 50%;
	   width: 147px;
	}
	.login-panel a{
		text-decoration:none;
		color:#A0A0A0;
		font-size:14px;
		font-weight:bold;
	}
	.login-panel a:hover{
		color:black;
	}
	.login-btn{
	   margin: 0 auto;
	   height: 70px; position: absolute; left: 50%;
	   margin-left: 150px;
	}
    /*메인 섹션 끝*/
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/header.jsp" />
		<jsp:include page="../common/gnb.jsp" />
		<!-- 로그인 폼 -->
		<section>
			<div class="container center-block">
				<div class="location">
					<p>
						<a><span class="glyphicon glyphicon-home">&nbsp;></span></a>
						<a>로그인</a>
					</p>
				</div>
				<div class="headTit">
					<h3>&nbsp;로그인</h3>
				</div>
				<br><br>
			   	<fieldset class="login">
					<h3>Seoul HOTEL에 오신것을 환영합니다.</h3>
			      	<p>아이디와 비밀번호를 입력해 주세요.</p>
					회원이 되시면 회원만을 위한 다양한 서비스와 혜택을 받으실 수 있습니다.
			      	<hr>
				    <label>회원 로그인</label>
				    <input type="radio" onchange="swapConfig(this)" name="urlOptions" id="y" checked="checked" />
				    &nbsp;
				    <label>비회원 로그인</label>
				    <input type="radio" onchange="swapConfig(this)" name="urlOptions" id="n" style="margin-right:85px;"/>
			      	<br>
			      
			     	<div class="login-panel" id="ymember">
			        	<button type="submit" class="btn btn-default login-btn" id="ymemlogin">로그인</button>
			         	<input type="email" class="form-control login-input" id="userEmail" placeholder="이메일">
						<input type="password" class="form-control login-input" id="userPassword" placeholder="비밀번호 입력">
			         	<br>
				        <a class="searchIdPw" style="margin-left:195px">아이디 또는 비밀번호 찾기&nbsp;</a>
			         	<a class="joinUser">회원가입</a>
			      	</div>
			
					<div class="login-panel" id="nmember" style="display: none">
			      		<button type="submit" class="btn btn-default login-btn" id="nmemlogin">로그인</button>
				        <input type="text" class="form-control login-input" id="num" placeholder="예약번호">
				        <input type="text" class="form-control login-name" id="fname" style="display: inline-block;" placeholder="First Name(이름)">
				        <input type="text" class="form-control login-name" id="lname" style="display: inline-block;" placeholder="Last Name(성)">
				       	<br><br>
				        <a class="searchIdPw" style="margin-left:195px">아이디 또는 비밀번호 찾기&nbsp;</a>
			         	<a class="joinUser">회원가입</a>
				    </div>
				</fieldset>
			</div>
		</section>
		<br><br><br><br><br>
		<!-- 로그인 폼 끝 -->
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>