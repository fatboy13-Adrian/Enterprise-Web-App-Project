<%
	response.addHeader("Cache-Control", "no-cache");
	response.addHeader("Pragma", "no-cache");
	response.addHeader("Expires", "0");

	String sessID = (String)request.getParameter("SessionId");

	if(sessID == null || sessID.equals(""))
		response.sendRedirect("AdministratorHomePage.jsp");

	else
		session.setAttribute("sessionid", sessID);		
%>




	