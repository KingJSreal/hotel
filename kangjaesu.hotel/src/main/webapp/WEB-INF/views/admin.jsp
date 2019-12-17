<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용호텔:관리자 페이지</title>
<jsp:include page="common/import.jsp"></jsp:include>
<style>
	.today_status{
		margin-left:8%;
		width:84%;
		height:250px;
	}
	.today_status th{
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
<script>
	
</script>
</head>
<body>
	<div>
		<jsp:include page="common/header.jsp" />
		<jsp:include page="common/gnb.jsp" />
		<!-- 예약정보 검색 -->
		<div id="contents">
			<section>
				<c:choose>
					<c:when test="${(sessionScope.user.userGrade == '2' && sessionScope.page == 'admin')}">
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
													<p id="bookingNum">00 건</p>
												</td>
											</tr>
											<tr>
												<th scope="row">문의사항/미처리문의</th>
												<td>
													<p id="inquiryNum">00 건 / 00 건</p>
												</td>
											</tr>
											<tr>
												<th scope="row">회원가입</th>
												<td>
													<p id="joinUserNum">00 명</p>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="container">
								<div class="question">
									<h4 style="text-align:left; width:90%; float:left">| 문의사항</h4>
									<a id="more" href="/hotel/inquiry/inquiryForm">more <span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th scope="row" width="65%">제목</th>
												<th scope="row" width="15%">이름</th>
												<th scope="row" width="20%">날짜</th>
											</tr>
										</thead>
										<tbody id="inquiryList">
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
			</section>
		</div>
		<jsp:include page="common/footer.jsp" />
	</div>
</body>
</html>