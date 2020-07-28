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

table {
	margin-left: auto;
	margin-right: auto;
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
<title>고객회원가입</title>
</head>
<body style="background-color: #E6E6FA">
	<div id="wrap">
		<br><br><br><br><br><br>
		<font size="5" color="gray">고객회원가입</font>
		<form action="customerInsertPro.jsp" method="post">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="id" maxlength="20"></td>
				</tr>
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="text" name="pwd" maxlength="20"><br></td>
				</tr>
				<tr>
				
					<td id="title">닉네임</td>
					<td><input type="text" name="name" maxlength="20"><br></td>
				</tr>
				<tr>
					<td id="title">전화번호</td>
					<td><input type="text" name="tel" maxlength="20"><br></td>
				</tr>
				<br>

			</table>
			<br>
			<input type="submit" class="button" value="완료">
		</form>
	</div>
</body>
</html>