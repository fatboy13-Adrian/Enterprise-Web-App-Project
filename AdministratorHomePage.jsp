<%  
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.addHeader("Expires","0");				//prevents caching at the proxyserver

	String sessID = (String)session.getAttribute("sessionid");

	if(sessID == null || sessID.equals(""))
	response.sendRedirect("LoginPage.jsp");
%>

<html>
<head>
<title>Administrator Home Page</title>
<link rel="stylesheet" type="text/css" href="layout.css" />
</head>

<body>
<H1>Welcome to Administrator Home Page</H1>

<img src = "Administrator.jpg"	width = "300"	height = "300"/><br>

<FORM ACTION = "DisplayBannedList2.jsp" METHOD = "POST">
<INPUT TYPE  =  Submit		   		   VALUE  = "Display Banned List">
</FORM>

<FORM ACTION = "UpdateAdminDetails.jsp" METHOD = "POST">
<INPUT TYPE  =  Submit		   		   VALUE  = "Update Customer Details">
</FORM>

<FORM ACTION = "../LoginPage.jsp" METHOD = "POST">
<INPUT TYPE  =  Submit		   VALUE  = "Log Out">
</FORM>
</body>
</html>