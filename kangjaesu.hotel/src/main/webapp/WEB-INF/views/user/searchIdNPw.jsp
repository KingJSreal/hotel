<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../res/css/common.css">
<meta charset="EUC-KR">
<title>로그인</title>
<style>
	/*메인 섹션*/
	section {
		margin: 0px 0 0px 0;
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
    .location a{
    	text-decoration:none;
    	color:#4C4A4A;
    }
	div.headTit{
		border-bottom: #432c10 solid 2px;
	    height: 47px;
	    margin: 0 auto;
	    position: relative;
    	z-index: 8;
    	font-style:Sans-Serif;
    } 
	/* 섹션 타이틀 끝 */	
	div.hTitS{
		margin-top: 50px;
	}
	table.table.table-bordered{
		margin-bottom: 0px;
	}
	table.table.table-bordered th{
		padding-top: 12px;
		background-color:#f8f8f8; 
	}
	
	div.searchBtns{
		text-align: right;
		margin: 5px 0 30px 0;
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
    /*메인 섹션 끝*/
</style>
<script>
function check_idsearch(){
	var frm = document.idsearch;
	var cnt = 0;
	
	for(var i = 0; i < frm.elements.length; i++){
		if(frm.elements[i].value)
			cnt++;
	}

	switch(cnt){
		case 0:
			alert("성명[국문]을 입력해주세요.");
			break;
		case 1:
		case 2:
			alert("성명[영문]을 입력해주세요.");
			break;
		case 3:
		case 4:
		case 5:
			alert("생년월일을 입력해주세요.");
			break;
		case 6:
			return true;
	}
	return false;
}

function check_pwsearch(){
	var frm = document.pwsearch;
	var cnt = 0;
	
	for(var i = 0; i < frm.elements.length; i++){
		if(frm.elements[i].value)
			cnt++;
	}

	switch(cnt){
		case 0:
			alert("성명[국문]을 입력해주세요.");
			break;
		case 1:
		case 2:
			alert("성명[영문]을 입력해주세요.");
			break;
		case 3:
		case 4:
		case 5:
			alert("생년월일을 입력해주세요.");
			break;
		case 6:
		case 7:
		case 8:
			alert("이메일을 입력해주세요.");
			break;
		case 9:
		case 10:
		case 11:
			alert("핸드폰 번호를 입력해주세요.");
			break;
		case 12:
			return true;
	}
	return false;
}
$(function(){	
	$("#idsearch").bind("submit", function(e){
		e.preventDefault();
		if(check_idsearch()){
			$("#modal #msgTitle").text("아이디 찾기");
			$("#modal #msg").text("귀하의 아이디는: User /n 입니다.");
			$("#modal").modal("show");
		}
	});
	
	$("#pwsearch").bind("submit", function(e){
		e.preventDefault();
		if(check_pwsearch()){
			$("#modal #msgTitle").text("비밀번호 찾기");
			$("#modal #msg").text("귀하의 비밀번호는: User /n 입니다.");
			$("#modal").modal("show");
		}
	});
	
	$("#msgModal-close").bind("click", function(){
		location.href = "../main.html";
	})
});
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="../common/header.jsp" />
		<jsp:include page="../common/gnb.jsp" />
		<!-- 로그인 폼 -->
		<section>
			<div class="container center-block">
				<div class="location">
					<p>
						<a><span class="glyphicon glyphicon-home">&nbsp;></span></a>
						<a>아이디 비밀번호 찾기</a>
					</p>
				</div>
				<div class="headTit">
					<h3>&nbsp;아이디 / 패스워드 찾기</h3>
				</div>
				<br><br>
				<form class="form-inline" id="idsearch" name="idsearch" method="POST">
					<div class="hTitS">
						<h4 class="tit">아이디 찾기</h4>
					</div>
					<table class="table table-bordered">
						<colgroup>
							<col width="16%" class="col1">
							<col class="col2">
						</colgroup>
						<tbody>
							<tr class="first">
								<th scope="row" class="first"><em class="ast">*</em> 성명(국문)</th>
								<td>
									<label for="userName" class=""></label> 
									<input type="text" class="form-control" id="userName" name="userName" maxlength="30" value="">
								</td>
							</tr>
							<tr>
								<th scope="row"><em class="ast">*</em> 성명(영문)</th>
								<td>
									<label for="userEngFirstName" class="">First name(이름)</label> 
									<input id="userEngFirstName" name="userEngFirstName" type="text" class="form-control" value="" maxlength="30"> 
									&nbsp;
									<label for="userEngLastName" class="">Last name(성)</label> 
									<input id="userEngLastName" name="userEngLastName" type="text" class="form-control" value="" maxlength="30">
								</td>
							</tr>
							<!-- 생년월일 -->
							<tr>
								<th scope="row"><em class="ast">*</em> 생년월일</th>
								<td>
									<span class="" id="uniform-birthYear" style="width: 74px;">
										<select class="form-control" id="birthYear" name="birthYear">
											<option value="">선택</option>
											<option value="2000" title="2000">2000</option>
											<option value="1999" title="1999">1999</option>
											<option value="1998" title="1998">1998</option>
											<option value="1997" title="1997">1997</option>
											<option value="1996" title="1996">1996</option>
											<option value="1995" title="1995">1995</option>
											<option value="1994" title="1994">1994</option>
											<option value="1993" title="1993">1993</option>
											<option value="1992" title="1992">1992</option>
											<option value="1991" title="1991">1991</option>
											<option value="1990" title="1990">1990</option>
											<option value="1989" title="1989">1989</option>
											<option value="1988" title="1988">1988</option>
											<option value="1987" title="1987">1987</option>
											<option value="1986" title="1986">1986</option>
											<option value="1985" title="1985">1985</option>
											<option value="1984" title="1984">1984</option>
											<option value="1983" title="1983">1983</option>
											<option value="1982" title="1982">1982</option>
											<option value="1981" title="1981">1981</option>
											<option value="1980" title="1980">1980</option>
											<option value="1979" title="1979">1979</option>
											<option value="1978" title="1978">1978</option>
											<option value="1977" title="1977">1977</option>
											<option value="1976" title="1976">1976</option>
											<option value="1975" title="1975">1975</option>
											<option value="1974" title="1974">1974</option>
											<option value="1973" title="1973">1973</option>
											<option value="1972" title="1972">1972</option>
											<option value="1971" title="1971">1971</option>
											<option value="1970" title="1970">1970</option>
											<option value="1969" title="1969">1969</option>
											<option value="1968" title="1968">1968</option>
											<option value="1967" title="1967">1967</option>
											<option value="1966" title="1966">1966</option>
											<option value="1965" title="1965">1965</option>
											<option value="1964" title="1964">1964</option>
											<option value="1963" title="1963">1963</option>
											<option value="1962" title="1962">1962</option>
											<option value="1961" title="1961">1961</option>
											<option value="1960" title="1960">1960</option>
											<option value="1959" title="1959">1959</option>
											<option value="1958" title="1958">1958</option>
											<option value="1957" title="1957">1957</option>
											<option value="1956" title="1956">1956</option>
											<option value="1955" title="1955">1955</option>
											<option value="1954" title="1954">1954</option>
											<option value="1953" title="1953">1953</option>
											<option value="1952" title="1952">1952</option>
											<option value="1951" title="1951">1951</option>
											<option value="1950" title="1950">1950</option>
											<option value="1949" title="1949">1949</option>
											<option value="1948" title="1948">1948</option>
											<option value="1947" title="1947">1947</option>
											<option value="1946" title="1946">1946</option>
											<option value="1945" title="1945">1945</option>
											<option value="1944" title="1944">1944</option>
											<option value="1943" title="1943">1943</option>
											<option value="1942" title="1942">1942</option>
											<option value="1941" title="1941">1941</option>
											<option value="1940" title="1940">1940</option>
											<option value="1939" title="1939">1939</option>
											<option value="1938" title="1938">1938</option>
											<option value="1937" title="1937">1937</option>
											<option value="1936" title="1936">1936</option>
											<option value="1935" title="1935">1935</option>
											<option value="1934" title="1934">1934</option>
											<option value="1933" title="1933">1933</option>
											<option value="1932" title="1932">1932</option>
											<option value="1931" title="1931">1931</option>
											<option value="1930" title="1930">1930</option>
											<option value="1929" title="1929">1929</option>
											<option value="1928" title="1928">1928</option>
											<option value="1927" title="1927">1927</option>
											<option value="1926" title="1926">1926</option>
											<option value="1925" title="1925">1925</option>
											<option value="1924" title="1924">1924</option>
											<option value="1923" title="1923">1923</option>
											<option value="1922" title="1922">1922</option>
											<option value="1921" title="1921">1921</option>
											<option value="1920" title="1920">1920</option>
											<option value="1919" title="1919">1919</option>
											<option value="1918" title="1918">1918</option>
											<option value="1917" title="1917">1917</option>
											<option value="1916" title="1916">1916</option>
											<option value="1915" title="1915">1915</option>
											<option value="1914" title="1914">1914</option>
											<option value="1913" title="1913">1913</option>
											<option value="1912" title="1912">1912</option>
											<option value="1911" title="1911">1911</option>
											<option value="1910" title="1910">1910</option>
											<option value="1909" title="1909">1909</option>
										</select>
									</span> 
									<label for="birthYear" class="birthYear">년</label>
									<span class="" id="uniform-birthMonth" style="width: 71px;">
										<select class="form-control" id="birthMonth" name="birthMonth">
											<option value="">선택</option>
											<option value="1" title="1">1</option>
											<option value="2" title="2">2</option>
											<option value="3" title="3">3</option>
											<option value="4" title="4">4</option>
											<option value="5" title="5">5</option>
											<option value="6" title="6">6</option>
											<option value="7" title="7">7</option>
											<option value="8" title="8">8</option>
											<option value="9" title="9">9</option>
											<option value="10" title="10">10</option>
											<option value="11" title="11">11</option>
											<option value="12" title="12">12</option>
										</select>
									</span> 
									<label for="birthMonth" class="">월</label>
									<span class="" id="uniform-birthDay" style="width: 71px;">
										<select class="form-control" id="birthDay" name="birthDay">
											<option value="">선택</option>
											<option value="1" title="1">1</option>
											<option value="2" title="2">2</option>
											<option value="3" title="3">3</option>
											<option value="4" title="4">4</option>
											<option value="5" title="5">5</option>
											<option value="6" title="6">6</option>
											<option value="7" title="7">7</option>
											<option value="8" title="8">8</option>
											<option value="9" title="9">9</option>
											<option value="10" title="10">10</option>
											<option value="11" title="11">11</option>
											<option value="12" title="12">12</option>
											<option value="13" title="13">13</option>
											<option value="14" title="14">14</option>
											<option value="15" title="15">15</option>
											<option value="16" title="16">16</option>
											<option value="17" title="17">17</option>
											<option value="18" title="18">18</option>
											<option value="19" title="19">19</option>
											<option value="20" title="20">20</option>
											<option value="21" title="21">21</option>
											<option value="22" title="22">22</option>
											<option value="23" title="23">23</option>
											<option value="24" title="24">24</option>
											<option value="25" title="25">25</option>
											<option value="26" title="26">26</option>
											<option value="27" title="27">27</option>
											<option value="28" title="28">28</option>
											<option value="29" title="29">29</option>
											<option value="30" title="30">30</option>
											<option value="31" title="31">31</option>
										</select>
									</span> 
									<label for="birthDay" class="">일</label>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="searchBtns">
						<button class="btn btn-default" type="submit" name="submitBtn" style="padding:10px 70px">아이디 찾기</button>
					</div>
				</form>
				<form class="form-inline" id="pwsearch" name="pwsearch" method="POST">
					<div class="hTitS">
						<h4 class="tit">패스워드 찾기</h4>
					</div>
					<table class="table table-bordered">
						<colgroup>
							<col width="16%" class="col1">
							<col class="col2">
						</colgroup>
						<tbody>
							<tr class="first">
								<th scope="row" class="first"><em class="ast">*</em> 성명(국문)</th>
								<td>
									<label for="userName" class=""></label> 
									<input type="text" class="form-control" id="userName" name="userName" maxlength="30" value="">
								</td>
							</tr>
							<tr>
								<th scope="row"><em class="ast">*</em> 성명(영문)</th>
								<td>
									<label for="userEngFirstName" class="">First name(이름)</label> 
									<input id="userEngFirstName" name="userEngFirstName" type="text" class="form-control" value="" maxlength="30"> 
									&nbsp;
									<label for="userEngLastName" class="">Last name(성)</label> 
									<input id="userEngLastName" name="userEngLastName" type="text" class="form-control" value="" maxlength="30">
								</td>
							</tr>
							<!-- 생년월일 -->
							<tr>
								<th scope="row"><em class="ast">*</em> 생년월일</th>
								<td>
									<span class="" id="uniform-birthYear" style="width: 74px;">
										<select class="form-control" id="birthYear" name="birthYear">
											<option value="">선택</option>
											<option value="2000" title="2000">2000</option>
											<option value="1999" title="1999">1999</option>
											<option value="1998" title="1998">1998</option>
											<option value="1997" title="1997">1997</option>
											<option value="1996" title="1996">1996</option>
											<option value="1995" title="1995">1995</option>
											<option value="1994" title="1994">1994</option>
											<option value="1993" title="1993">1993</option>
											<option value="1992" title="1992">1992</option>
											<option value="1991" title="1991">1991</option>
											<option value="1990" title="1990">1990</option>
											<option value="1989" title="1989">1989</option>
											<option value="1988" title="1988">1988</option>
											<option value="1987" title="1987">1987</option>
											<option value="1986" title="1986">1986</option>
											<option value="1985" title="1985">1985</option>
											<option value="1984" title="1984">1984</option>
											<option value="1983" title="1983">1983</option>
											<option value="1982" title="1982">1982</option>
											<option value="1981" title="1981">1981</option>
											<option value="1980" title="1980">1980</option>
											<option value="1979" title="1979">1979</option>
											<option value="1978" title="1978">1978</option>
											<option value="1977" title="1977">1977</option>
											<option value="1976" title="1976">1976</option>
											<option value="1975" title="1975">1975</option>
											<option value="1974" title="1974">1974</option>
											<option value="1973" title="1973">1973</option>
											<option value="1972" title="1972">1972</option>
											<option value="1971" title="1971">1971</option>
											<option value="1970" title="1970">1970</option>
											<option value="1969" title="1969">1969</option>
											<option value="1968" title="1968">1968</option>
											<option value="1967" title="1967">1967</option>
											<option value="1966" title="1966">1966</option>
											<option value="1965" title="1965">1965</option>
											<option value="1964" title="1964">1964</option>
											<option value="1963" title="1963">1963</option>
											<option value="1962" title="1962">1962</option>
											<option value="1961" title="1961">1961</option>
											<option value="1960" title="1960">1960</option>
											<option value="1959" title="1959">1959</option>
											<option value="1958" title="1958">1958</option>
											<option value="1957" title="1957">1957</option>
											<option value="1956" title="1956">1956</option>
											<option value="1955" title="1955">1955</option>
											<option value="1954" title="1954">1954</option>
											<option value="1953" title="1953">1953</option>
											<option value="1952" title="1952">1952</option>
											<option value="1951" title="1951">1951</option>
											<option value="1950" title="1950">1950</option>
											<option value="1949" title="1949">1949</option>
											<option value="1948" title="1948">1948</option>
											<option value="1947" title="1947">1947</option>
											<option value="1946" title="1946">1946</option>
											<option value="1945" title="1945">1945</option>
											<option value="1944" title="1944">1944</option>
											<option value="1943" title="1943">1943</option>
											<option value="1942" title="1942">1942</option>
											<option value="1941" title="1941">1941</option>
											<option value="1940" title="1940">1940</option>
											<option value="1939" title="1939">1939</option>
											<option value="1938" title="1938">1938</option>
											<option value="1937" title="1937">1937</option>
											<option value="1936" title="1936">1936</option>
											<option value="1935" title="1935">1935</option>
											<option value="1934" title="1934">1934</option>
											<option value="1933" title="1933">1933</option>
											<option value="1932" title="1932">1932</option>
											<option value="1931" title="1931">1931</option>
											<option value="1930" title="1930">1930</option>
											<option value="1929" title="1929">1929</option>
											<option value="1928" title="1928">1928</option>
											<option value="1927" title="1927">1927</option>
											<option value="1926" title="1926">1926</option>
											<option value="1925" title="1925">1925</option>
											<option value="1924" title="1924">1924</option>
											<option value="1923" title="1923">1923</option>
											<option value="1922" title="1922">1922</option>
											<option value="1921" title="1921">1921</option>
											<option value="1920" title="1920">1920</option>
											<option value="1919" title="1919">1919</option>
											<option value="1918" title="1918">1918</option>
											<option value="1917" title="1917">1917</option>
											<option value="1916" title="1916">1916</option>
											<option value="1915" title="1915">1915</option>
											<option value="1914" title="1914">1914</option>
											<option value="1913" title="1913">1913</option>
											<option value="1912" title="1912">1912</option>
											<option value="1911" title="1911">1911</option>
											<option value="1910" title="1910">1910</option>
											<option value="1909" title="1909">1909</option>
										</select>
									</span> 
									<label for="birthYear" class="birthYear">년</label>
									<span class="" id="uniform-birthMonth" style="width: 71px;">
										<select class="form-control" id="birthMonth" name="birthMonth">
											<option value="">선택</option>
											<option value="1" title="1">1</option>
											<option value="2" title="2">2</option>
											<option value="3" title="3">3</option>
											<option value="4" title="4">4</option>
											<option value="5" title="5">5</option>
											<option value="6" title="6">6</option>
											<option value="7" title="7">7</option>
											<option value="8" title="8">8</option>
											<option value="9" title="9">9</option>
											<option value="10" title="10">10</option>
											<option value="11" title="11">11</option>
											<option value="12" title="12">12</option>
										</select>
									</span> 
									<label for="birthMonth" class="">월</label>
									<span class="" id="uniform-birthDay" style="width: 71px;">
										<select class="form-control" id="birthDay" name="birthDay">
											<option value="">선택</option>
											<option value="1" title="1">1</option>
											<option value="2" title="2">2</option>
											<option value="3" title="3">3</option>
											<option value="4" title="4">4</option>
											<option value="5" title="5">5</option>
											<option value="6" title="6">6</option>
											<option value="7" title="7">7</option>
											<option value="8" title="8">8</option>
											<option value="9" title="9">9</option>
											<option value="10" title="10">10</option>
											<option value="11" title="11">11</option>
											<option value="12" title="12">12</option>
											<option value="13" title="13">13</option>
											<option value="14" title="14">14</option>
											<option value="15" title="15">15</option>
											<option value="16" title="16">16</option>
											<option value="17" title="17">17</option>
											<option value="18" title="18">18</option>
											<option value="19" title="19">19</option>
											<option value="20" title="20">20</option>
											<option value="21" title="21">21</option>
											<option value="22" title="22">22</option>
											<option value="23" title="23">23</option>
											<option value="24" title="24">24</option>
											<option value="25" title="25">25</option>
											<option value="26" title="26">26</option>
											<option value="27" title="27">27</option>
											<option value="28" title="28">28</option>
											<option value="29" title="29">29</option>
											<option value="30" title="30">30</option>
											<option value="31" title="31">31</option>
										</select>
									</span> 
									<label for="birthDay" class="">일</label>
								</td>
							</tr>
							<!-- 이메일 -->
							<tr>
								<th scope="row"><em class="ast">*</em> 이메일</th>
								<td>
									<input id="userEmail1" class="form-control" type="text" size="20" name="email1" value="" maxlength="40"> 
									<span class="at">@</span> 
									<input id="userEmail2" class="form-control" type="text" size="20" name="email2" value="" maxlength="40">
									<span class="" id="uniform-emailDomainCd" style="width: 111px;">
										<select id="emailDomainCd" class="form-control">
											<option value="">직접입력</option>
											<option value="naver.com" title="naver.com">naver.com</option>
											<option value="hanmail.net" title="hanmail.net">hanmail.net</option>
											<option value="nate.com" title="nate.com">nate.com</option>
											<option value="gmail.com" title="gmail.com">gmail.com</option>
											<option value="hotmail.com" title="hotmail.com">hotmail.com</option>
											<option value="yahoo.co.kr" title="yahoo.co.kr">yahoo.co.kr</option>
										</select>
									</span> 
									<span class=""><a href="">이메일 중복확인</a></span>
								</td>
							</tr>
							<!-- 휴대전화 -->
							<tr>
								<th scope="row"><em class="ast">*</em> 휴대전화</th>
								<td><label for="userPhone1" class="phoneComp"></label>
									<span class="" id="uniform-userPhone1" style="width: 67px;">
										<select class="form-control" id="userPhone1" name="userPhone1">
											<option value="010" title="010">010</option>
											<option value="011" title="011">011</option>
											<option value="016" title="016">016</option>
											<option value="017" title="017">017</option>
											<option value="018" title="018">018</option>
											<option value="019" title="019">019</option>
										</select>
									</span>
									- 
									<label for="userPhone2" class=""></label> 
									<input type="text" class="form-control" id="userPhone2" name="userPhone2" maxlength="4"> 
									- 
									<label for="userPhone3" class=""></label>
									<input type="text" class="form-control" id="userPhone3" name="userPhone3" maxlength="4">
								</td>
							</tr>
						</tbody>
					</table>
					<div class="searchBtns">
						<button class="btn btn-default" type="submit" name="submitBtn" style="padding:10px 70px">패스워드 찾기</button>
					</div>
				</form>
			</div>
		</section>
		<br><br><br><br><br>
		<!-- 로그인 폼 끝 -->>
	</div>	
	<jsp:include page="../common/footer.jsp" />
<!-- 푸터 끝 -->
	<div id="modal" class="modal fade">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 id="msgTitle" class="modal-title"></h4>
				</div>
				<!-- 모달 바디 -->
				<div class="modal-body">
					<p id="msg"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="close" id="msgModal-close" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>