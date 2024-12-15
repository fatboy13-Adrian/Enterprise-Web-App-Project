<%
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.addHeader("Expires","0"); 				//prevents caching at the proxy server

	String sessID = request.getParameter( "SessionId" );

	if(sessID==null || sessID.equals(""))
	response.sendRedirect("DiscountHomePage.jsp");

	else
	session.setAttribute ( "sessionid", sessID );

	String giftName  = request.getParameter("giftName");
	int giftDiscount = Integer.parseInt(request.getParameter("giftDiscount"));
	int NewDiscount  = Integer.parseInt(request.getParameter("NewDiscount"));
%>

<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.*"%>

<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:DSN_AdminDetails");

	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("ddMMyyyy");
	int date = Integer.valueOf(sdf.format(new java.util.Date()));
	
	Statement s = con.createStatement();
	int status  = s.executeUpdate("Update Gifts SET discount="+NewDiscount+" where giftName='"+giftName+"'");
	
	if(status > 0)
	System.out.println("Update Is Successful");
	
	else
	System.out.println("Error!!!");
		
	s.close();
	con.close();
%>

<FORM ACTION = "DiscountHomePage.jsp" METHOD = "POST">
<INPUT TYPE  = Submit 				  VALUE = "Log Out"/>
</FORM>