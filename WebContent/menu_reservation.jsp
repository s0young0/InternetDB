<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<%request.setCharacterEncoding("utf-8");
 %>
<html>
<head>
<style>
h2 {text-align: center;}
input {text-align: center;}
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu choooose~!</title>
</head>
<body style="background-color: #E6E6FA">
<form action="./menu_cnt.jsp" method="POST">
<%

Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201712028", "201712028");

String r_noStr = request.getParameter("r_number");
int r_no = 0;
if(r_noStr != null && r_noStr.length() >=1 ){
	r_no = Integer.parseInt(r_noStr);
}

%>
<br><br><br>
<center>
<font size="5" color="gray">메뉴선택</font>
</center>
<br><br>
<%

int customer_no = 11111;
String sqlStr = "select * from menu where restaurant_no = ?";

PreparedStatement st = conn.prepareStatement(sqlStr);
st.setInt(1, r_no);
ResultSet rs = st.executeQuery();


while(rs.next()){
	String m_name = rs.getString("menu_title");
	String m_price = rs.getString("menu_price");
	%>
	<center><input type="checkbox" name="m_name" value=<%=m_name%>><%=m_name%> / <%=m_price%></center><br>	
	<%
}
%>

<center>
<input type="hidden"  name="r_no" value="<%=r_no %>">
<input type="button" class="button" value="메인으로" onclick="location.href='customerMain.jsp'">
&nbsp;
<input type="submit" class="button" value="개수 선택">
&nbsp;
<input type="button" class="button" value="로그아웃" onclick="location.href='logout.jsp'">
</center>

</body>
</html>