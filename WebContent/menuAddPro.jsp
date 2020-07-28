<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
    
<%@ page import="pknu.it.RestaurantDataBean"%>
<%@ page import="pknu.it.RestaurantDB"%>

<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #E6E6FA">
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201712028", "201712028");

String title = request.getParameter("title");
String price = request.getParameter("price");
String id=(String)session.getAttribute("id");
int r_no = 0;
if(title=="" || price==""){
	   %><script type="text/javascript">alert("모든 항목을 채워주세요"); history.go(-1);</script>
	<% } else{
if(id != null){
	   String sqlStr1 = "select * from Restaurant where id=?";
	   PreparedStatement st1 = conn.prepareStatement(sqlStr1);
	   st1.setString(1, id);
	   ResultSet rs1 = st1.executeQuery();
	   while(rs1.next()){
		   r_no = rs1.getInt("restaurant_no");
	   }
	}

System.out.println(r_no);

String sqlStr = "insert into menu values(?,?,?)";
PreparedStatement st = conn.prepareStatement(sqlStr);

st.setInt(1, r_no);
st.setString(2,title);
st.setString(3,price);


ResultSet rs = st.executeQuery();

%>
<form method="post" action="./menuSaveForm.jsp">
<font size="5" color="5">추가되었습니다.</font>
</form>
<br>
<% response.sendRedirect("menuManage.jsp");}%>
</body>
</html>