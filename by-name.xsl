<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="f1">
    <xsl:param name="arg1"/>
    <result>
      <xsl:value-of select="$arg1"/>
    </result>
  </xsl:template>

  <xsl:template match="/">

    <xsl:call-template name="f1">
      <xsl:with-param name="arg1" select="2"/>
    </xsl:call-template>

    <xsl:call-template name="f1">
      <xsl:with-param name="arg1" select="number(2)"/>
    </xsl:call-template>

    <xsl:call-template name="f1">
      <xsl:with-param name="arg1" select="string(2)"/>
    </xsl:call-template>

    <xsl:call-template name="f1">
      <xsl:with-param name="arg1" select="foo"/>
    </xsl:call-template>

    <xsl:call-template name="f1">
      <xsl:with-param name="arg1" select="string(foo)"/>
    </xsl:call-template>

  </xsl:template>

</xsl:stylesheet>
