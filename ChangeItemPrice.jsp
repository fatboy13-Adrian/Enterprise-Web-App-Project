<%
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.addHeader("Expires","0"); 				//prevents caching at the proxyserver

	String sessID = (String)session.getAttribute ("sessionid");

	if(sessID==null || sessID.equals (""))
	response.sendRedirect("SalesClerkHomePage.jsp");

	String giftName = request.getParameter("giftName");
	int giftPrice   = Integer.parseInt(request.getParameter("giftPrice"));
%>

<html>
<head>
<title>Change Item Price</title>
<link rel="stylesheet" type="text/css" href="layout.css" />
</head>

<body>
<div class = "others">
<table>
<tr><td>Gfit Name:			</td> <td><%= giftName %> </td></tr>
<tr><td>Current Price: 		</td> <td><%= giftPrice %></td></tr>
<tr>
<td>New Price Of Gift: $	</td> 
<td>
<FORM ACTION ="ItemLogic.jsp" method = "POST">
<INPUT TYPE = "text" 	NAME = "NewPrice"/>
<INPUT TYPE = HIDDEN 	NAME = "giftName" 		VALUE = "<%= giftName%>"/>
<INPUT TYPE = HIDDEN 	NAME = "giftPrice"		VALUE = "<%= giftPrice%>"/>
</td>
</tr>

<tr><td>					</td>
<td>
<INPUT TYPE = "Submit" 						VALUE = "Proceed"/></FORM>
</td>
</tr>
</table>
</div>
</body>
</html>