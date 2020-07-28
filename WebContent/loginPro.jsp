<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pknu.it.CustomerDB" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
System.out.println(id);
System.out.println(passwd);

CustomerDB dbpro = new CustomerDB();
int check = dbpro.userCheck(id,passwd);
//check==1 세션생성"id" 이동 main.jsp
//check==0 비밀번호틀림 뒤로이동
//check==-1 아이디없음 뒤로이동
System.out.println(check);
int roleCheck = dbpro.roleCheck(id);
//roleCheck==1 고객
//rolecheck==0 식당
System.out.println(roleCheck);
if(check==1 && roleCheck==1){
 session.setAttribute("id", id);
%>
 <script type="text/javascript">
 alert("로그인에 성공하였습니다 :)"); // 고객 로그인 성공
 location.href="customerMain.jsp";
 </script>
 <%
} else if(check==1 && roleCheck==0){
	 session.setAttribute("id", id);
	 %>
	 <script type="text/javascript">
	 alert("로그인에 성공하였습니다 :)"); // 식당 로그인 성공
	 location.href="restaurantMain.jsp";
	 </script>
	 <%
}else{
 %><script type="text/javascript">
 alert("아이디와 비밀번호를 다시 확인해주세요 :(");
 history.back();
 </script>
 <%
}
%>

</body>
</html>