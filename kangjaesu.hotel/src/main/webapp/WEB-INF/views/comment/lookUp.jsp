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
			<div class="container center-block">
		<div class="location">
			<p>
				<a><span class="glyphicon glyphicon-home">&nbsp;></span></a> <a>후기 게시판</a>
			</p>
		</div>
		<div class="headTit">
			<h3>&nbsp;후기게시판</h3>
		</div>
		<br> <br>
	</div>


	<div class=" container">
		<div class="container center-block">
			<div class="">
			<c:choose>
				<c:when test="${(sessionScope.user.userGrade == '1' || sessionScope.page == 'admin')}">
				<button class="btn btn-primary" type="button" value="후기 등록"
					onclick="location.href='/hotel/comment/commentAdd' "
					style="text-align: reight; float: right;">후기 등록</button>
					</c:when>
					</c:choose>
			</div>

		</div>
		<br>
		<div class="container center-block">
			<table class="table table-hover">
				<thead>
					<tr class="info">
						<th scope="row">번호</th>
						<th>평점 | 방타입</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성 일자</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="list" items="${commentList}">
					<tr onClick = " location.href='03.html' ">
						<th><a>${list.revNum }</a></th>
						<td>★★★★☆ <br> 그랜드
						</td>
						<td>${list.revContent }</td>
						<td>${list.userNum }님</td>
						<td>${list.revDate }</td>
					</tr>
				</c:forEach>
				
				</tbody>
			</table>
			<div class="container center-block">
				<nav aria-label="Page navigation example">
					<center>
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</center>
				</nav>
			</div>
		</div>
	</div>
			</section>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>