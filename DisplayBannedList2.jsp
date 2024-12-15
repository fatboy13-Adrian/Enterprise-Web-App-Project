<?xml version="1.0"?>
<%@page contentType="text/xml"%>
<?xml-stylesheet type='text/xsl' href = 'Admin.xsl'?>
<yrRoot>
<%  
	response.addHeader("Cache-Control", "no-cache");
	response.addHeader("Pragma", "no-cache");
	response.addHeader("Expires", "0");

	String sessID = (String)session.getAttribute("sessionid");

	if(sessID == null || sessID.equals(""))
	response.sendRedirect("AdministratorHomePage.jsp");

	else
	session.setAttribute("sessionid", sessID);	
%>


<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<H1>Banned List</H1>


<%
try
{
	String ban = request.getParameter("Banned");
	session.setAttribute("bn", ban);
	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:DSN_AdminDetails");

	Statement   s		=con.createStatement();
	ResultSet   rs		=s.executeQuery("select * from CustomerDetails where UserGroup = 'Banned'");

	while(rs.next())
	{
	%>
			
	<Admin>
		<UserName><%	out.print(rs.getString("UserName"));%></UserName>
		<IC><%	out.print(rs.getString("Ic_Number"));%></IC>
		<Amountowe><%	out.print(rs.getString("Amount_Owed"));%></Amountowe>
	</Admin>
	
<%
}
	rs.close();
	s.close();
	con.close();
}

catch(Exception e)
{
	out.print(e.toString());
}
%>
</yrRoot>

