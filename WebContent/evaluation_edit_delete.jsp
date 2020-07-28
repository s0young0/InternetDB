<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<%request.setCharacterEncoding("utf-8");
 %>
 <html>
<head>
<title>Save~</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201712028", "201712028");

String e_no = request.getParameter("e_no");

String sqlStr = "delete evaluation where evaluation_no = ?";

PreparedStatement st = conn.prepareStatement(sqlStr);

st.setInt(1, Integer.parseInt(e_no));

ResultSet rs = st.executeQuery();


%>
<p>삭제 되었습니다.
<br><br><br>
<a href="./reservation.jsp">예약페이지 돌아가기</a><br><br>
<a href="./evaluation_check.jsp">식당 평가 목록보기</a><br>

</p>

</body>
</html>