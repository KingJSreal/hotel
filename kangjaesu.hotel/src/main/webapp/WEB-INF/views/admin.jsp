<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	@import url("<c:url value="/css/section.css" />");
	.today_status{
		width:40%;
		float:left;
		height:250px;
		margin-left:8%;
	}
	.today_status th{
		text-align: center;
	}
	.nonprocess_status{
		width:40%;
		height:250px;
		margin-left:52%;
	}
	.nonprocess_status th{
		text-align: center;
	}
	.question{
		margin-left:8%;
		width:84%;
		height:250px
	}
	.question th{
		text-align:center;
	}
	#more{
		float: right;
		font-size: 15px;
		text-decoration:none;
		margin-top:10px;
	}
	#more:hover{
		color:#A0A0A0;
	}
	/*메인 섹션 끝*/
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="common/header.jsp" />
		<jsp:include page="common/gnb.jsp" />
		<!-- 예약정보 검색 -->
		<section>
			<c:choose>
				<c:when test="${sessionScope.user.userGrade == '3' || sessionScope.user.userGrade == '4'}">
					<div class="container center-block text-center">
						<div class="container">
							<div class="today_status">
								<h4 style="text-align:left">Today 현황</h4>
								<table class="table table-bordered">
									<colgroup>
										<col width="50%" class="col1">
										<col width="50%" class="col2">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">예약 수</th>
											<td>
												<p>00 건</p>
											</td>
										</tr>
										<tr>
											<th scope="row">문의사항 수</th>
											<td>
												<p>00 건</p>
											</td>
										</tr>
										<tr>
											<th scope="row">회원가입 수</th>
											<td>
												<p>00 명</p>
											</td>
										</tr>
										<tr>
											<th scope="row">회원탈퇴 수</th>
											<td>
												<p>00 명</p>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="nonprocess_status">
							<h4 style="text-align:left">미처리 현황</h4>
								<table class="table table-bordered">
									<colgroup>
										<col width="50%" class="col1">
										<col width="50%" class="col2">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">예약 수</th>
											<td>
												<p>00 건</p>
											</td>
										</tr>
										<tr>
											<th scope="row">문의사항 수</th>
											<td>
												<p>00 건</p>
											</td>
										</tr>
										<tr>
											<th scope="row">회원가입 수</th>
											<td>
												<p>00 명</p>
											</td>
										</tr>
										<tr>
											<th scope="row">회원탈퇴 수</th>
											<td>
												<p>00 명</p>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="container">
							<div class="question">
								<h4 style="text-align:left; width:90%; float:left">| 문의사항</h4>
								<a id="more" href="#">more <span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
								<table class="table table-bordered">
									<tbody>
										<tr>
											<th scope="row" width="65%">제목</th>
											<th scope="row" width="15%">유저명</th>
											<th scope="row" width="20%">날짜</th>
										</tr>
										<tr>
											<td>10월 10일 기존 체크인 시간보다 1시간 더 일찍 체크인 하고싶습니다.</td>
											<td>user01</td>
											<td>2019-10-10 09:00</td>							
										</tr>
										<tr>
											<td>10월 10일 기존 체크인 시간보다 1시간 더 일찍 체크인 하고싶습니다.</td>
											<td>user01</td>
											<td>2019-10-10 09:00</td>							
										</tr>
										<tr>
											<td>10월 10일 기존 체크인 시간보다 1시간 더 일찍 체크인 하고싶습니다.</td>
											<td>user01</td>
											<td>2019-10-10 09:00</td>							
										</tr>
										<tr>
											<td>10월 10일 기존 체크인 시간보다 1시간 더 일찍 체크인 하고싶습니다.</td>
											<td>user01</td>
											<td>2019-10-10 09:00</td>							
										</tr>
										<tr>
											<td>10월 10일 기존 체크인 시간보다 1시간 더 일찍 체크인 하고싶습니다.</td>
											<td>user01</td>
											<td>2019-10-10 09:00</td>							
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<jsp:include page="user/adminLogin.jsp" />
				</c:otherwise>
			</c:choose>
		<!-- 끝 -->
		</section>
		<hr>
		<br>
		<br>
	</div>
	<jsp:include page="common/footer.jsp" />
</body>
</html>