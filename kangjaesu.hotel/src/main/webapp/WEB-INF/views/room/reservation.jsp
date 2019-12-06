<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용호텔</title>
<jsp:include page="../common/import.jsp"></jsp:include>
<!-- 
	- res/js 추가 시
	<script src="<c:url value="/js/common.js"/>"></script>  
-->
<style>
	/*
	- res/css 추가 시
	@import url("<c:url value="/css/section.css" />");
	*/
/*메인 섹션*/
section {
	margin: 0px 0 50px 0;
}

div .searchBar {
	margin-top: 20px;
	margin-bottom: 20px;
}

div.promotion-title {
	padding-bottom: 5px;
}

h4.promotion-title {
	margin-bottom: 0px;
}

#more {
	float: right;
	font-size: 15px;
	text-decoration: none;
}

#more:hover {
	color: #A0A0A0;
}
/*메인 섹션 끝*/

div .searchBar {
	margin-top: 20px;
	margin-bottom: 20px;
}

div.promotion-title {
	padding-bottom: 5px;
}

h4.promotion-title {
	margin-bottom: 0px;
}

#more {
	float: right;
	font-size: 18px;
}

table table-bordered {
	text-align: cneter;
	padding-top: 200px;
}

.panel-defaul button {
	margin: 10px;
}

.custom-checkbox {
	float: left;
}

input[type="checkbox"] {
	display: none;
}

input[type="checkbox"]+label {
	display: inline-block;
	cursor: pointer;
	position: relative;
	padding-left: 20px;
	padding-right: 10px;
	font-size: 12px
}

input[type="checkbox"]+label:BEFORE {
	content: "";
	display: inline-block;
	width: 20px;
	height: 20px;
	margin-right: 5px;
	left: 0;
	bottom: 1px;
	background-color: #ccc;
}

input[type="checkbox"]:checked+label:BEFORE {
	content: "\2713";
	text-shadow: 1px 1px 1px raba(0, 0, 0 .2);
	font-size: 18px;
	font-weight: 800;
	color: #fff;
	background: #2187c1;
	text-align: center;
	line-height: 18px;
}

.optionForm, .priceForm {
	margin-right: 100px;
}
</style>
<script>
</script>
</head>
<body>
	<div>
		<jsp:include page="../common/header.jsp" />
		<jsp:include page="../common/gnb.jsp" />
		<!-- 예약정보 검색 -->
		<div id="contents">
			<section>
			<!-- 예약정보 검색 -->
	<section>
		<div class="container center-block text-center">
			<div class="panel panel-default">
				<form class="form-inline searchBar">
					<div class="form-group">
						<p class="form-control-static">예약정보를 선택하세요</p>
						<p class="form-control-static">&nbsp; | &nbsp; 체크인</p>
						<div class="input-group date">
							<input type="date" class="form-control" placeholder="체크인"
								value="체크인"> <span class="input-group-addon"> <i
								class="glyphicon glyphicon-calendar"></i>
							</span>
						</div>
						<p class="form-control-static">&nbsp; | &nbsp; 체크아웃</p>
						<div class="input-group date">
							<input type="date" class="form-control" placeholder="체크아웃">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-calendar"></i>
							</span>
						</div>
						<p class="form-control-static">&nbsp; | &nbsp; 성인</p>
						<select class="form-control">
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select>
						<p class="form-control-static">&nbsp; | &nbsp; 유아</p>
						<select class="form-control">
							<option>0</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select>
					</div>
					<button type="submit" class="btn btn-default">검색</button>

					<hr>
					<div class="form-group pull-right optionForm">
						<div class="custom-control custom-checkbox">
							<p class="form-control-static">옵션을 선택하세요</p>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" id="option1"
								name="option"> <label class="custom-control-label"
								for="option1">조식</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" id="option2"
								name="option"> <label class="custom-control-label"
								for="option2">스파</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" id="option3"
								name="option"> <label class="custom-control-label"
								for="option3">야외수영장</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" id="option4"
								name="option"> <label class="custom-control-label"
								for="option4">엑스트라베드</label>
						</div>
						<button class="btn btn-default">선택해제</button>
					</div>
					<br>
					<br>
					<div class="form-group pull-right priceForm">
						<p class="form-control-static">&nbsp;금액범위&nbsp;</p>

						<input type="text" class="form-control"><label>&nbsp;원
							~&nbsp;</label> <input class="form-control" type="text"><label>&nbsp;원
						</label>
					</div>
					<br> <br>
				</form>
			</div>
		</div>
	</section>	

	<div class="container center-block">
		<table class="table table-hover" style="vertical-align: middle;">
		<c:forEach var="list" items="${roomList}">
			<tr   id="confirmModalButton">
				<td style="vertical-align: middle;"><img width="300"
					height="200"></td>

				<td style="vertical-align: middle;">
					<p>- ${list.roomType }</p>
					<p>- 조식</p>
					<p>- 야외수영장</p>
				</td>
				<td style="vertical-align: middle;">${list.roomPrice }원<br>기준 ${list.guests } 명
				</td>

				<td style="vertical-align: middle;"><button
						class="btn btn-default" type="button"
						style="width: 150px; height: 150px;" onclick="location.href='../booking/01.html'">예약</button></td>
			</tr>
		</c:forEach>
				
	
		</table>
		
	</div>

			<div class="modal fade" id="confirmModal">
			<div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
				<div class="modal-content">
					<!-- remote call이 되는영역 -->
				</div>
			</div>
		</div>
	
		<div class="modal fade" id="confirmModa2">
			<div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
				<div class="modal-content">
					<!-- remote call이 되는영역 -->
				</div>
			</div>
		</div>
	

		
	
	<br><br>
			</section>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>