<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<HTML>
	<HEAD><TITLE>Sales Clerk</TITLE></HEAD>
	<BODY>
		<H2><B>Search and View Customers Order</B></H2>
		<xsl:for-each select="yrRoot/Gifts">
			<B>------------------------------------------</B>
			<BR/>
			Gift Name: <B><xsl:value-of select="giftName" /></B>
			<BR/>
			Quantity :<I><xsl:value-of select="quantity" /></I>
			<BR/>
		</xsl:for-each>
		<FORM ACTION="SalesClerkHomePage.jsp" METHOD="POST">
			<INPUT TYPE="Submit" VALUE="Sales Clerk HomePage"/>
		</FORM>

		<FORM ACTION="../LoginPage.jsp" METHOD="POST">
			<INPUT TYPE="Submit" VALUE="Log Out"/>
		</FORM>
		
	</BODY>
</HTML>
</xsl:template>
</xsl:stylesheet>