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
<meta charset="UTF-8">
<title>Evaluation Edit!</title>
</head>
<body style="background-color: #E6E6FA">
<br>
<%


Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@db.pknu.ac.kr:1521:xe", "db201712028", "201712028");

String e_no = request.getParameter("e_no");

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


String sqlStr = "select * from Evaluation natural join reservation where evaluation_no=?";

PreparedStatement st = conn.prepareStatement(sqlStr);
st.setInt(1, Integer.parseInt(e_no));
ResultSet rs = st.executeQuery();
while(rs.next()){
   int c_no = rs.getInt("customer_no");
   if(c_no != customer_no){
      %>본인이 작성한 글만 수정할 수 있습니다. <%
   }
   else{
      String r_no = rs.getString("reservation_no");
      String r_menu = rs.getString("reservation_menu");
      String e_score = rs.getString("evaluation_score");
      String e_data = rs.getString("evaluation_data");
      
      String r_name = rs.getString("restaurant_name");
      
      %>
<form action="./evaluation_edit_save.jsp" method="POST">
<center>
<font size="5" color="gray"><%=r_name%> 평가하기</font><br><br>
<font size="5" color="gray">예약한 메뉴 : <%=r_menu%></font><br><br>
<font size="10" color="yellow">★</font> : <select name="e_score">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
</select><br><br>
<input type="text" name="e_data" value="<%=e_data %>" style="width:300px;height:100px;font-size:15px;maxlength=255">
<br><br>


<input type="hidden"  name="r_no" value="<%=r_no%>">
<input type="hidden"  name="r_menu" value="<%=r_menu%>">
<input type="hidden"  name="r_name" value="<%=r_name%>">
<input type="hidden"  name="e_no" value="<%=e_no%>">

<input type="submit" class="button" value="평가 저장"> <br><br>  
</form>
<form action="./evaluation_edit_delete.jsp">

<input type="hidden"  name="e_no" value="<%=e_no%>">
<input type="submit" class="button" value="삭제하기">
</form>
<br></center>      
      <%

   }
}
%>


</body>
</html>