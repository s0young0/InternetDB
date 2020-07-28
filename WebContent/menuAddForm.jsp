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
	System.out.println("------------");
	System.out.println(restaurant.getName());
%>
<div id="wrap"><br><br><br><br><br><br>
		<font size="5" color="gray">메뉴추가</font> <br> <br>
		<form action="menuAddPro.jsp" method="post">
			<table>
				<tr>
					<td id="title">식당이름</td>
					<td><%=restaurant.getName()%> <input type=hidden name="name"
						value="<%=restaurant.getName()%>"><br></td>
				</tr>
				<tr>
					<td id="title">메뉴명</td>
					<td><input type="text" name="title" maxlength="20"><br></td>
				</tr>
				<tr>
					<td id="title">가격</td>
					<td><input type="text" name="price" maxlength="20"><br></td>
				</tr>

				</table>
				<br>
				<input type="submit" class="button" value="추가">
				</form>
				</div>
</body>
</html>