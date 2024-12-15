<%@ page import="myjsp.CustBean"%>

<%  
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.addHeader("Expires","0");				//prevents caching at the proxyserver

	String sessID = (String)session.getAttribute("sessionid");

	if(sessID == null || sessID.equals(""))
	response.sendRedirect("AdministratorHomePage.jsp");
%>


<html>
<head><title>Update Admin Details</title>
</head>
<body>
<H2>Please Type The Following Customer's Data You Want To Update</H2>
		
<FORM ACTION = "UpdateData.jsp"		METHOD="POST">
<br>User Name:  <INPUT TYPE = TEXT 		NAME ="UserNsme" />
<br>User Group: <INPUT TYPE = TEXT 		NAME ="UserGroup" />
<br>Password:   <INPUT TYPE = PASSWORD 	NAME = "Password" />
<br> <INPUT TYPE=Submit VALUE="Confirm" />
</FORM>
</body>
</html>   