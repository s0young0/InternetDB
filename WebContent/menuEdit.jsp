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
String title = request.getParameter("title");
String price = request.getParameter("price");

Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201712028", "201712028");

String id=(String)session.getAttribute("id");
int r_no = 0;


if(id != null){
	   String sqlStr1 = "select * from Restaurant where id=?";
	   PreparedStatement st1 = conn.prepareStatement(sqlStr1);
	   st1.setString(1, id);
	   ResultSet rs1 = st1.executeQuery();
	   while(rs1.next()){
		   r_no = rs1.getInt("restaurant_no");
	   }
	}



String sqlStr = "insert into menu values(?,?,?)";
PreparedStatement st = conn.prepareStatement(sqlStr);

st.setInt(1, r_no);
st.setString(2,title);
st.setString(3,price);


ResultSet rs = st.executeQuery();

%>
수정되었습니다. <br>

</body>
</html>