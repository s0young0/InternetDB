<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pknu.it.RestaurantDataBean"%>
<%@ page import="pknu.it.RestaurantDB"%>
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
<title>Insert title here</title>
</head>
<body style="background-color: #E6E6FA">
	<%
		String id = (String) session.getAttribute("id");
		if (id == null) {
			response.sendRedirect("loginForm.jsp");
		}
		RestaurantDB dbPro = new RestaurantDB();
		RestaurantDataBean restaurant = dbPro.getRestaurant(id);
	%>
	<div id="wrap"><br><br><br><br>
		<font size="5" color="gray">회원정보확인 및 수정</font> <br> <br>
		<form action="restaurantUpdatePro.jsp" method="post">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td><%=restaurant.getId()%> <input type=hidden name="id"
						value="<%=restaurant.getId()%>" style="width:300px;"><br></td>
				</tr>
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="pwd" style="width:300px;"><br></td>
				</tr>
				<tr>
					<td id="title">닉네임</td>
					<td><input type="text" name="name"
						value="<%=restaurant.getName()%>" style="width:300px;"><br></td>
				</tr>
				<tr>
					<td id="title">도로명주소</td>
					<td><input type="text" name="addr"
						value="<%=restaurant.getAddress()%>" style="width:300px;"><br></td>
				</tr>
				 <%System.out.println(restaurant.getAddress());%>
				<tr>
					<td id="title">전화번호</td>
					<td><input type="text" name="tel"
						value="<%=restaurant.getTel()%>" style="width:300px;"><br></td>
				</tr>
				<tr>
					<td id="title">식당구분</td>
					<td><input type="radio" name="rclass" value="한식" checked>한식 
					    <input type="radio" name="rclass" value="일식" checked>일식 
					    <input type="radio" name="rclass" value="중식" checked>중식  
					    <input type="radio" name="rclass" value="양식" checked>양식 <br>
					    <input type="radio" name="rclass" value="분식" checked>분식
						<input type="radio" name="rclass" value="패스트푸드" checked>패스트푸드<br></td>
				</tr>
				<tr>
					<td id="title">좌석수</td>
					<td><input type="number" name="table"
						value="<%=restaurant.getTable()%>"style="width:300px;"><br></td>
				</tr>
				</table>
				<br>
				<input type="submit" class="button" value="정보수정">&nbsp;&nbsp;
				<input type="button" class="button" value="로그아웃" onclick="location.href='logout.jsp'">
				</form>
				</div>
</body>
</html>