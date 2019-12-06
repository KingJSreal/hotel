<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용호텔</title>
<jsp:include page="../common/import.jsp"></jsp:include>
<style>
.detail_pro{
		margin-top:30px;
		width: 100%;
		height: 400px;
	}
	.detail_pro th{
		text-align:center;
	}
	
	.img_section{
		width: 34%;
		height:400px;
		float:left;
		margin-left:0.5%;
	}
	.content_section{
		margin-left:36%;
		width:63.5%;
		height:400px;
	}
	.content_section th {
		color:white;
		background-color:#3c3c3c;
		width:23%;
		text-align: center;
	}
	#btn_up, #btn_down{
		width:47%;
		float:left;
		margin-left:2%;
		margin-top: -3%;
		
	}
</style>
<script>
function add_promotion(){
	var div = document.createElement('div');
	div.innerHTML = document.getElementById('pre_set').innerHTML;
	document.getElementById('field').appendChild(div);
}

function del_promotion(obj){
	document.getElementById('field').removeChild(obj.parentNode);
}

//이미지 업로드
var imgView = function(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.addEventListener("load", function() {
			$('.promotionImg').attr('src', reader.result);
		}, false);
		reader.readAsDataURL(input.files[0]);
	}
}

//이미지 등록취소
$("#imgCancel").bind("click", function(){
	$("#imgUpLoad").val('');
});

$(function(){
	$("#addProForm").bind("submit", function(e){
		e.preventDefault();
		$.ajax({
			url:"addPromotion",
			method:"GET",
			data: {
				proTitle:$("#proTitle").val(),
				proContent:$("#proContent").val(),
				proStartDate:$("#proStartDate").val(),
				proFinishDate:$("#proEndDate").val(),
				proDetail:$("#proDetail").val(),
				prodTitle:$("#prodTitle").val(),
				location:$("#location").val(),
				prodPic:$("#prodPic").val(),
				serviceHour:$("#serviceHour").val(),
				notice:$("#notice").val(),
				prodContent:$("#prodContent").val()
			},
			success:function(){
				alert("등록에 성공하셨습니다.");
       			location.href = "/hotel";
			},
			error:function(a, b, errMsg){
				alert("등록에 실패하셨습니다.");
				location.href = "#";
			}
			
		})
	});
})
</script>
</head>
<body>
	<div>
		<jsp:include page="../common/header.jsp" />
		<jsp:include page="../common/gnb.jsp" />
		<!-- 예약정보 검색 -->
		<div id="contents">
			<section>
				<form class="form-inline" id="addProForm" method="post">
					<div class="container center-block">
						<div class="location">
							<p>
								<a><span class="glyphicon glyphicon-home">&nbsp;></span></a>
								<a>프로모션 등록</a>
							</p>
						</div>
						<div class="headTit">
							<h3>&nbsp;프로모션 등록</h3>
						</div>
						<div class="container center-block text-center">
							<div class="write_pro">
								<div class="inline-group" style="width:60%; margin-top:20px; margin-left:20%;">
								<table class="table table-bordered">
									<tr>
										<th style="vertical-align:middle"><p>프로모션 명</p></th>
										<td><input type="text" class="form-control" style="width:100%; float:left" id="proTitle"></td>
									</tr>
									<tr>
										<th style="vertical-align:middle"><p>프로모션 기간</p></th>
										<td>
											<div class="input-group date">
									         	<input type="date" class="form-control" placeholder="체크인" id="proStartDate">
												<span class="input-group-addon">
												<i class="glyphicon glyphicon-calendar"></i></span>
											</div>
											<p class="form-control-static">&nbsp; ~ &nbsp;</p>
											<div class="input-group date">
												<input type="date" class="form-control" placeholder="체크아웃" id="proEndDate">
												<span class="input-group-addon">
												<i class="glyphicon glyphicon-calendar" style="float:left"></i></span>
											</div>
										</td>
									</tr>
									<tr>
										<th style="vertical-align:middle"><p>프로모션 내용</p></th>
										<td><input type="text" class="form-control" style="width:100%; float:left" id="proContent"></td>
									</tr>
								</table>
								</div>
							</div>
							
							<div class="adddel_pro">
								<input type="button" onclick="add_promotion()" class="form-control" 
											value="프로모션 구성 추가" style="width:60%;"><br><br>
							</div>
							
							<div class="detail_pro" id="pre_set" style="display:none">
								<div class="img_section">
									<img class="promotionImg" style="height:230px; width:100%">
									<label class="btn btn-default btn-lg btn-block" for="imgUpLoad"
										style="width:50%; margin-top:2px;font-size:13px; float:left">이미지 업로드</label>
									<button class="btn btn-default btn-lg btn-block" id="imgCancel"
										value="등록 취소" style="width:50%; font-size:13px; margin-top:2px;">등록취소</button>
									<input type="file" id="imgUpLoad" value="imgUpLoad"
										onchange="imgView(this)" style="display:none;">
								</div>
								<div class="content_section">
									<table class="table table-bordered">
										<tr>
											<th style="vertical-align:middle">프로모션명</th>
											<td><input type="text" class="form-control" style="width:100%" id="prodTitle"></td>
										</tr>
										<tr>
											<th style="vertical-align:middle">위치</th>
											<td><input type="text" class="form-control" style="width:100%" id="location"></td>
										</tr>
										<tr>
											<th style="vertical-align:middle">이용시간</th>
											<td><input type="text" class="form-control" style="width:100%" id="serviceHour"></td>
										</tr>
										<tr>
											<th style="vertical-align:middle">유의사항</th>
											<td><input type="text" class="form-control" style="width:100%" id="notice"></td>
										</tr>
										<tr>
											<th style="vertical-align:middle">설명</th>
											<td><textarea class="form-control" style="width:100%; height:178px" id="prod_content"></textarea></td>
										</tr>
									</table>
								</div>
								<input type="button" onclick="del_promotion(this)" class="form-control" 
											value="프로모션 구성 취소" style="width:60%; margin-top:20px;">
								<hr style="border:1px solid black">
							</div>
							<div id="field"></div>
							
							<div class="detail_pro">
								<table class="table table-bordered">
									<colgroup>
										<col width="25%" class="col1">
										<col width="75%" class="col2">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" style="text-align:center; vertical-align:middle"><p>상세내용</p></th>
											<td>
												<textarea class="form-control" style="width:100%; height:400px" id="proDetail"></textarea>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div style="margin-top:25px">
								<input type="submit" value="작성하기" class="form-control" style="width:100px; float:right;">
								<input type="button" value="다시쓰기" class="form-control" style="width:100px; float:right; margin-right:5px">
							</div>
						</div>
					</div>
				<!-- 프로모션 등록 끝 -->
				</form>
			</section>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>