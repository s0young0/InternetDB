<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%request.setCharacterEncoding("utf-8");
 %>
<html>
<head>
<style>
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
<title>Menu~~CoUnT~!</title>
</head>
<body style="background-color: #E6E6FA">
<form action="./reservation.jsp" method="POST">
<br><br>
<center> <font size="5" color="gray">수량 선택</font></center>
<%
String r_num = request.getParameter("r_no");
String [] m_name = request.getParameterValues("m_name");

if(r_num=="" || m_name==null){
	   %><script type="text/javascript">alert("항목을 하나 이상 선택해주세요."); history.go(-1);</script>
	<% } else{

for(int i=0; i<m_name.length; i++){
	%><center><%=m_name[i]%> : 
	<select name="count">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    
</select></center><br><% 
}

%>

<center> <font size="5" color="gray">인원 수</font> <br>
<input type="text" name="people" /></center><br>

<center> <font size="5" color="gray">예약 날짜</font> <br>
<input type="datetime-local" name="r_date"><br>
<input type="hidden"  name="r_no" value="<%=r_num %>"> </center>
<%
for(int i=0;i<m_name.length;i++){
%>
<input type="hidden"  name="m_name" value="<%=m_name[i]%>">
<%
}
%>

<br>

<center><input type="submit" class="button" value="예약 하기"/></center>

<%
}
%>

</body>
</html>