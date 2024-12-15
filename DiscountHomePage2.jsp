<?xml version="1.0"?>
<%@page contentType="text/xml"%>
<?xml-stylesheet type='text/xsl' href = 'Discount.xsl'?>
<yrRoot>
<% 
	response.addHeader("Cache-Control", "no-cache");
	response.addHeader("Pragma", "no-cache");
	response.addHeader("Expires", "0");
	
	String sessID = (String)session.getAttribute("sessionid");
	
	if(sessID == null || sessID.equals(""))
	response.sendRedirect("LoginPage.jsp");

	int quantityGiftA = 0, quantityGiftB = 0, quantityGiftC = 0, quantityGiftD = 0, quantityAdded = 0, success = 0;
%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:DSN_AdminDetails");

	Statement  s = con.createStatement();
	ResultSet rs = s.executeQuery("SELECT giftName, quantity FROM Gifts WHERE top_ten='yes'");

	while(rs.next())
	{
	%>

	<Top10>
		<giftName><%	out.print(rs.getString("giftName"));%></giftName>
		<quantity><%	out.print(rs.getInt("quantity"));%></quantity>
		
	</Top10>
<%
	}

	rs.close();
	s.close();
	con.close();
%>
</yrRoot>
