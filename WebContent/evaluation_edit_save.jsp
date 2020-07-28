<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
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
<title>Save~</title>
</head>
<body style="background-color: #E6E6FA">
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201712028", "201712028");

String r_no = request.getParameter("r_no");
String r_menu = request.getParameter("r_menu");
String e_data = request.getParameter("e_data");
String e_score = request.getParameter("e_score");
String r_name = request.getParameter("r_name");
String e_no = request.getParameter("e_no");

String sqlStr = "update evaluation set reservation_no=?,reservation_menu=?,evaluation_score=?,evaluation_data=?,restaurant_name=? where evaluation_no = ?";

PreparedStatement st = conn.prepareStatement(sqlStr);
st.setInt(1, Integer.parseInt(r_no));
st.setString(2, r_menu);
st.setInt(3, Integer.parseInt(e_score));
st.setString(4, e_data);
st.setString(5, r_name);
st.setInt(6, Integer.parseInt(e_no));

ResultSet rs = st.executeQuery();


%>
<br>
<center>
<font size="5" color="gray">저장 되었습니다.</font>
<br><br>
<form action="./reservation.jsp" method="POST">

<input type="submit" class="button" value="예약페이지 돌아가기"> <br><br>  
</form>
<form action="./evaluation_check.jsp" method="POST">

<input type="submit" class="button" value="식당 평가 목록보기"> <br><br>  
</form>

</center>
</body>
</html>