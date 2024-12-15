<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%@ page import = "myjsp.CustBean"%>
<jsp:useBean id = "custbean"		scope = "session"			class = "myjsp.CustBean"/>
<jsp:setProperty name = "custbean"  property = "*"/> 


<%
     String uname = custbean.getUserName();
	 String pwd	  = custbean.getPassword();
	 String ugrp  = custbean.getUserGroup();

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:DSN_AdminDetails");

	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("ddMMyyyy");
	int date = Integer.valueOf(sdf.format(new java.util.Date()));

	Statement s = con.createStatement();
	int  status = s.executeUpdate("UPDATE AdminDetails SET Password='"+pwd+"', UserGroup='"+ugrp+"' WHERE UserName='"+uname+"'");

	s.close();
	con.close();
	response.sendRedirect("AdministratorHomePage.jsp");
%>