
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="myjsp.Director"%>

<jsp:useBean id="DirectorBean" scope="session" class="myjsp.Director"/>
<jsp:setProperty name="DirectorBean" property="*"/> 


<%
		String category = DirectorBean.getCategory();
		String discount = DirectorBean.getDiscount();
		String sold = DirectorBean.getSold();

				

				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				Connection con = DriverManager.getConnection("jdbc:odbc:DSN_WAREHOUSE");
				Statement   s		=con.createStatement();
		
				
				int	status  =s.executeUpdate("UPDATE director SET discount='"+discount+"' WHERE category='"+category+"'");
				s.close();
	con.close();
	
response.sendRedirect("DirectorHomePage.jsp");

%>
	