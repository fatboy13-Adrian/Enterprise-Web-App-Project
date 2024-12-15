<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<HTML>
	<HEAD><TITLE>Admin</TITLE></HEAD>
	<BODY>
		<H2><B>Banned List</B></H2>
		<xsl:for-each select="yrRoot/Admin">
			<B>------------------------------------------</B>
			<BR/>
			User Name: <B><xsl:value-of select="UserName" /></B>
			<BR/>
			IC Number: <I><xsl:value-of select="IC" /></I>
			<BR/>
			Amount Owed: $<I><xsl:value-of select="Amountowe" /></I>
			<BR/>
		</xsl:for-each>
		<FORM ACTION="AdministratorHomePage.jsp" METHOD="POST">
			<INPUT TYPE="Submit" VALUE="Adminstrator Home Page"/>
		</FORM>
		<FORM ACTION="../LoginPage.jsp" METHOD="POST">
			<INPUT TYPE="Submit" VALUE="Log Out"/>
		</FORM>
		
	</BODY>
</HTML>
</xsl:template>
</xsl:stylesheet>