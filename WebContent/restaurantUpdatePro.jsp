<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pknu.it.RestaurantDataBean" %>
<%@ page import="pknu.it.RestaurantDB" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="restaurant" class="pknu.it.RestaurantDataBean"/>
<jsp:setProperty property="*" name="restaurant"/>
<%
	RestaurantDB dbPro=new RestaurantDB();


int check=dbPro.updateRestaurant(restaurant);

if(check==1){
%>
 <script type="text/javascript">
 alert("수정완료");
 location.href="restaurantMain.jsp";
 </script>
 <%
}else{
 %>
 <script type="text/javascript">
 alert("비밀번호틀림");
 history.back();
 </script>
 <%
}
%>


</body>
</html>