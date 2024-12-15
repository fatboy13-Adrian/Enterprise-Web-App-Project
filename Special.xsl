<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<HTML>
	<HEAD><TITLE>Special Customer</TITLE></HEAD>
	<BODY>
		<H2><B>Special Customers Order</B></H2>
		<xsl:for-each select="yrRoot/Customer">
			<B>------------------------------------------</B>
			<BR/>
			Gift Name : <B><xsl:value-of select="giftName" /></B>
			<BR/>
			Purchases :<I><xsl:value-of select="purchases" /></I>
			<BR/>
		</xsl:for-each>
		<FORM ACTION="SpecialCustomerHomePage.jsp" METHOD="POST">
			<INPUT TYPE="Submit" VALUE="Special Customer HomePage"/>
		</FORM>

		<FORM ACTION="../LoginPage.jsp" METHOD="POST">
			<INPUT TYPE="Submit" VALUE="Log Out"/>
		</FORM>
		
	</BODY>
</HTML>
</xsl:template>
</xsl:stylesheet>