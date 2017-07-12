<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:foo="pk/foo">

  <xsl:template match="foo:foo">
    <xsl:param name="arg1"/>
    <result>
      <!-- uncomment the below to see the node-set used to choose the function -->
      <!-- <xsl:copy-of select="."/> -->
      <xsl:value-of select="$arg1"/>
    </result>
  </xsl:template>

  <xsl:template name="caller">
    <xsl:param name="callee"/>
    <!-- uncomment the below to see the node-set used to choose the function -->
    <!-- <xsl:copy-of select="$callee"/> -->
    <xsl:apply-templates select="$callee">
      <xsl:with-param name="arg1" select="3"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="/">
    <xsl:call-template name="caller">
      <xsl:with-param name="callee" select="document('')//foo:foo"/>
    </xsl:call-template>
  </xsl:template>

  <foo:foo/>

</xsl:stylesheet>
