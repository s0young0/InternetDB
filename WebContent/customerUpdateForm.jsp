<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pknu.it.CustomerDataBean"%>
<%@ page import="pknu.it.CustomerDB"%>
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
<title>회원정보확인및수정</title>
</head>
<body style="background-color: #E6E6FA">
	<%
		String id = (String) session.getAttribute("id");
		if (id == null) {
			response.sendRedirect("loginForm.jsp");
		}
		CustomerDB dbPro = new CustomerDB();
		CustomerDataBean customer = dbPro.getCustomer(id);
	%>
	<div id="wrap"><br><br><br><br><br>
		<font size="5" color="gray">회원정보확인 및 수정</font> <br><br>
		<form action="customerUpdatePro.jsp" method="post">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td><%=customer.getId()%> <input type=hidden name="id" value="<%=customer.getId()%>"><br></td>
				</tr>
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="pwd"><br></td>
				</tr>
				<tr>
					<td id="title">닉네임</td>
					<td><input type="text" name="name"
						value="<%=customer.getName()%>"><br></td>
				</tr>
				<tr>
					<td id="title">전화번호</td>
					<td><input type="text" name="tel"
						value="<%=customer.getTel()%>"><br></td>
				</tr>
			</table>
			<br> 
			<input type="submit" class="button" value="회원수정">&nbsp;&nbsp;
			<input type="button" class="button" value="로그아웃" onclick="location.href='logout.jsp'">
		</form>
	</div>
</body>
</html>