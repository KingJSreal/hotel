<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
	div.hTitS{
		margin-top: 50px;
	}
	.info{
		float: right;
		text-align: right;
	}
	table.table.table-bordered{
		margin-bottom: 0px;
	}
	table.table.table-bordered th{
		padding-top: 12px;
		background-color:#f8f8f8; 
	}
	
	.ast{
		color: red;
		font-size: 18px;
		font-style: normal;
	}
	div.Btns{
		text-align: center;
		margin: 30px 0 30px 0;
	}
	
	.btn{
		border-radius: 0;
		font-size: 16;
		font-weight: 800;
	}
</style>
<script>
</script>
<div id="modal" class="modal fade">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- 모달 바디 -->
			<div class="modal-body">
				<div class="hTitS">
					<div class="info">
						<em class="ast">*</em> 표시 필수입력사항
					</div>
					<h4>기본 정보</h4>
				</div>
				<table class="table table-bordered">
					<colgroup>
						<col width="16%" class="col1">
						<col class="col2">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="first">번호</th>
							<td>		
								<div class="form-group">	
									<label id="userNum" class="control-label"></label> 
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="first">가입일</th>
							<td>		
								<div class="form-group">	
									<label id="userRegDate" class="control-label"></label> 
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="first">이메일</th>
							<td>		
								<div class="form-group">	
									<label id="userEmail" class="control-label"></label> 
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="first">권한</th>
							<td>		
								<div class="form-group">	
									<label id="userGrade" class="control-label"></label> 
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="first">비밀번호</th>
							<td>		
								<div class="form-group">	
									<label id="userPassword" class="control-label"></label> 
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="first">포인트</th>
							<td>		
								<div class="form-group">	
									<label id="" class="control-label"></label> 
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="first">이름(국문)</th>
							<td>		
								<div class="form-group">	
									<label id="userName" class="control-label"></label> 
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="first">이름(영문)</th>
							<td>		
								<div class="form-group">	
									<label id="userEngFirstName" class="control-label"></label> 
									<label id="userEngLastName" class="control-label"></label> 
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="first">생년월일</th>
							<td>		
								<div class="form-group">	
									<label id="userBirth" class="control-label"></label> 
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="first">휴대전화</th>
							<td>		
								<div class="form-group">	
									<label id="userPhone" class="control-label"></label> 
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="first">자택전화</th>
							<td>		
								<div class="form-group">	
									<label id="userTel" class="control-label"></label> 
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" class="first">자택주소</th>
							<td>		
								<div class="form-group">	
									<label id="userZip" class="control-label"></label><br>
									<label id="userAdd" class="control-label"></label><br>
									<label id="userAddDetail" class="control-label"></label> 
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="close" id="msgModal-close" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>