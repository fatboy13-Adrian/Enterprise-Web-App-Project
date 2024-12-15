<% 
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.addHeader("Expires","0"); 				//prevents caching at the proxyserver
	
	String sessID = (String)session.getAttribute("sessionid");
	
	if(sessID == null || sessID.equals(""))
	response.sendRedirect("DirectorHomePage.jsp");

	int promoGiftA = 0, promoGiftB = 0, promoGiftC = 0, promoGiftD = 0, NewPromo = 0, success = 0;
%>

<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.*"%>

<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:DSN_AdminDetails");

	Statement  s = con.createStatement();
	ResultSet rs = s.executeQuery("SELECT giftName, promotion_price FROM Gifts");

	while(rs.next())
	{
		String giftName = rs.getString("giftName");

		if(giftName.equals("giftA"))
		promoGiftA = rs.getInt("promotion_price");

		if(giftName.equals("giftB"))
		promoGiftB = rs.getInt("promotion_price");

		if(giftName.equals("giftC"))
		promoGiftC = rs.getInt("promotion_price");

		if(giftName.equals("giftD"))
		promoGiftD = rs.getInt("promotion_price");
	}

	rs.close();
	s.close();
	con.close();
%>

<%
	String ChangegiftPromo = (String)session.getAttribute("ChangegiftPromo");

	if((Integer)session.getAttribute("NewPromo") != null)
	NewPromo = (Integer)session.getAttribute("NewPromo");

	if((Integer)session.getAttribute("UpdateSuccess") != null)
	success = (Integer)session.getAttribute("UpdateSuccess");

	if(success == 1)
	{
		out.print("Gift Discount Is Changed Successfully!!<br>");
		out.print("Gift Name: "+ChangegiftPromo+".");
		out.print("New Promo: "+NewPromo+".");
		success = 0;
	}
%>
<html>
<head>
<title>Discount Home Page </title>
<link rel="stylesheet" type="text/css" href="layout.css" />
</head>

<body>
<H1>Welcome To Discount Home Page</H1>
<H2>Current Promotions:</H2>

<table border = "1">
<tr>
<td><img src = "giftA.jpg" width = "200" height = "200"></td>
<td>
<FORM ACTION = "Promotion.jsp"		METHOD = "POST">
<INPUT TYPE = HIDDEN		NAME = "giftName"			VALUE = "giftA"/>
<INPUT TYPE = HIDDEN		NAME = "giftPromo"			VALUE = "<%=promoGiftA%>"/>
</td>
<td>&nbsp&nbsp&nbsp&nbsp Current Promo Price: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	</td> <td>$<%=promoGiftA %>
<td><INPUT TYPE = "submit" value = "Change Promotion Of Gift A" /></td>
</FORM>
</td>
</tr>

<tr>
<td><img src = "giftB.jpg" width = "200" height = "200"></td>
<td>
<FORM ACTION = "Promotion.jsp"		METHOD = "POST">
<INPUT TYPE = HIDDEN		NAME = "giftName"			VALUE = "giftB"/>
<INPUT TYPE = HIDDEN		NAME = "giftPromo"			VALUE = "<%=promoGiftB%>"/>
</td>
<td>&nbsp&nbsp&nbsp&nbsp Current Promo Price: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	</td> <td>$<%=promoGiftB %>
<td><INPUT TYPE = "submit" value = "Change Promotion Of Gift B" /></td>
</FORM>
</td>
</tr>

<tr>
<td><img src = "giftC.jpg" width = "200" height = "200"></td>
<td>
<FORM ACTION = "Promotion.jsp"		METHOD = "POST">
<INPUT TYPE = HIDDEN		NAME = "giftName"			VALUE = "giftC"/>
<INPUT TYPE = HIDDEN		NAME = "giftPromo"			VALUE = "<%=promoGiftC%>"/>
</td>
<td>&nbsp&nbsp&nbsp&nbsp Current Promo Price: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	</td> <td>$<%=promoGiftC %>
<td><INPUT TYPE = "submit" value = "Change Promotion Of Gift A" /></td>
</FORM>
</td>
</tr>

<tr>
<td><img src = "giftD.jpg" width = "200" height = "200"></td>
<td>
<FORM ACTION = "Promotion.jsp"		METHOD = "POST">
<INPUT TYPE = HIDDEN		NAME = "giftName"			VALUE = "giftD"/>
<INPUT TYPE = HIDDEN		NAME = "giftPromo"			VALUE = "<%=promoGiftD%>"/>
</td>
<td>&nbsp&nbsp&nbsp&nbsp Current Promo Price: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	</td> <td>$<%=promoGiftD %>
<td><INPUT TYPE = "submit" value = "Change Promotion Of Gift A" /></td>
</FORM>
</td>
</tr>
</table>

<table>
<tr>
<td>
<FORM ACTION = "DirectorHomePage.jsp" METHOD = "POST">
<INPUT TYPE  = "Submit" 								VALUE = "Back To Director Home Page"/>
</FORM>
</td>
</tr>

<table>
<tr>
<td>
<FORM ACTION = "PromotionHomePage2.jsp" METHOD = "POST">
<INPUT TYPE  = "Submit" 								VALUE = "View Promotion Items"/>
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
</body>
</html>