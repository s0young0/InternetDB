<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<%request.setCharacterEncoding("utf-8");
 %>
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
<title>메뉴조회</title>
</head>
<body style="background-color: #E6E6FA">
<% 
String id=(String)session.getAttribute("id");
int r_no = 0;
String r_name = null;
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201712028", "201712028");

int customer_no = 0;

if(id != null){
   String sqlStr = "select * from Restaurant where id=?";
   PreparedStatement st = conn.prepareStatement(sqlStr);
   st.setString(1, id);
   ResultSet rs = st.executeQuery();
   while(rs.next()){
      r_name = rs.getString("restaurant_name");
      r_no = rs.getInt("restaurant_no");
   }
}
%>
<br><br>
<center>
<font size="6" color="gray"><%=r_name %></font>
<font size="5" color="gray"> 식당 메뉴 관리<br></font>
</center>
<br>
<%

String sqlStr = "select * from menu where restaurant_no = ?";
PreparedStatement st = conn.prepareStatement(sqlStr);
st.setInt(1,r_no);
ResultSet rs = st.executeQuery();
if(!rs.next()){
   %><a>해당 식당에는 메뉴가 없습니다. </a><br><%
}
else{
   %>
   <table style="border:1px solid skyblue;width:60%;height:100px;margin:auto;text-align:center;">
   <tr><th> 메뉴이름  <th> 가격  </tr>
   <%
   while(true){
      String title = rs.getString("menu_title");
      String price = rs.getString("menu_price");
      %>
      <tr><td><a href="./menuUpdateForm.jsp?title=<%=title%>&r_no=<%=r_no%>&price=<%=price%>"> <%=title%> </a><td> <%=price%> 
      </tr>
      <%
      if(!rs.next()) break;

   }
   
}
%>
<center>
<input type="button" class="button" value="메인으로" onclick="location.href='restaurantMain.jsp'">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="button" value="로그아웃" onclick="location.href='logout.jsp'">
</center>
<br>
</body>
</html>