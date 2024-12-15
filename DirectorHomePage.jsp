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
<title>Director Home Page</title>
<link rel="stylesheet" type="text/css" href="layout.css" />
</head>

<body>
<H1>Welcome to Director Home Page</H1>
<H2>Make Your Choice (Discount / Promotion): </H2>

<FORM ACTION = "DiscountHomePage.jsp" METHOD = "POST">
<INPUT TYPE  =  Submit		   VALUE  = "Discount Home Page">
</FORM>

<FORM ACTION = "PromotionHomePage.jsp" METHOD = "POST">
<INPUT TYPE  =  Submit		   VALUE  = "Promotion Home Page">
</FORM>

<FORM ACTION = "../LoginPage.jsp" 	METHOD = "POST">
<INPUT TYPE  =  Submit		   VALUE  = "Log Out">
</FORM>


</body>
</html>