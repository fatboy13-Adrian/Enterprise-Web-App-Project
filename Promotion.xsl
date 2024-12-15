<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<HTML>
	<HEAD><TITLE>Director</TITLE></HEAD>
	<BODY>
		<H2><B>Promotion Home Page</B></H2>
		<xsl:for-each select="yrRoot/Gifts">
			<B>------------------------------------------</B>
			<BR/>
			Gift Name: <B><xsl:value-of select="giftName" /></B>
			<BR/>
			Quantity: <I><xsl:value-of select="promo" /></I>
			<BR/>
			
		</xsl:for-each>

		<FORM ACTION="DirectorHomePage.jsp" METHOD="POST">
			<INPUT TYPE="Submit" VALUE="Home"/>
		</FORM>
		<FORM ACTION="../LoginPage.jsp" METHOD="POST">
			<INPUT TYPE="Submit" VALUE="Log Out"/>
		</FORM>
		
	</BODY>
</HTML>
</xsl:template>
</xsl:stylesheet>