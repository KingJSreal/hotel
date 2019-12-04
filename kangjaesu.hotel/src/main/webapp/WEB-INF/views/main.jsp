<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용호텔</title>
<jsp:include page="common/import.jsp"></jsp:include>
<style>
	@import url("<c:url value="/css/section.css" />");
	
	div .searchBar {
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	div.promotion-title{
		padding-bottom: 5px;
	} 
	h4.promotion-title{
		margin-bottom: 0px;
	} 
	
	#more{
		float: right;
		font-size: 15px;
		text-decoration:none;
	}
	#more:hover{
		color:#A0A0A0;
	}
	/*메인 섹션 끝*/
</style>
</head>
<body>
	<div>
		<jsp:include page="common/header.jsp" />
		<jsp:include page="common/gnb.jsp" />
		<!-- 예약정보 검색 -->
		<div id="contents">
			<section>
				<div class="container center-block text-center">
					<div class="panel panel-default">
						<form class="form-inline searchBar">
							<div class="form-group">
				            	<p class="form-control-static">예약정보를 선택하세요</p>
				            	<p class="form-control-static">&nbsp; | &nbsp; 체크인</p>
				            <div class="input-group date">
				               	<input type="date" class="form-control" placeholder="체크인"
				                  value="체크인">
			                	<span class="input-group-addon">
				                	<i class="glyphicon glyphicon-calendar"></i>
			                	</span>
				            </div>
				            <p class="form-control-static">&nbsp; | &nbsp; 체크아웃</p>
				            <div class="input-group date">
				            	<input type="date" class="form-control" placeholder="체크아웃">
				            	<span class="input-group-addon">
				            		<i class="glyphicon glyphicon-calendar"></i>
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
				      </form>
				   	</div>
				</div>
				<!-- 예약정보 끝 -->
			
				<!-- 패키지 프로모션 -->
				<div class="container center-block text-center">
					<div class="panel panel-default">
						<div class="panel-body promotion-title">
				        	<h4 class="text-center promotion-title">PACKAGES PROMOTIONS</h4>
				        	<a id="more" href="#">more <span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
				     	</div>
				  	</div>
				  	<div class="row">
				     	<div class="col-sm-3 col-md-3">
				        	<div class="thumbnail">
			           			<a href="#" class="thumbnail" style="height: 200px;"> </a>
				       			<div class="caption">
				          			<h3>서울호텔</h3>
				          			<h4>halloween Party</h4>
				          			<p>2019.02.01~2019.02.15</p>
				       			</div>
				 			</div>
				 		</div>
				 		<div class="col-sm-3 col-md-3">
				    		<div class="thumbnail">
					       		<a href="#" class="thumbnail" style="height: 200px;"> </a>
					       		<div class="caption">
					          		<h3>서울호텔</h3>
					          		<h4>halloween Party</h4>
					          		<p>2019.02.01~2019.02.15</p>
				       			</div>
				    		</div>
				 		</div>
					 	<div class="col-sm-3 col-md-3">
							<div class="thumbnail">
						    	<a href="#" class="thumbnail" style="height: 200px;"> </a>
						       	<div class="caption">
						        	<h3>서울호텔</h3>
						          	<h4>halloween Party</h4>
						          	<p>2019.02.01~2019.02.15</p>
						       	</div>
						    </div>
				 		</div>
						<div class="col-sm-3 col-md-3">
							<div class="thumbnail">
						    	<a href="#" class="thumbnail" style="height: 200px;"> </a>
				          		<div class="caption">
						        	<h3>서울호텔</h3>
					            	<h4>halloween Party</h4>
					            	<p>2019.02.01~2019.02.15</p>
					            </div>
				    		</div>
				    	</div>
					</div>
				</div>
				<!-- 끝 -->
				<!-- 룸 프로모션 -->
				<div class="container center-block text-center">
					<div class="panel panel-default">
						<div class="panel-body promotion-title">
			         		<h4 class="text-center promotion-title">ROOMS</h4>
				         	<a id="more" href="#">more <span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
				      	</div>
				   	</div>
				   	<div class="row">
				      	<div class="col-sm-3 col-md-3">
				         	<div class="thumbnail">
				            <a href="#" class="thumbnail" style="height: 200px;"> </a>
						        <div class="caption">
						           <h3>서울호텔</h3>
						           <h4>서울호텔 특급세일</h4>
						           <p>2019.02.01~2019.02.15</p>
						        </div>
			     			</div>
				  		</div>
					  	<div class="col-sm-3 col-md-3">
					     	<div class="thumbnail">
					        	<a href="#" class="thumbnail" style="height: 200px;"> </a>
					        	<div class="caption">
					           		<h3>서울호텔</h3>
						           	<h4>서울호텔 특급세일</h4>
						           	<p>2019.02.01~2019.02.15</p>
						        </div>
					     	</div>
					  	</div>
					  	<div class="col-sm-3 col-md-3">
							<div class="thumbnail">
								<a href="#" class="thumbnail" style="height: 200px;"> </a>
								<div class="caption">
					         		<h3>서울호텔</h3>
					         		<h4>서울호텔 특급세일</h4>
					         		<p>2019.02.01~2019.02.15</p>
					      		</div>
						   	</div>
						</div>
						<div class="col-sm-3 col-md-3">
							<div class="thumbnail">
						    	<a href="#" class="thumbnail" style="height: 200px;"> </a>
						        <div class="caption">
					           		<h3>서울호텔</h3>
					              	<h4>서울호텔 특급세일</h4>
					             	<p>2019.02.01~2019.02.15</p>
					        	</div>
							</div>
						</div>
					</div>
				</div>
			<!-- 끝 -->
			</section>
		</div>
		<jsp:include page="common/footer.jsp" />
	</div>
</body>
</html>