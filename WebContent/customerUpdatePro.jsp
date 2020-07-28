<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pknu.it.CustomerDataBean" %>
<%@ page import="pknu.it.CustomerDB" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정및확인</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="customer" class="pknu.it.CustomerDataBean"/>
<jsp:setProperty property="*" name="customer"/>
<%
	CustomerDB dbPro=new CustomerDB();

int check=dbPro.updateCustomer(customer);
if(check==1){
%>
 <script type="text/javascript">
 alert("수정완료");
 location.href="customerMain.jsp";
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