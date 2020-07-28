<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
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
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body style="background-color: #E6E6FA">
<%

Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201712028", "201712028");

String id=(String)session.getAttribute("id");
int res_no = 0;

if(id != null){
   String sqlStr1 = "select * from Restaurant where id=?";
   PreparedStatement st1 = conn.prepareStatement(sqlStr1);
   st1.setString(1, id);
   ResultSet rs1 = st1.executeQuery();
   while(rs1.next()){
      res_no = rs1.getInt("restaurant_no");
   }
}

String sqlStr = "select evaluation_no, reservation_no, reservation_menu, evaluation_score,evaluation_data,restaurant_name from Evaluation natural join reservation where restaurant_no = ?";

PreparedStatement st = conn.prepareStatement(sqlStr);
st.setInt(1,res_no);
ResultSet rs = st.executeQuery();
if(!rs.next()){
   %><a>해당 식당에는 예약이 없습니다. </a><br><%
}
else{
   %>
   <br><br><br>
   <table style="border:1px solid skyblue;width:60%;height:100px;margin:auto;text-align:center;">
   <tr> <th> 메뉴이름 <th> 평가점수 <th> 평가 <th> 식당이름  </tr>
   <%
   while(true){
      String e_no = rs.getString("evaluation_no");
      String r_no = rs.getString("reservation_no");
      String r_menu = rs.getString("reservation_menu");
      String e_score = rs.getString("evaluation_score");
      String e_data = rs.getString("evaluation_data");
      String r_name = rs.getString("restaurant_name");
      System.out.println(r_menu);
      if(e_data == null || e_data.equalsIgnoreCase("null")){
         e_data = "";
      }
      %>
      <tr> <td><%=r_menu%> <td><%=e_score%> <td> <%=e_data%> <td> <%=r_name%></tr>
      <%
      if(!rs.next()) break;
   }
   
}

%>

</table>
<br>
<center>
<input type="button" class="button" value="메인으로" onclick="location.href='restaurantMain.jsp'">
&nbsp;&nbsp;&nbsp;
<input type="button" class="button" value="로그아웃" onclick="location.href='logout.jsp'">
</center>
</body>
</html>