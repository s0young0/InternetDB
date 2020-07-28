<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>

<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201712028", "201712028");

String r_no = request.getParameter("r_no");
String title = request.getParameter("title");

String sqlStr = "delete menu where restaurant_no = ? and menu_title = ?";

PreparedStatement st = conn.prepareStatement(sqlStr);

st.setInt(1, Integer.parseInt(r_no));
st.setString(2, title);

ResultSet rs = st.executeQuery();

%>
<p>삭제 되었습니다.
<br><br><br>
<a href="./menuInfo.jsp">메뉴페이지 돌아가기</a><br><br>
</p>
<% response.sendRedirect("menuManage.jsp");%>
</body>
</html>


