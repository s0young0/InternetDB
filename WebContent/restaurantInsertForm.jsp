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
	border-radius: 10px;
}
</style>
<meta charset="UTF-8">
<title>식당회원가입</title>
</head>
<div id="wrap">
	<br> <br> <br> <br> <br> <br> 
	<font size="5" color="gray">식당회원가입</font> <br><br>
	<body style="background-color: #E6E6FA">
		<form action="restaurantInsertPro.jsp" method="post">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="id" maxlength="20"><br></td>
				</tr>
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="text" name="pwd" maxlength="20"><br></td>
				</tr>
				<tr>
					<td id="title">식당이름</td>
					<td><input type="text" name="name" maxlength="20"><br></td>
				</tr>
				<tr>
					<td id="title">도로명주소</td>
					<td><input type="text" name="address" maxlength="20"><br></td>
				</tr>
				<tr>
					<td id="title">전화번호</td>
					<td><input type="text" name="tel" maxlength="20"><br></td>
				</tr>
				<tr>
					<td id="title">식당구분</td>
					<td><input type="radio" name="rclass" value="한식" checked>한식 
						<input type="radio" name="rclass" value="일식" checked>일식 
						<input type="radio" name="rclass" value="중식" checked>중식 <br>
						<input type="radio" name="rclass" value="양식" checked>양식 
						<input type="radio" name="rclass" value="분식" checked>분식 
						<input type="radio" name="rclass" value="패스트푸드" checked>패스트푸드<br></td>
				</tr>
				<tr>
					<td id="title">좌석수</td>
					<td><input type="number" name="table" maxlength="20"><br></td>
				</tr>
			</table>
			<br><input type="submit" class="button" value="전송"> <br>
		</form>
</div>
</body>
</html>