<?xml version="1.0"?>
<%@page contentType="text/xml"%>
<?xml-stylesheet type='text/xsl' href = 'giftPrice.xsl'?>

<yrRoot>
<% 
	response.addHeader("Cache-Control", "no-cache");
	response.addHeader("Pragma", "no-cache");
	response.addHeader("Expires", "0");
	
	String sessID = (String)session.getAttribute("sessionid");
	
	if(sessID == null || sessID.equals(""))
	response.sendRedirect("LoginPage.jsp");

	int priceGiftA = 0, priceGiftB = 0, priceGiftC = 0, priceGiftD = 0, NewPrice = 0, success = 0;
%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:DSN_AdminDetails");

	Statement  s = con.createStatement();
	ResultSet rs = s.executeQuery("SELECT giftName, quantity FROM Gifts ORDER BY 'quantity' DESC");

	while(rs.next())
	{
	%>
	
	<Gifts>
		<giftName><%	out.print(rs.getString("giftName"));%></giftName>
		<quantity><%	out.print(rs.getInt("quantity"));%></quantity>
	</Gifts>
<%
	}

	rs.close();
	s.close();
	con.close();
%>

</yrRoot>
<%
	String ChangeGiftPrice = (String)session.getAttribute("ChangeGiftPrice");

	if((Integer)session.getAttribute("NewPrice") != null)
	NewPrice = (Integer)session.getAttribute("NewPrice");

	if((Integer)session.getAttribute("UpdateSuccess") != null)
	success = (Integer)session.getAttribute("UpdateSuccess");

	if(success==1)
	{
		out.print("Top Up is Successful!!<br>");
		out.print("Gift Name: "+ChangeGiftPrice+".");
		out.print("New Price: "+NewPrice+".");
		success = 0;
	}
%>



