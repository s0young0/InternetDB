<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Reservation Evaluation!!</title>
</head>
<body style="background-color: #E6E6FA">
<%
String r_no = request.getParameter("r_no");
String r_menu = request.getParameter("r_menu");
String r_name = request.getParameter("r_name");

%>
<center>
<form action="./evaluation_save.jsp" method="POST">
<br>
<font size="5" color="gray"><%=r_name%> 평가하기</font><br><br>
<font size="5" color="gray">예약한 메뉴 : <%=r_menu%></font> <br>
<font size="10" color="yellow">★</font> : <select name="e_score">
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
</select><br><br>
<input type="text" name="e_data" placeholder="평가를 입력해주세요*^0^*" style="width:300px;height:100px;font-size:15px;maxlength=255">
<br><br>


<input type="hidden"  name="r_no" value="<%=r_no%>">
<input type="hidden"  name="r_menu" value="<%=r_menu%>">
<input type="hidden"  name="r_name" value="<%=r_name%>">

<input type="submit" class="button" value="평가 저장">
</form>
</center>
</body>
</html>