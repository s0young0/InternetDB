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
<title>Insert title here</title>
</head>
<body style="background-color: #E6E6FA">
<%
String id=(String)session.getAttribute("id");
if(id==null){
 response.sendRedirect("loginForm.jsp");
}
%>
<div id="wrap">
<br><br><br>
<font size="7" color="gray"><%=id %></font>
<font size="5" color="gray">님 반갑습니다 :D<br></font>


<br><br>
<input type="button" class="button" value="회원정보수정및확인" onclick="location.href='restaurantUpdateForm.jsp'">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="button" value="메뉴관리" onclick="location.href='menuManage.jsp'">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="button" value="예약관리" onclick="location.href='reservation_res.jsp'">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="button" value="로그아웃" onclick="location.href='logout.jsp'">
</div>
</body>
</html>