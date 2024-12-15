<?xml version="1.0"?>
<%@page contentType="text/xml"%>
<?xml-stylesheet type='text/xsl' href = 'Promotion.xsl'?>
<yrRoot>
<% 
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.addHeader("Expires","0"); 				//prevents caching at the proxyserver
	
	String sessID = (String)session.getAttribute("sessionid");
	
	if(sessID == null || sessID.equals(""))
	response.sendRedirect("DirectorHomePage.jsp");

	int promoGiftA = 0, promoGiftB = 0, promoGiftC = 0, promoGiftD = 0, NewPromo = 0, success = 0;
%>

<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.*"%>

<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:DSN_AdminDetails");

	Statement  s = con.createStatement();
	ResultSet rs = s.executeQuery("SELECT giftName, promotion_price FROM Gifts");

	while(rs.next())
	{
	%>
		<Gifts>
			<giftName><%	out.print(rs.getString("giftName"));%></giftName>
			<promo><%	out.print(rs.getInt("promotion_price"));%></promo>
		</Gifts>

	<%	
	}

	rs.close();
	s.close();
	con.close();
%>
</yrRoot>
<%
	String ChangegiftPromo = (String)session.getAttribute("ChangegiftPromo");

	if((Integer)session.getAttribute("NewPromo") != null)
	NewPromo = (Integer)session.getAttribute("NewPromo");

	if((Integer)session.getAttribute("UpdateSuccess") != null)
	success = (Integer)session.getAttribute("UpdateSuccess");

	if(success == 1)
	{
		out.print("Gift Discount Is Changed Successfully!!<br>");
		out.print("Gift Name: "+ChangegiftPromo+".");
		out.print("New Promo: "+NewPromo+".");
		success = 0;
	}
%>
