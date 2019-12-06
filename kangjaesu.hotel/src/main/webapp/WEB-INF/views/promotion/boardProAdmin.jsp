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
	div .searchBar {
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	th {
		text-align: center;
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
				<div class="container center-block">
					<div class="location">
						<p>
							<a><span class="glyphicon glyphicon-home">&nbsp;></span></a>
							<a>프로모션 관리</a>
						</p>
					</div>
					<div class="headTit">
						<h3>&nbsp;프로모션 관리</h3>
					</div>
					<div class="container center-block text-center"
						style="margin-top: 20px;">
						<div class="panel panel-default">
							<form class="form-inline searchBar">
								<div class="form-group">
									<div class="input-group date">
										<input type="date" class="form-control" placeholder="체크인"
											value="체크인"> <span class="input-group-addon"> <i
											class="glyphicon glyphicon-calendar"></i>
										</span>
									</div>
									<p class="form-control-static">&nbsp;~&nbsp;</p>
									<div class="input-group date">
										<input type="date" class="form-control" placeholder="체크아웃">
										<span class="input-group-addon"> <i
											class="glyphicon glyphicon-calendar"></i>
										</span>
									</div>
									&nbsp;&nbsp;&nbsp;
									<p class="form-control-static">투숙 기간&nbsp;</p>
									<input type="text" class="form-control" id="title_pro"
										placeholder="프로모션 명">
								</div>
								<button type="submit" class="btn btn-default">검색</button>
							</form>
						</div>
					</div>
					<!-- 프로모션 검색 끝 -->
					<div class="container center-block text-center">
						<form class="form-inline">
							<div class="container">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th width="5%">번호</th>
											<th width="40%">프로모션명</th>
											<th width="25%">기간</th>
											<th width="10%">등록일자</th>
											<th width="20%"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${prolists}" var="pro">
											<tr>
												<td>${pro.proNum}</td>
												<td>${pro.proTitle}</td>
												<td>${pro.proStartDate} ~ ${pro.proEndDate}</td>
												<td>${pro.proRegDate}</td>
												<td><input type="button" class="form-control" value="보기"
													onclick="location.href='./02.html'"> <input
													type="button" class="form-control" value="수정"
													onclick="location.href='./05.html'"> <input
													type="button" class="form-control" value="삭제"
													onclick="alert('정말 삭제하시겠습니까?', 'warning');"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</form>
					</div>
					<!-- 프로모션 게시판 끝 -->
					<!-- paging -->
					<div class="paging" style="text-align: center">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">6</a></li>
							<li class="page-item"><a class="page-link" href="#">7</a></li>
							<li class="page-item"><a class="page-link" href="#">8</a></li>
							<li class="page-item"><a class="page-link" href="#">9</a></li>
							<li class="page-item"><a class="page-link" href="#">10</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
						</ul>
					</div>
				<!-- paging 끝 -->
				</div>
			<!-- 프로모션 등록 끝 -->
			</section>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>
