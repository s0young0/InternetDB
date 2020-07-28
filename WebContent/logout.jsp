<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#wrap {
	margin-left: auto;
	magin-right: auto;
	text-align: center;
}
.button {
	background-color: #FFC0CB;
	border: none;
	color: white;
	padding: 30px, 60px;
	font-size: 20px;
	text-align: center;
	border-radius: 5px;
}
</style>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body style="background-color: #E6E6FA">

<%
	session.invalidate();
%>
<div id="wrap"> <br><br><br><br>
<font size ="6" color="gray">You have logged out.</font> <br><br>
<input type="button" class="button" value="로그인" onclick="location.href='loginForm.jsp'">

</div>
</body>
</html>