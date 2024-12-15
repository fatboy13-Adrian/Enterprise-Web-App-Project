<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<HTML>
	<HEAD><TITLE>Customer</TITLE></HEAD>
	<BODY>
		<H2><B>Search and View items</B></H2>
		<xsl:for-each select="yrRoot/Customer">
			<B>------------------------------------------</B>
			<BR/>
			Gift Name: <B><xsl:value-of select="giftName" /></B>
			<BR/>
			Purchases: <I><xsl:value-of select="purchases" /></I>
			<BR/>
		</xsl:for-each>
		<FORM ACTION="CustomerHomePage.jsp" METHOD="POST">
			<INPUT TYPE="Submit" VALUE="Home"/>
		</FORM>
		<FORM ACTION="../LoginPage.jsp" METHOD="POST">
			<INPUT TYPE="Submit" VALUE="Log Out"/>
		</FORM>
		
	</BODY>
</HTML>
</xsl:template>
</xsl:stylesheet>