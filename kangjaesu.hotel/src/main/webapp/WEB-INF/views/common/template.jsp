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
						<a>홈 > </a>
						<a>호텔소개 > </a>
						<a>OverView</a>
					</p>
				</div>
				<div class="headTit">
					<h3>&nbsp;서울호텔 소개</h3>
				</div>
				<div class="container">
					<div class="aside-section">
						<div><a href="01.html" class="aside_logo">Seoul Hotel</a></div>
						<hr style="background-color:white; height:1px">
						<div><a href="01.html" class="aside_a">개요</a></div><br>
						<div><a href="02.html" class="aside_a">오시는 길</a></div><br>
					</div>
					<div class="main-section">
						<div>
							<div class="container">
								
							</div>
						</div>
					</div>
				</div>
			</div>
			</section>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>