<% 
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.addHeader("Expires","0"); 				//prevents caching at the proxyserver

	String sessID = (String)session.getAttribute("sessionid");

	if(sessID == null || sessID.equals(""))
	response.sendRedirect("LoginPage.jsp");

	int priceGiftA = 0, priceGiftB = 0, priceGiftC = 0, priceGiftD = 0, NewPrice = 0, success = 0;
%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:DSN_AdminDetails");

	Statement  s = con.createStatement();
	ResultSet rs = s.executeQuery("SELECT giftName, price FROM Gifts");

	while(rs.next())
	{
		String giftName = rs.getString("giftName");

		if(giftName.equals("giftA"))
		priceGiftA = rs.getInt("price");

		if(giftName.equals("giftB"))
		priceGiftB = rs.getInt("price");

		if(giftName.equals("giftC"))
		priceGiftC = rs.getInt("price");

		if(giftName.equals("giftD"))
		priceGiftD = rs.getInt("price");
	}

	rs.close();
	s.close();
	con.close();
%>

<%
	String ChangeGiftPrice = (String)session.getAttribute("ChangeGiftPrice");

	if((Integer)session.getAttribute("NewPrice") != null)
	NewPrice = (Integer)session.getAttribute("NewPrice");

	if((Integer)session.getAttribute("UpdateSuccess") != null)
	success = (Integer)session.getAttribute("UpdateSuccess");

	if(success == 1)
	{
		out.print("Top Up is Successful!!<br>");
		out.print("Gift Name: "+ChangeGiftPrice+".");
		out.print("New Price: "+NewPrice+".");
		success = 0;
	}
%>
<html>
<head>
<title>Sales Clerk Home Page </title>
<link rel="stylesheet" type="text/css" href="layout.css" />
</head>

<body>
<div class = "content">
<H1>Welcome To Sales Clerk Home Page</H1>
<H2>Current Price Of Each Gift:</H2>

<table border = "1">
<tr>
<td><img src = "giftA.jpg" width = "200" height = "200"></td>	
<td>
<FORM ACTION = "ChangeItemPrice.jsp"		METHOD = "POST">
<INPUT TYPE = HIDDEN		NAME = "giftName"			VALUE = "giftA"/>
<INPUT TYPE = HIDDEN		NAME = "giftPrice"			VALUE = "<%=priceGiftA%>"/>
</td>
<td>&nbsp&nbsp&nbsp&nbsp Current Price: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>	<td>$<%= priceGiftA%>
<td><INPUT TYPE = "submit" value = "Change Price Of Gift A"/></td>
</FORM>
</td>
</tr>

<tr>
<td><img src = "giftB.jpg" width = "200" height = "200"></td>	
<td>
<FORM ACTION = "ChangeItemPrice.jsp"		METHOD = "POST">
<INPUT TYPE = HIDDEN		NAME = "giftName"			VALUE = "giftB"/>
<INPUT TYPE = HIDDEN		NAME = "giftPrice"			VALUE = "<%=priceGiftB%>"/>
</td>
<td>&nbsp&nbsp&nbsp&nbsp Current Price: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>	<td>$<%= priceGiftB%>
<td><INPUT TYPE = "submit" value = "Change Price Of Gift B"/></td>
</FORM>
</td>
</tr>

<tr>
<td><img src = "giftC.jpg" width = "200" height = "200"></td>	
<td>
<FORM ACTION = "ChangeItemPrice.jsp"		METHOD = "POST">
<INPUT TYPE = HIDDEN		NAME = "giftName"			VALUE = "giftC"/>
<INPUT TYPE = HIDDEN		NAME = "giftPrice"			VALUE = "<%=priceGiftC%>"/>
</td>
<td>&nbsp&nbsp&nbsp&nbsp Current Price: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>	<td>$<%= priceGiftC%>
<td><INPUT TYPE = "submit" value = "Change Price Of Gift C"/></td>
</FORM>
</td>
</tr>

<tr>
<td><img src = "giftD.jpg" width = "200" height = "200"></td>	
<td>
<FORM ACTION = "ChangeItemPrice.jsp"		METHOD = "POST">
<INPUT TYPE = HIDDEN		NAME = "giftName"			VALUE = "giftD"/>
<INPUT TYPE = HIDDEN		NAME = "giftPrice"			VALUE = "<%=priceGiftD%>"/>
</td>
<td>&nbsp&nbsp&nbsp&nbsp Current Price: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>	<td>$<%= priceGiftD%>
<td><INPUT TYPE = "submit" value = "Change Price Of Gift B"/></td>
</FORM>
</td>
</tr>
</table>

<table>
<tr>
<td>
<FORM ACTION = "SalesClerkHomePage2.jsp" METHOD = "POST">
<INPUT TYPE = "Submit" value = "View Order"/></td>	
</FORM>
</td>
</tr>

<tr>
<td>
<FORM ACTION = "../LoginPage.jsp" METHOD = "POST">
<INPUT TYPE  = "Submit" 								VALUE = "Log-Out"/>
</FORM>
</td>
</tr>
</table>
</div>
</body>
</html>