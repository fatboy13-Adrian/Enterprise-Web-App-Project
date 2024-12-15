<%  
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.addHeader("Expires","0"); 				//prevents caching at the proxyserver
	session.invalidate();
%>

<html>
<head>
<title>Welcome To Gifts For You</title>
<link rel = "stylesheet" type = "text/css" href = "layout.css"/>
</head>

<body>
<div class = "content">
<table border = "1">
<tr>
<td>
<img src = "loginPage.jpg"		width = "300"	height = "300"><br>
<H1>Please sign in:</H1>
<FORM ACTION = "LoginControl.jsp" 		METHOD = "POST">
<Table>
<tr>
<td>User Name: </td>
<td><INPUT TYPE = TEXT		NAME = "UserName"/></td>
<tr>
<tr>
<td>Password: </td>
<td><INPUT TYPE  = PASSWORD	NAME = "Password"/></td>
</tr>
</tr>	
<tr>	
<td><INPUT TYPE = HIDDEN	NAME = "SessionId"	VALUE = "1234"	/> </td>
<td><INPUT TYPE = SUBMIT						VALUE = "Log In"/></td>
</tr>
</Table>
</FORM>	
</td>
</tr>
</tr>
</div>
</body>
</html>
