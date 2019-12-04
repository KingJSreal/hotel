<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="../res/css/common.css">

<style>
/* 섹션 타이틀 */
.location {
	float: right;
	height: 47px;
	padding: 40px 0 0 0;
}

.location a {
	text-decoration: none;
	color: #4C4A4A;
}

.headTit {
	border-bottom: #432c10 solid 2px;
	height: 47px;
	font-style: Sans-Serif;
}
/* 섹션 타이틀 끝 */

/* 본문 컨테이너 */
.form-inline {
	width: 70%;
	margin: 0 auto;
}

.table-responsive {
	width: 90%;
	margin: 0 auto;
}

.inputTitle {
	width: 100%;
}

/* 버튼 */
.buttongroup {
	margin-top: 30px;
	margin-bottom: 100px;
}
/* 버튼 끝 */
</style>

<script>
var alert = function(msg, type) {
	swal({
		text: msg,
		icon: type,
		buttons: true,
		buttons: "확인",
	});
}

$(document).ready(function() {
	$("#inqWriter").val("${user.userName}");
	$("#inqEmail").val("${user.userEmail}");
	$("#inqPhone").val("${user.userPhone}");

	//연락처
	$("#inqPhone").keyup(function() {
		$(this).val($(this).val().replace(/[^0-9]/gi, '')); //숫자만 가능
	});
	
});

function validateEmail() {
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	varemail = $("#inqEmail").val();
	
	if (re.test(varemail) == false)
		return true;
	else
		return false;
}

function reset() {
	swal({
		text: "다시 작성하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  buttons: ["취소", "확인"],
		})
		.then((willDelete) => {
			if (willDelete) {
				$("#inqTitle").val("");
				$("#inqContent").val("");
				$("#inqWriter").val("${user.userName}");
				$("#inqEmail").val("${user.userEmail}");
				$("#inqPhone").val("${user.userPhone}");
		  }else{
			  return;
		  }
		});
}

function isValid() {
	if($("#inqTitle").val() == "" ||
			$("#inqContent").val() == "" ||
			$("#inqWriter").val() == "" ||
			$("#inqEmail").val() == "" ||
			$("#inqPhone").val() == "")
		alert("양식을 모두 작성해주세요", "warning" );
	else if(validateEmail())
		alert("이메일을 정확히 작성해주세요", "warning" );
	else
		confirm();
}

function confirm(){
	swal({
		text: "작성한 내용으로 문의 하시겠습니까?",
		  icon: "warning",
		  buttons: true,
		  buttons: ["취소", "확인"],
		})
		.then((willDelete) => {
		  if (willDelete) {
			  save();
		  }else{
			  return;
		  }
		});
}

function save(){	
	var status = 0;
	var userNum = "${user.userNum}";

	 $.ajax({
		url:"writeInquiry",
		method:"GET",
		data: {					
			inqTitle:$("#inqTitle").val(),
			inqContent:$("#inqContent").val(),
			inqWriter:$("#inqWriter").val(),
			inqEmail:$("#inqEmail").val(),
			inqPhone:$("#inqPhone").val(),
			status: status,
			userNum: userNum
		},
		success:function(){
			swal("문의가 등록되었습니다.", {
		    	text: "문의에 대한 답변은 평균 2일 소요됩니다.",
		      icon: "success",
		      buttons: ["확인"],
		    }).then((willDelete) => {
		    	    
		    	location.href = "/hotel";
		  });
		},
		error:function(a, b, errMsg){
			alert("작성  오류" + errMsg);
		}
	 }); 
}

</script>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/header.jsp" />
		<jsp:include page="../common/gnb.jsp" />
		<!-- 섹션 타이틀 -->
		<div class="container center-block">
			<div class="location">
				<p>
					<a><span class="glyphicon glyphicon-home">&nbsp;></span></a> <a>고객문의</a>
				</p>
			</div>
			<div class="headTit">
				<h3>&nbsp;문의하기</h3>
			</div>
			<br> <br>
		</div>
		<!-- 섹션 타이틀 끝-->
		<form class="form-inline" id="inquiryForm" method="get">
			<div class="panel panel-default">
				<!-- 테이블 -->
				<div class="table-responsive">
					<table class="table">
						<tbody>
							<tr>
								<td>제목</td>
								<td><input type="text" id="inqTitle"
									class="form-control inputTitle" maxlength="20"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea class="form-control" id="inqContent"
										rows="12" cols="60"></textarea></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" id="inqWriter" class="form-control"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="email" id="inqEmail" class="form-control"></td>
							</tr>
							<tr>
								<td>연락처</td>
								<td><input type="text" id="inqPhone" class="form-control" placeholder="하이픈(-)생략"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 테이블 끝-->
			<div class="buttongroup pull-right">
				<a class="btn btn-default" onclick="reset();" role="button">다시쓰기</a>
				<button class="btn btn-default" type="button" onclick="isValid();">등록하기</button>
			</div>
		</form>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>