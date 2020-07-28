<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pknu.it.CustomerDataBean" %>
<%@ page import="pknu.it.CustomerDB" %>
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
<jsp:useBean id="customer" class="pknu.it.CustomerDataBean"/>
<jsp:setProperty property="*" name="customer" />
아이디:<jsp:getProperty property="id" name="customer"/><br>
패스워드:<jsp:getProperty property="pwd" name="customer"/><br>
닉네임:<jsp:getProperty property="name" name="customer"/><br>
전화번호:<jsp:getProperty property="tel" name="customer"/><br>
<%
	CustomerDB dbPro = new CustomerDB();

String id = customer.getId();
int idCheck = dbPro.idCheck(id); //idCheck==0 존재하는 아이디, ==1 없는 아이디

if(customer.getId()==null || customer.getPwd()==null || customer.getName()==null || customer.getTel()==null){
%><script type="text/javascript">alert("모든 항목을 입력해주세요."); location.href="customerInsertForm.jsp";</script>
<% } else{
	if(idCheck==0){
		%><script type="text/javascript">
		alert("이미 존재하는 아이디입니다.");
		location.href="customerInsertForm.jsp";
		</script><%
	} else if(idCheck==1){
			dbPro.insertCustomer(customer);
			%><script type="text/javascript">
	 		alert("회원가입 되었습니다.");
	 		location.href="loginForm.jsp";
	 		</script><%
		} 
} %>


</body>
</html>