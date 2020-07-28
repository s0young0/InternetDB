<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pknu.it.CustomerDB" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>

#wrap {
	margin-left: auto;
	magin-right: auto;
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;

}
.button {
	background-color:#FFC0CB;
	border:none;
	color: white;
	padding: 30px, 60px;
	font-size: 20px;
	text-align: center;
	border-radius: 5px;
}
</style>
</head>

<body style="background-color:#E6E6FA">
<% 
	String id;
	if (session.getAttribute("id") != null) {
	id = "세션값 있음";
	} else {
	id = "세션값 없음";
	}
%>

	
	<div id="wrap">
		<br><br><br><br><br><br> <br> <b><font size="6" color="gray">환영합니다 :) </font></b> <br>
		<font size="4" color="gray">식당 예약 서비스를 위한 로그인이 필요합니다.</font>
		<br> <br>
		<form action="loginPro.jsp" method="post">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="id" maxlength="20"><br></td>
				</tr>
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="passwd" maxlength="20"><br></td>
				</tr>
			</table>
			
			<br> <input type="submit" class="button" value="로그인" >
				 <input type="button" class="button" value="회원가입"
				onclick="location.href='customer-restaurantChoose.jsp'"> <br>
		</form>
	</div>

</body>
</html>