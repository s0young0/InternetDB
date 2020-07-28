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

System.out.println(r_no);
System.out.println(r_menu);
System.out.println(e_data);
System.out.println(e_score);
System.out.println(r_name);

String searchQuery = "select max(evaluation_no) from evaluation";
PreparedStatement st3 = conn.prepareStatement(searchQuery);
ResultSet rs3 = st3.executeQuery();
      
String e_no = null;
while(rs3.next()){
   e_no = rs3.getString("max(evaluation_no)");
}

String sqlStr = "insert into evaluation values (?,?,?,?,?,?)";

PreparedStatement st = conn.prepareStatement(sqlStr);
st.setInt(1, Integer.parseInt(e_no)+1);
st.setInt(2, Integer.parseInt(r_no));
st.setString(3, r_menu);
st.setInt(4, Integer.parseInt(e_score));
st.setString(5, e_data);
st.setString(6, r_name);

ResultSet rs = st.executeQuery();


%>
<center>
<font size="5" color="gray">저장되었습니다.</font>
<br>
</p>
<input type="button" class="button" value="평가목록" onclick="location.href='evaluation_check.jsp'">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="button" value="로그아웃" onclick="location.href='logout.jsp'">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="button" value="예약페이지" onclick="location.href='reservation.jsp'">
</center>
</body>
</html>