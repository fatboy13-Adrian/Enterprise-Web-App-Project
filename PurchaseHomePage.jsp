<%
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.addHeader("Expires","0"); 				//prevents caching at the proxyserver

	String sessID = (String)session.getAttribute ("sessionid");

	if(sessID==null || sessID.equals (""))
	response.sendRedirect("CustomerHomePage.jsp");

	String giftName  = request.getParameter("giftName");
	int giftPurchase = Integer.parseInt(request.getParameter("giftPurchase"));
	int giftQuantity = Integer.parseInt(request.getParameter("giftQuantity"));
%>
<html>
<head>
<title>Purchase Home Page</title>
<link rel="stylesheet" type="text/css" href="layout.css" />
</head>

<body>
<div class = "others">
<table>
<tr><td>Gfit Name:			</td> <td><%= giftName %> </td></tr>
<tr><td>Current Purchases: 		</td><td><%=giftPurchase%></td></tr>
<tr><td>Current Quantity:		</td><td><%=giftQuantity%></td></tr>
<tr>
<td>Purchase Gift:	</td>
<td>
<FORM ACTION = "PurchaseLogic.jsp" METHOD="POST">
<INPUT TYPE = "text" name = "addQuantity"/>
<INPUT TYPE = HIDDEN name = "giftQuantity" 		VALUE = "<%= giftQuantity%>"/>
<INPUT TYPE = HIDDEN name = "giftName" 		VALUE = "<%= giftName%>"/>
<INPUT TYPE = HIDDEN name = "giftPurchase"	VALUE = "<%= giftPurchase%>"/>
</td>
</tr>

<tr><td>					</td>
<td>
<INPUT TYPE = "Submit" 					VALUE = "Proceed"/>
</FORM>
</td>
</tr>
</table>
</body>
</div>
</html>