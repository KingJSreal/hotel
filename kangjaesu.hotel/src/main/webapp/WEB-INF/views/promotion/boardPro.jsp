<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용호텔</title>
<jsp:include page="../common/import.jsp"></jsp:include>

<script>
	function detailView(proNum){
		var url = "${pageContext.request.contextPath}/promotion/detailPro";
		url = url + "?proNum=" + proNum;
		location.href=url;
	}
</script>
<!-- 
	- res/js 추가 시
	<script src="<c:url value="/js/common.js"/>"></script>  
-->
<style>
/*메인 섹션*/
	section {
		margin: 0px 0 50px 0;
	}
	
	div .searchBar {
		margin-top: 20px;
		margin-bottom: 20px;
	}
	/* 섹션 타이틀 */
	div.location {
		float: right;
		height: 47px;
		padding: 40px 0 0 0;
		margin: 0 0 -30px 0;
		z-index: 9;
		position: relative;
		text-align: right;
	}
	
	.location a {
		text-decoration: none;
		color: #4C4A4A;
	}
	
	div.headTit {
		border-bottom: #432c10 solid 2px;
		height: 47px;
		margin: 0 auto;
		position: relative;
		z-index: 8;
		font-style: Sans-Serif;
	}
	/* 섹션 타이틀 끝 */
	.board_pro {
		height: 300px;
		width: 100%;
	}
	
	.image_pro {
		height: 300px;
		width: 500px;
		margin-left: 10px;
		float: left;
	}
	
	.content_pro {
		margin-left: 560px;
	}
	
	.thumbnail {
		margin-left: 10px;
		height: 300px;
		width: 500px;
	}
	
	.more {
		float: right;
		font-size: 17px;
		text-decoration: none;
		margin-top: 15px;
		margin-right: 20px;
	}
	
	.more:hover {
		color: #A0A0A0;
	}
	/*메인 섹션 끝*/
</style>
<script>
</script>
</head>
<body>
	<div>
		<jsp:include page="../common/header.jsp" />
		<jsp:include page="../common/gnb.jsp" />
		<!-- 프로모션 게시판 : 회원 -->
		<div id="contents">
			<section>
				<div class="container center-block">
					<div class="location">
						<p>
							<a>홈 > </a>
							<a>프로모션</a>
						</p>
					</div>
					<div class="headTit">
						<h3>&nbsp;프로모션</h3>
					</div>
				</div>
				<!-- 프로모션 검색 -->
				<div class="container center-block text-center" style="margin-top:20px;">
					<div class="panel panel-default">
						<form class="form-inline searchBar">
							<div class="form-group">
				            	<p class="form-control-static">투숙 기간&nbsp;</p>
				            <div class="input-group date">
				               	<input type="date" class="form-control" placeholder="체크인" id="proStartDate">
			                	<span class="input-group-addon">
				                	<i class="glyphicon glyphicon-calendar"></i>
			                	</span>
				            </div>
				            <p class="form-control-static">&nbsp;~&nbsp;</p>
				            <div class="input-group date">
				            	<input type="date" class="form-control" placeholder="체크아웃" id="proEndDate">
				            	<span class="input-group-addon">
				            		<i class="glyphicon glyphicon-calendar"></i>
			            		</span>
				            </div>&nbsp;&nbsp;&nbsp;
				            <input type="text" class="form-control" id="title_pro" placeholder="프로모션 명">
				         </div>
				         <button class="btn btn-default" onclick='searchProAdmin()'>검색</button>
				      </form>
				   	</div>
				</div>
				<!-- 프로모션 검색 끝 -->
				<!-- 프로모션 게시판 -->
				<div class="container" style="margin-top:20px">
					<table class="table table-bordered" style="border:hidden">
					<tr>
						<td>
							<c:forEach items="${listPros}" var="pro">
								<div class="board_pro">
									<div class="image_pro"><a href="#" class="thumbnail"></a></div>
									<div class="content_pro">
										<a class="more" id="${pro.proNum}" href="#" onClick="detailView(${pro.proNum})">
											more <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
										</a>
										<br><h2>${pro.proTitle}</h2>
										<h4>&nbsp;${pro.proStartDate} ~ ${pro.proEndDate}</h4><br>
										<textarea wrap="VIRTUAL" style="width:90%; height:100px; border:0;overflow-y:hidden;
											font-weight:bold; background:clear;" onfocus="this.blur()"
											readonly>${pro.proContent}</textarea>
									</div>
								</div>
								<hr>
							</c:forEach>
						</td>
					</tr>
					</table>
					<!-- paging -->
					<div class="paging" style="text-align:center">
						<ul class="pagination">
				        	<li class="page-item">
				        		<a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a>
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
				            <li class="page-item"><a class="page-link" href="#" aria-label="Next">
				            	<span aria-hidden="true">&raquo;</span></a>
				            </li>
				         </ul>       
					</div>
					<!-- paging 끝 -->
				</div>
			</section>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>