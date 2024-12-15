<%  
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.addHeader("Expires","0");				//prevents caching at the proxyserver

	String sessID = (String)session.getAttribute("sessionid");

	if(sessID == null || sessID.equals(""))
	response.sendRedirect("AdministratorHomePage.jsp");

	else
	session.setAttribute("sessionid", sessID);	
%>

<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.*"%>

<html>
<head>
<title>Display Banned List</title>
</head>

<body bgcolor = "#C0C0C0">
<H3>Banned List</H3>
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
			out.print("<br/>User Name  : "+rs.getString("UserName"));
			out.print("<br/>Ic Number  : "+rs.getString("Ic_Number"));
			out.print("<br/>Amount Owed: "+rs.getString("Amount_Owed"));
			out.print("<br/>");
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

<FORM ACTION = "AdministratorHomePage.jsp"	METHOD = "POST">
<INPUT TYPE  =  Submit						VALUE  = "Back To Administrator Home Page">
</FORM>

<FORM ACTION = "DisplayBannedList2.jsp"	METHOD = "POST">
<INPUT TYPE  =  Submit						VALUE  = "Display">
</FORM>

<FORM ACTION = "../LoginPage.jsp" METHOD="POST">
<INPUT TYPE  =  Submit		   VALUE="Log Out">
</FORM>
</body>
</html>