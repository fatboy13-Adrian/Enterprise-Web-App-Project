<%
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.addHeader("Expires","0"); 				//prevents caching at the proxyserver

	String sessID = (String)session.getAttribute ("sessionid");

	if(sessID == null || sessID.equals (""))
	response.sendRedirect("PromotionHomePage.jsp");

	String giftName  = request.getParameter("giftName");
	int giftPromo = Integer.parseInt(request.getParameter("giftPromo"));
%>

<html>
<head>
<title>Promotion</title>
<link rel="stylesheet" type="text/css" href="layout.css" />
</head>

<body>
<div class = "others">
<table>
<tr><td>Gfit Name:			</td> <td>	  <%= giftName %> </td></tr>
<tr><td>Current Promotional Price: $ 	</td> <td><%= giftPromo %></td></tr>
<tr><td>New Promotional Price: $		</td> 

<td><FORM ACTION = "PromotionLogic.jsp" method = "POST">
<INPUT TYPE = "text" 	name = "NewPromo"/>
<INPUT TYPE = HIDDEN 	name = "giftName" 		VALUE = "<%= giftName%>"/>
<INPUT TYPE = HIDDEN 	name = "giftPromo"		VALUE = "<%= giftPromo%>"/>
</td>
</tr>

<tr><td>					</td>
<td><INPUT TYPE = "Submit" 						VALUE = "Proceed"/></FORM>
</td>
</tr>
</table>
</div>
</body>
</html>