<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
	
/*네비*/
.navi {
	text-align: center;
	width:50%;
	margin: 0px auto;
}

.nav li a:hover {
	background-color: white;
}

.navbar .navbar-nav {
	float: none;
}

.dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0;
}

.mainMenu {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	text-decoration: none;
}

.mainMenu>li {
	float: left;
	width: 20%;
}

.mainMenu>li>a {
	display: block;
	color: #A0A0A0;
	text-align: center;
	padding: 0px 15px;
	text-decoration: none;
	font-size: 15px;
	font-family: Sans-Serif;
	font-weight: bold;
}

.mainMenu>li>a:hover {
	color: black;
}
/*네비 끝*/

/*어드민 네비*/
}
/*어드민 네비 끝*/
</style>
<body>
	<nav>
		<div class ="navi">
			<c:choose>
				<c:when test="${(sessionScope.user.userGrade == '3' || (sessionScope.user.userGrade == '4') && param.page == 'admin')}">
					<ul class="mainMenu">
						<li><a href="/hotel/user/userList">회원관리</a></li>
						<li><a href="#">객실관리</a></li>
				 		<li><a href="#">예약관리</a></li>
			 			<li><a href="/hotel/inquiry/inquiryManage">문의관리</a></li>
						<li><a href="#">프로모션 관리</a></li>	
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="mainMenu">
						<li><a href="#">예약</a></li>
						<li><a href="#">호텔소개</a></li>
				 		<li><a href="/hotel/inquiry/inquiryForm">고객문의</a></li>
						<li><a href="#">프로모션</a></li>
						<li><a href="#">후기게시판</a></li>	
					</ul>
				</c:otherwise>	
	  		</c:choose>
		</div>
		<hr style="background-color:#B4B4B4; height:1px solid;">
	</nav>	
</body>
</html>
