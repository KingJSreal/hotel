<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용호텔:관리자 페이지 - 회원관리</title>
<jsp:include page="../common/import.jsp"></jsp:include>
<style>
userbtns {
	float: right;
	margin-bottom: 10px;
}

div.searchBtns {
	text-align: right;
	margin: 5px 0 30px 0;
}

div.Btns {
	text-align: center;
	margin: 30px 0 30px 0;
}

.btn {
	border-radius: 0;
	font-size: 16;
	font-weight: 800;
}

.searchuser {
	margin: 0 auto;
	width: fit-content;
}
</style>
<script>
$(document).ready(function() {
	$.ajax({
		url:"listUsers",
		method:"POST",
		success:function(users){
			if(users.length > 0 ){
				var userList = [];
				$(users).each(function(idx, user){
					userList.push(
							'<tr>' +
							'<td>' + user.userNum+'</td>' +
							'<td>' + user.userEmail+'</td>' +
							'<td>' + user.userName+'</td>' +
							'<td>' + user.userEngFirstName + " " + user.userEngFirstName + '</td>' +
							'<td>' + user.userBirth + '</td>'	+
							'<td><a href="#">보기</a></td>'	+
							'</tr>'				
					);
						
				});
				$('#userList').append(userList.join(''));
				
			}else{
				$('#userList').empty();
				$('#userList').append(
					'<tr><td colspan="6"><b>사용자가 없습니다.</b></td></tr>'	);
			}
		},
		error:function(a, b, errMsg){
			$('#userList').empty();
			$('#userList').append(
				'<tr><td colspan="6"><b>사용자 목록을 불러오지 못했습니다.</b></td></tr>'	);
		}
	});
});

$(function(){
	$("#userSearchBtn").bind("click", function(e){	
		e.preventDefault();
		
		var userName = null;	
		var userEmail = null;
		var userNum = 0;
		switch($("#searchSelect :selected").val()){
			case "userName":
				userName=$("#userSearch").val();
				break;
			case "userEmail":
				userEmail=$("#userSearch").val();
				break;
			case "userNum":
				userNum=$("#userSearch").val();
				break;
		}
		$.ajax({
			url:"searchListUsers",
			method:"POST",
			data: {
					userName:userName,
					userEmail:userEmail,
					userNum:userNum
				},
			success:function(users){
				$('#userList').empty();
				if(users.length > 0 ){
					var userList = [];
					$(users).each(function(idx, user){
						userList.push(
								'<tr>' +
								'<td>' + user.userNum+'</td>' +
								'<td>' + user.userEmail+'</td>' +
								'<td>' + user.userName+'</td>' +
								'<td>' + user.userEngFirstName + " " + user.userEngFirstName + '</td>' +
								'<td>' + user.userBirth + '</td>'	+
								'<td><a href="#">보기</a></td>'	+
								'</tr>'				
						);
							
					});
					$('#userList').append(userList.join(''));
					
				}else{
					$('#userList').append(
						'<tr><td colspan="6"><b>사용자가 없습니다.</b></td></tr>'	);
				}
				
			},
			error:function(a, b, errMsg){
				$('#userList').empty();
				$('#userList').append(
					'<tr><td colspan="6"><b>검색에 실패했습니다.</b></td></tr>'	);
			}
		});
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
				<div class="container center-block">
					<div class="location">
						<p>
							<a><span class="glyphicon glyphicon-home">&nbsp;></span></a>
							<a>회원관리 ></a>
						 	<a>회원목록</a>	
						</p>
					</div>
					<div class="headTit">
						<h3>&nbsp;회원 목록</h3>
					</div>
					<br><br>
					<div class="panel panel-default">
						<div class="panel-body">
							<form class="form-inline searchuser">
								<div class="form-group">
									<select class="form-control" id="searchSelect">
										<option value="userName">성명(국문)</option>
										<option value="userEmail">이메일</option>
										<option value="userNum">번호</option>
									</select> 
									<input id="userSearch" type="text" class="form-control" required="required">
								</div>
								<button type="submit" class="btn btn-default" id="userSearchBtn">검색</button>
							</form>
						</div>
					</div>
					<div class="userbtns">
						<button id="secedelistbtn" class="btn btn-default" type="button"
							class="btn btn-primary" style="float: right; margin-bottom:10px;">탈퇴목록 보기</button>
					</div>
					<br>
					<table class="table table-hover">
						<thead>
							<tr class="info">
								<th scope="row">번호</th>
								<th>이메일</th>
								<th>성명(국문)</th>
								<th>성명(영문)</th>
								<th>생년원일</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<tbody id="userList">
							
						</tbody>
					</table>
					<div class="container text-center">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Previous"> 
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">1</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">2</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#">3</a>
								</li>
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Next"> 
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</section>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>