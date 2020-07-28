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
<title>Insert title here</title>
</head>
<body style="background-color: #E6E6FA">

<%
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201712028", "201712028");

String r_no = request.getParameter("r_no");
String title = request.getParameter("title");
String price = request.getParameter("price");
System.out.println(price);
String sqlStr = "update menu set menu_price=? where restaurant_no = ? and menu_title=?";

PreparedStatement st = conn.prepareStatement(sqlStr);

st.setString(1, price);
st.setInt(2, Integer.parseInt(r_no));
st.setString(3, title);

ResultSet rs = st.executeQuery();

System.out.println(price);
%>
<div id="wrap">
<br><br><br><br>
<font size="5" color="gray">저장되었습니다.</font><br><br>
<input type="button" class="button" value="메뉴목록" onclick="location.href='menuInfo.jsp'">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="button" value="메인으로" onclick="location.href='restaurantMain.jsp'">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="button" value="로그아웃" onclick="location.href='logout.jsp'">
</div>


</body>
</html>