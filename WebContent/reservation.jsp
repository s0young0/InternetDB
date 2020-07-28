<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<%request.setCharacterEncoding("utf-8");
 %>
<html>
<head>
<style>
h1 {text-align: center;}
h2 {text-align: center;}
input {text-align: center;}
a { text-decoration:none } 
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
<title>예약</title>
</head>
<body style="background-color: #E6E6FA">

<h1>식당 예약</h1>
<table style="border:1px solid skyblue;width:60%;height:100px;margin:auto;text-align:center;">
	<tr><th> 식당이름  <th> 식당주소 <th> 식당번호 <th> 음식종류 <th> 테이블수  </tr>
<%

Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201712028", "201712028");

String id=(String)session.getAttribute("id");
int customer_no = 0;

if(id != null){
	   String sqlStr1 = "select * from Customer where id=?";
	   PreparedStatement st1 = conn.prepareStatement(sqlStr1);
	   st1.setString(1, id);
	   ResultSet rs1 = st1.executeQuery();
	   while(rs1.next()){
		   customer_no = rs1.getInt("customer_no");
	   }
	}
String people = request.getParameter("people");
String r_date = request.getParameter("r_date");
if(people=="" || r_date==""){
	   %><script type="text/javascript">alert("모든 항목을 채워주세요"); history.go(-1);</script>
	<% } else{
String [] m_name = request.getParameterValues("m_name");
String [] menu_no = request.getParameterValues("count");

if(m_name!=null && menu_no!=null){
String [] m_price = new String [m_name.length];

for(int i=0;i<m_name.length;i++){
   String searchQuery = "select menu_price from menu where menu_title=?";
   PreparedStatement st2 = conn.prepareStatement(searchQuery);
   st2.setString(1, m_name[i]);
   ResultSet rs2 = st2.executeQuery();
   while(rs2.next()){
      m_price[i] = rs2.getString("menu_price");
   }
}

String r_num = request.getParameter("r_no");


String searchQuery = "select max(reservation_no) from reservation";
PreparedStatement st3 = conn.prepareStatement(searchQuery);
ResultSet rs3 = st3.executeQuery();
      
String r_no = null;
while(rs3.next()){
   r_no = rs3.getString("max(reservation_no)");
}
if(m_price != null&&m_name != null && m_name.length >= 1 && people != null && r_no != null &&r_date!=null&&r_num!=null){
	for(int i=0;i<m_name.length;i++){
	
		String sqlStr2 = "insert into reservation values(?,?,?,?,?,?,?)";
		PreparedStatement st2 = conn.prepareStatement(sqlStr2);

		st2.setInt(1, Integer.parseInt(r_no)+1);
		st2.setString(2, r_date);
		st2.setInt(3, Integer.parseInt(people));
		st2.setString(4, m_name[i]);
		st2.setInt(5, customer_no);
		st2.setInt(6,Integer.parseInt(r_num));
		st2.setInt(7, Integer.parseInt(m_price[i])*Integer.parseInt(menu_no[i]));

		ResultSet rs2 = st2.executeQuery();

	}
	
}

}

String sqlStr = "select * from Restaurant";

PreparedStatement st = conn.prepareStatement(sqlStr);
ResultSet rs = st.executeQuery();


while(rs.next()){
	String r_name = rs.getString("restaurant_name");
	String r_number = rs.getString("restaurant_no");
	String r_addr = rs.getString("restaurant_addr");
	String r_tel = rs.getString("restaurant_tel_no");
	String r_class = rs.getString("restaurant_class");
	String r_table_no = rs.getString("restaurant_table_no");
	%>
	<tr> <td><p><a href="./menu_reservation.jsp?r_number=<%=r_number%>"><%=r_name%></a></p> <td> <%=r_addr%> <td> <%=r_tel%> <td> <%=r_class%> <td> <%=r_table_no%></tr>
	<%
}}
%>
<center>
<input type="button" class="button" value="예약확인" onclick="location.href='reservation_check.jsp'">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="button" value="메인으로" onclick="location.href='customerMain.jsp'">
&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" class="button" value="평가목록" onclick="location.href='evaluation_check.jsp'"></center> <br>
</table>
</body>
</html>