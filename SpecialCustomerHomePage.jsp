<%
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.addHeader("Expires","0"); 				//prevents caching at the proxyserver
	String sessID = (String)session.getAttribute("sessionid");

	if( sessID==null|| sessID.equals ("") )
	response.sendRedirect ("LoginPage.jsp");

	int purchaseGiftA = 0, purchaseGiftB = 0, purchaseGiftC = 0, purchaseGiftD = 0,quantityAdded = 0; 
	int quantityGiftA = 0, quantityGiftB = 0, quantityGiftC = 0, quantityGiftD = 0, Quantity = 0;
	int promoGiftA = 0, promoGiftB = 0, promoGiftC = 0, promoGiftD = 0;
	int success = 0;
%>

<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.*"%>

<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:DSN_AdminDetails");

	Statement   s  = con.createStatement();
	ResultSet   rs = s.executeQuery("SELECT giftName, purchases, promotion_price, quantity FROM Gifts");

	while(rs.next())
	{
		String giftName = rs.getString("giftName");

		if(giftName.equals("giftA"))
		{
			quantityGiftA = rs.getInt("quantity");
			purchaseGiftA = rs.getInt("purchases");
			promoGiftA = rs.getInt("promotion_price");
		}

		if(giftName.equals("giftB"))
		{
			quantityGiftB = rs.getInt("quantity");
			purchaseGiftB = rs.getInt("purchases");
			promoGiftB = rs.getInt("promotion_price");
		}

		if(giftName.equals("giftC"))
		{
			quantityGiftC = rs.getInt("quantity");
			purchaseGiftC = rs.getInt("purchases");
			promoGiftC = rs.getInt("promotion_price");
		}

		if(giftName.equals("giftD"))
		{
			quantityGiftD = rs.getInt("quantity");
			purchaseGiftD = rs.getInt("purchases");
			promoGiftD = rs.getInt("promotion_price");
		}
	}

	rs.close();
	s.close();
	con.close();
%>

<%
	String purchasedGift = (String)session.getAttribute("purchasedGift");

	if((Integer)session.getAttribute("AddedQuantity") != null)
	quantityAdded = (Integer)session.getAttribute("AddedQuantity");

	if((Integer)session.getAttribute("CurrentQuantity") != null)
	Quantity = (Integer)session.getAttribute("CurrentQuantity");

	if((Integer)session.getAttribute("UpdateSuccess") != null)
	success = (Integer)session.getAttribute("UpdateSuccess"); 

	if(success == 1)
	{
		out.print("Purchase is Successful! Purchased "+quantityAdded+" "+purchasedGift+"!<br>");
		out.print("Quantity Left In Inventory: "+Quantity+".<br>");
		success = 0;
	}
%>
<html>
<head>
<title> Customer Home Page </title>
<link rel="stylesheet" type="text/css" href="layout.css" />
</head>

<body>
<H1> Welcome to Customer Home Page</H1>
<H2>Current Purchases: </H2>

<table border = "1">
<tr>
<td><img src = "giftA.jpg" width = "200" height = "200"></td>	
<td>
<FORM ACTION = "SpecialPurchaseHomePage.jsp"		METHOD = "POST">
<INPUT TYPE = HIDDEN		NAME = "giftName"			VALUE = "giftA"/>
<INPUT TYPE = HIDDEN		NAME = "giftPurchase"		VALUE = "<%=purchaseGiftA%>"/>
<INPUT TYPE = HIDDEN		NAME = "giftQuantity"		VALUE = "<%=quantityGiftA%>"/>
</td>
<td>&nbsp&nbsp&nbsp&nbsp Quantity: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>	<td><%=quantityGiftA%>
<td>&nbsp&nbsp&nbsp&nbsp Purchases: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>	<td><%=purchaseGiftA%>
<td>&nbsp&nbsp&nbsp&nbsp Price: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>	<td>$<%=promoGiftA%></td>
<td><INPUT TYPE = "SUBMIT"								VALUE = "purchase"/></td>
</FORM>
</td>
</tr>

<tr>
<td><img src = "giftB.jpg" width = "200" height = "200"></td>	
<td>
<FORM ACTION = "SpecialPurchaseHomePage.jsp"		METHOD = "POST">
<INPUT TYPE = HIDDEN		NAME = "giftName"			VALUE = "giftB"/>
<INPUT TYPE = HIDDEN		NAME = "giftPurchase"		VALUE = "<%=purchaseGiftB%>"/>
<INPUT TYPE = HIDDEN		NAME = "giftQuantity"		VALUE = "<%=quantityGiftB%>"/>
</td>
<td>&nbsp&nbsp&nbsp&nbsp Quantity: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>	<td><%=quantityGiftB%>
<td>&nbsp&nbsp&nbsp&nbsp Purchases: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>	<td><%=purchaseGiftB%>
<td>&nbsp&nbsp&nbsp&nbsp Price: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>	<td>$<%=promoGiftB%></td>
<td><INPUT TYPE = "SUBMIT"								VALUE = "purchase"/></td>
</FORM>
</td>
</tr>

<tr>
<td><img src = "giftC.jpg" width = "200" height = "200"></td>	
<td>
<FORM ACTION = "SpecialPurchaseHomePage.jsp"		METHOD = "POST">
<INPUT TYPE = HIDDEN		NAME = "giftName"			VALUE = "giftC"/>
<INPUT TYPE = HIDDEN		NAME = "giftPurchase"		VALUE = "<%=purchaseGiftC%>"/>
<INPUT TYPE = HIDDEN		NAME = "giftQuantity"		VALUE = "<%=quantityGiftC%>"/>
</td>
<td>&nbsp&nbsp&nbsp&nbsp Quantity: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>	<td><%=quantityGiftC%>
<td>&nbsp&nbsp&nbsp&nbsp Purchases: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>	<td><%=purchaseGiftC%>
<td>&nbsp&nbsp&nbsp&nbsp Price: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>	<td>$<%=promoGiftC%></td>
<td><INPUT TYPE = "SUBMIT"								VALUE = "purchase"/></td>
</FORM>
</td>
</tr>

<tr>
<td><img src = "giftD.jpg" width = "200" height = "200"></td>	
<td>
<FORM ACTION = "SpecialPurchaseHomePage.jsp"		METHOD = "POST">
<INPUT TYPE = HIDDEN		NAME = "giftName"			VALUE = "giftD"/>
<INPUT TYPE = HIDDEN		NAME = "giftPurchase"		VALUE = "<%=purchaseGiftD%>"/>
<INPUT TYPE = HIDDEN		NAME = "giftQuantity"		VALUE = "<%=quantityGiftD%>"/>
</td>
<td>&nbsp&nbsp&nbsp&nbsp Quantity: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>	<td><%=quantityGiftD%>
<td>&nbsp&nbsp&nbsp&nbsp Purchases: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>	<td><%=purchaseGiftD%>
<td>&nbsp&nbsp&nbsp&nbsp Price: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td><td>$<%=promoGiftD%></td>
<td><INPUT TYPE = "SUBMIT"								VALUE = "purchase"/></td>
</FORM>
</td>
</tr>
</table>

<table>
<tr>
<td>
<FORM ACTION = "SpecialCustomerHomePage2.jsp" METHOD = "POST">
<INPUT TYPE  = "Submit" 								VALUE = "Special"/>
</FORM>
</td>
</tr>
</table>

<table>
<tr>
<td>
<FORM ACTION = "../LoginPage.jsp" METHOD = "POST">
<INPUT TYPE  = "Submit" 								VALUE = "Log-Out"/>
</FORM>
</td>
</tr>
</table>
</body>
</html>
