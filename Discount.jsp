<%
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.addHeader("Expires","0"); 				//prevents caching at the proxyserver

	String sessID = (String)session.getAttribute ("sessionid");

	if(sessID == null || sessID.equals (""))
	response.sendRedirect("DiscountHomePage.jsp");

	String giftName  = request.getParameter("giftName");
	int giftDiscount = Integer.parseInt(request.getParameter("giftDiscount"));
%>

<html>
<head>
<title>Discount</title>
<link rel="stylesheet" type="text/css" href="layout.css" />
</head>

<body>
<div class = "others">
<table>
<tr><td>Gfit Name:			</td> <td>	  <%= giftName %> </td></tr>
<tr><td>Current Discount: 		</td> <td><%= giftDiscount %>%</td></tr>
<tr><td>New Price Of Gift:	</td> 

<td>
<FORM ACTION = "DiscountLogic.jsp" method = "POST">
<INPUT TYPE = "text" 	NAME = "NewDiscount"/>
<INPUT TYPE = HIDDEN 	NAME = "giftName" 		VALUE = "<%= giftName%>"/>
<INPUT TYPE = HIDDEN 	NAME = "giftDiscount"	VALUE = "<%= giftDiscount%>"/>%
</td>
</tr>

<tr><td>					</td>
<td><INPUT TYPE = "Submit" 						VALUE = "Proceed"/></form>
</td>
</tr>
</table>
</div>
</body>
</html>