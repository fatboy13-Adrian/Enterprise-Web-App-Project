<?xml version="1.0"?>
<%@page contentType="text/xml"%>
<?xml-stylesheet type='text/xsl' href = 'customer.xsl'?>
<yrRoot>
<%
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); //HTTP 1.0
	response.addHeader("Expires","0"); //prevents caching at the proxyserver
	String sessID = (String)session.getAttribute ( "sessionid" );
	if( sessID==null|| sessID.equals ("") )
	response.sendRedirect ( "LoginPage.jsp" );

	int purchaseGiftA = 0, purchaseGiftB = 0, purchaseGiftC = 0, purchaseGiftD = 0,quantityAdded = 0, success = 0;

	String UserName = (String)session.getAttribute("UserName");
	String password = (String)session.getAttribute("Password");
%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:DSN_AdminDetails");

	Statement   s  = con.createStatement();
	ResultSet   rs = s.executeQuery("SELECT giftName, purchases FROM Gifts");

	while(rs.next())
	{
	%>
		
		<Customer>
			<giftName><%	out.print(rs.getString("giftName"));%></giftName>
			<purchases><%	out.print(rs.getString("purchases"));%></purchases>
		</Customer>
<%
	}

	rs.close();
	s.close();
	con.close();
%>
</yrRoot>

