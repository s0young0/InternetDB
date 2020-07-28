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
<jsp:setProperty property="*" name="restaurant" />
아이디:<jsp:getProperty property="id" name="restaurant"/><br>
패스워드:<jsp:getProperty property="pwd" name="restaurant"/><br>
식당이름:<jsp:getProperty property="name" name="restaurant"/><br>
전화번호:<jsp:getProperty property="tel" name="restaurant"/><br>
주소:<jsp:getProperty property="address" name="restaurant"/><br>
식당구분:<%=restaurant.getRclass()%><br>
좌석수:<jsp:getProperty property="table" name="restaurant"/><br>
<%
	String id = restaurant.getId();
RestaurantDB dbPro = new RestaurantDB();
int idCheck = dbPro.idCheck(id); //idCheck==0 존재하는 아이디, ==1 없는 아이디
System.out.println(idCheck);
if(restaurant.getId()==null || restaurant.getPwd()==null || restaurant.getName()==null || restaurant.getTel()==null
||restaurant.getAddress()==null || restaurant.getTable()<=0 || restaurant.getRclass()==null ){
%><script type="text/javascript">alert("모든 항목을 입력해주세요."); location.href="restaurantInsertForm.jsp";</script>
<% } else{
if(idCheck==0){
	%><script type="text/javascript">
	alert("이미 존재하는 아이디입니다.");
	location.href="restaurantInsertForm.jsp";
	</script><%
} else if(idCheck==1){
dbPro.insertRestaurant(restaurant);

%><script type="text/javascript">
 alert("회원가입 성공!!");
 location.href="loginForm.jsp";
 </script><%}}
%>

</body>
</html>