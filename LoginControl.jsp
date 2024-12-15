<%
	response.addHeader("Cache-Control", "no-cache");
	response.addHeader("Pragma", "no-cache");
	response.addHeader("Expires", "0");

	String sessID = (String)request.getParameter("SessionId");

	if(sessID == null || sessID.equals(""))
		response.sendRedirect("LoginPage.jsp");

	else
		session.setAttribute("sessionid", sessID);		
%>

<%@ page import = "myjsp.LoginBean"%>
<jsp:useBean id = "loginbean"		scope="session"			class="myjsp.LoginBean"/>

<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.*"%>

<%
try
{
     String uname = request.getParameter("UserName");
	 String pwd	  = request.getParameter("Password");

	 session.setAttribute("name", uname);
	 session.setAttribute("pw" ,  pwd  );		

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:DSN_AdminDetails");

	Statement  s = con.createStatement();
	ResultSet rs = s.executeQuery("select * from AdminDetails where UserName='"+uname+"' ");

	while(rs.next()) 
	{
		String s1 = rs.getString("UserName");
		String s2 = rs.getString("Password");
		String s3 = rs.getString("UserGroup");
	
		if(uname.equals(s1) && pwd.equals(s2))
		{
			if(s3.equals("Administrator"))
			response.sendRedirect("Admin/AdministratorHomePage.jsp");

			else if(s3.equals("Banned"))
			response.sendRedirect("Customer/BannedHomePage.jsp");

			else if(s3.equals("Customer"))
			response.sendRedirect("Customer/CustomerHomePage.jsp");

			else if(s3.equals("Director"))
			response.sendRedirect("Director/DirectorHomePage.jsp");

			else if(s3.equals("Sales Clerk"))
			response.sendRedirect("SalesClerk/SalesClerkHomePage.jsp");
			
			else if(s3.equals("Special Customer"))
			response.sendRedirect("SpecialCustomer/SpecialCustomerHomePage.jsp");

			else
			response.sendRedirect("Warehouse/WarehouseSupervisorHomePage.jsp");
		}
		else 
		response.sendRedirect("LoginPage.jsp");
	}
	response.sendRedirect("LoginPage.jsp");
 	rs.close();
	s.close();
 	con.close();
}
catch(Exception e)
{
	out.print(e.toString());
}
%>

<FORM ACTION = "LoginPage.jsp"	METHOD = "POST">
<INPUT TYPE  =  SUBMIT			VALUE  = "Log Out"/>
</FORM>	