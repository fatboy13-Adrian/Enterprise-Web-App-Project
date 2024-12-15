<% 
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.addHeader("Expires","0"); 				//prevents caching at the proxyserver
	
	String sessID = (String)session.getAttribute("sessionid");
	
	if(sessID == null || sessID.equals(""))
	response.sendRedirect("DirectorHomePage.jsp");

	int discountGiftA = 0, discountGiftB = 0, discountGiftC = 0, discountGiftD = 0, NewDiscount = 0, success = 0;
%>

<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.text.*"%>

<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:DSN_AdminDetails");

	Statement  s = con.createStatement();
	ResultSet rs = s.executeQuery("SELECT giftName, discount FROM Gifts");

	while(rs.next())
	{
		String giftName = rs.getString("giftName");

		if(giftName.equals("giftA"))
		discountGiftA = rs.getInt("discount");

		if(giftName.equals("giftB"))
		discountGiftB = rs.getInt("discount");

		if(giftName.equals("giftC"))
		discountGiftC = rs.getInt("discount");

		if(giftName.equals("giftD"))
		discountGiftD = rs.getInt("discount");
	}

	rs.close();
	s.close();
	con.close();
%>

<%
	String ChangegiftDiscount = (String)session.getAttribute("ChangegiftDiscount");

	if((Integer)session.getAttribute("NewDiscount") != null)
	NewDiscount = (Integer)session.getAttribute("NewDiscount");

	if((Integer)session.getAttribute("UpdateSuccess") != null)
	success = (Integer)session.getAttribute("UpdateSuccess");

	if(success == 1)
	{
		out.print("Gift Discount Is Changed Successfully!!Gift Name: "+ChangegiftDiscount+", New discount: "+NewDiscount+".");
		success = 0;
	}
%>

<html>
<head>
<title>Discount Home Page</title>
<link rel="stylesheet" type="text/css" href="layout.css" />
</head>

<body bgcolor = "#FFE4C4">
<H1>Welcome To Discount Home Page</H1>
<H2>Current Discounts:</H2>

<table border = "1">
<tr>
<td><img src = "giftA.jpg" width = "200" height = "200"></td>
<td>
<FORM ACTION = "Discount.jsp"		METHOD = "POST">
<INPUT TYPE = HIDDEN		NAME = "giftName"			VALUE = "giftA"/>
<INPUT TYPE = HIDDEN		NAME = "giftDiscount"		VALUE = "<%=discountGiftA%>"/>
</td>
<td>&nbsp&nbsp&nbsp&nbsp Current Discount: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	</td> <td><%=discountGiftA %>%
<td><INPUT TYPE = "submit" value = "Change Discount Of Gift A" /></td>
</FORM>
</td>
</tr>

<td><img src = "giftB.jpg" width = "200" height = "200"></td>
<td>
<FORM ACTION = "Discount.jsp"		METHOD = "POST">
<INPUT TYPE = HIDDEN		NAME = "giftName"			VALUE = "giftB"/>
<INPUT TYPE = HIDDEN		NAME = "giftDiscount"		VALUE = "<%=discountGiftB%>"/>
</td>
<td>&nbsp&nbsp&nbsp&nbsp Current Discount: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	</td> <td><%=discountGiftB %>%
<td><INPUT TYPE = "submit" value = "Change Discount Of Gift B" /></td>
</FORM>
</td>
</tr>

<td><img src = "giftC.jpg" width = "200" height = "200"></td>
<td>
<FORM ACTION = "Discount.jsp"		METHOD = "POST">
<INPUT TYPE = HIDDEN		NAME = "giftName"			VALUE = "giftC"/>
<INPUT TYPE = HIDDEN		NAME = "giftDiscount"		VALUE = "<%=discountGiftC%>"/>
</td>
<td>&nbsp&nbsp&nbsp&nbsp Current Discount: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	</td> <td><%=discountGiftC %>%
<td><INPUT TYPE = "submit" value = "Change Discount Of Gift A" /></td>
</FORM>
</td>
</tr>

<td><img src = "giftD.jpg" width = "200" height = "200"></td>
<td>
<FORM ACTION = "Discount.jsp"		METHOD = "POST">
<INPUT TYPE = HIDDEN		NAME = "giftName"			VALUE = "giftD"/>
<INPUT TYPE = HIDDEN		NAME = "giftDiscount"		VALUE = "<%=discountGiftD%>"/>
</td>
<td>&nbsp&nbsp&nbsp&nbsp Current Discount: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	</td> <td><%=discountGiftD %>%
<td><INPUT TYPE = "submit" value = "Change Discount Of Gift A" /></td>
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

<tr>
<td>
<FORM ACTION = "DiscountHomePage2.jsp" METHOD = "POST">
<INPUT TYPE  = "Submit" 								VALUE = "VIEW TOP 10"/>
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