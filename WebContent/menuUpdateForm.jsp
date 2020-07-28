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
table {
   margin-left: auto;
   margin-right: auto;
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
<title>메뉴수정</title>
</head>
<body  style="background-color: #E6E6FA">
<%

String title = request.getParameter("title");
String r_no = request.getParameter("r_no");
String price = request.getParameter("price");

%>
<div id="wrap">
<br><br><br>
<form action="./menuSaveForm.jsp" method="POST">
<table>
<tr><td id="title">메뉴명</td> <td><%=title %></td></tr> <br>
<input type="hidden"  name="title" value="<%=title%>">

<tr><td id="title">가격</td> <td><input type="text" name="price" value="<%=price %>"></td></tr> <br>
<tr> <td><input type="hidden"  name="r_no" value="<%=r_no%>"></td></tr>
<br>
</table>
<input type="submit" class="button" value="수정"> 
</form>

<form action="./menuDeleteForm.jsp" method="POST">
<input type="hidden"  name="title" value="<%=title%>">
<input type="hidden"  name="r_no" value="<%=r_no%>"> <br>
<input type="submit" class="button" value="삭제">
</form>
</div>
</body>
</html>