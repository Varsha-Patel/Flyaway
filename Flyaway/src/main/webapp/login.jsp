<%@page import="com.airline.login.Login"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



	<%
	Login login = new Login();

	String loginType = request.getParameter("loginType");
	if (loginType.equals("USER")) {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Boolean userValidate = login.personLogin(loginType, username, password);
		if (userValidate == true) {
			
			
			
			/* request.getSession().setAttribute("userEmail", userEmail); */
			
			
			
			
			session.setAttribute("username", username);
			response.sendRedirect("flightSearch.jsp");
		} else {
			response.sendRedirect("userLogin.jsp");
		}

	} else {
	
		String username = request.getParameter("adminuser");
		String password = request.getParameter("adminpassword");
		Boolean adminValidate = login.personLogin(loginType, username, password);
		if (adminValidate == true) {
			/* session.setAttribute("adminEmail", adminEmail); */
			session.setAttribute("adminuser", username);
			response.sendRedirect("changePassword.jsp");
			
		} else {
			response.sendRedirect("adminLogin.jsp");
		}
		}
	
	%>

</body>
</html>