<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<meta charset="EUC-KR">
<title>로그인</title>
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
	div.complete{
	   width: 50%;
	   text-align: center;
	   margin: 0 auto;
	}
	div.Btns{
		text-align: center;
		margin: 30px 0 30px 0;
	}
	.btn{
		border-radius: 0;
		font-size: 16;
		font-weight: 800;
	}
    /*메인 섹션 끝*/
</style>
<script>
$(function(){
	$("#gomain").bind("click",function(){
		location.href = "/hotel/";
	});
});
</script>
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
						<a>홈 > </a>
						<a>회원가입</a>
					</p>
				</div>
				<div class="headTit">
					<h3>&nbsp;가입완료</h3>
				</div>
				<br><br>
			   	<div class="complete">
					<h3>쌍용 호텔의 회원이 되신 것을 환영합니다.</h3>
					<br>
			      	<p>회원 혜택과 약관은 홈페이지 확인 가능합니다.</p>
					메인 페이지에서 로그인 해주세요.
					<div class="Btns">
						<button class="btn btn-default" type="button" id="gomain" name="gomain" style="padding:10px 70px">메인으로</button>
					</div>
		      	</div>
			</div>
		</section>
		<br><br><br><br><br>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>