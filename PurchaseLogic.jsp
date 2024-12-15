<%
	response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.addHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.addHeader("Expires","0");				 //prevents caching at the proxyserver
	String sessID = (String)session.getAttribute ("sessionid");

	if(sessID==null|| sessID.equals(""))
	response.sendRedirect ("CustomerHomePage.jsp");

	String giftName = request.getParameter("giftName");
	int giftPurchase = Integer.parseInt(request.getParameter("giftPurchase"));
	int addQuantity = Integer.parseInt(request.getParameter("addQuantity"));
	int giftQuantity = Integer.parseInt(request.getParameter("giftQuantity"));
	
	//Bonus Part 
	if(addQuantity > giftQuantity)
	{
		 addQuantity= 0;
			 
	}
	
	int newQuantity = giftPurchase + addQuantity;
	int quantity = giftQuantity - addQuantity;
%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>

<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:DSN_AdminDetails");

	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("ddMMyyyy");
	int date = Integer.valueOf(sdf.format(new java.util.Date()));
	Statement   s		=con.createStatement();
	int 		status  =s.executeUpdate("UPDATE Gifts SET purchases="+newQuantity+", quantity="+quantity+" WHERE giftName='"+giftName+"'");
	
	if(status > 0)
	{
		System.out.println("<H2>Update is Successful</H2>");
		session.setAttribute("purchasedGift", giftName);
		session.setAttribute("AddedQuantity", addQuantity);
		session.setAttribute("CurrentQuantity", quantity);

		int success = 1;

		session.setAttribute("UpdateSuccess", success);
		response.sendRedirect("CustomerHomePage.jsp");
	}
	else
	System.out.println("Error!!!");

	s.close();
	con.close();
%>