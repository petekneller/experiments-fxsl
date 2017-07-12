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

  <xsl:template match="/">

    <xsl:apply-templates select="document('')//foo:foo">
      <xsl:with-param name="arg1" select="2"/>
    </xsl:apply-templates>

    <xsl:apply-templates select="document('')//foo:foo">
      <xsl:with-param name="arg1" select="'foo'"/>
    </xsl:apply-templates>

  </xsl:template>

  <foo:foo/>

</xsl:stylesheet>
