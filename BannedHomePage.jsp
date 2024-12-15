<%  
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.addHeader("Expires","0"); 				//prevents caching at the proxyserver

	String sessID = (String)session.getAttribute("sessionid");

	if(sessID == null || sessID.equals(""))
	response.sendRedirect("LoginPage.jsp");
%>
<html>
<head>
<title>Banned Home Page</title>
<link rel="stylesheet" type="text/css" href="layout.css" />
</head>

<body>
<div class = "others">
<H3>Dear Customer</H3><br>
<img src = "Banned.jpg"		width = "300"		height = "150"><br>

<FORM ACTION = "../LoginPage.jsp" METHOD = "POST">
<INPUT TYPE  =  Submit		   VALUE  = "Log Out">
</FORM>
</div>
</body>
</html>