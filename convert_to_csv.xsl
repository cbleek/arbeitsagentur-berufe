<xsl:stylesheet version="1.0" xmlns:str="http://exslt.org/strings" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="utf-8" />

  <xsl:param name="delim" select="','" />
  <xsl:param name="quote" select="'&quot;'" />
  <xsl:param name="apos" select='"&apos;"' />
  <xsl:param name="break" select="'&#xA;'" />

  <xsl:template match="/">
    <xsl:apply-templates select="berufeliste/beruf" />
  </xsl:template>

  <xsl:template match="beruf">
    <xsl:value-of select="concat($quote, normalize-space(@id), $quote)"/>
    <xsl:value-of select="$delim" />
    <xsl:value-of select="concat($quote, normalize-space(@bkz), $quote)"/>
    <xsl:value-of select="$delim" />
    <xsl:apply-templates />
    <xsl:if test="following-sibling::*">
      <xsl:value-of select="$break" />
    </xsl:if>
  </xsl:template>


  <xsl:template match="bezeichnung">
    <xsl:value-of select="concat($quote, normalize-space(translate(bezeichnung_nl,'&quot;',$apos)), $quote)"/>
    <xsl:value-of select="$delim" />
    <xsl:value-of select="concat($quote, normalize-space(translate(bezeichnung_nk,'&quot;',$apos)), $quote)"/>
    <xsl:value-of select="$delim" />
  </xsl:template>
 
  <xsl:template match="beruf/lbkgruppe">
    <xsl:if test="not(preceding-sibling::*[1][self::lbkgruppe])">
      <xsl:value-of select="$quote" />
    </xsl:if>
    <xsl:value-of select="normalize-space()"/>
    <xsl:if test="following-sibling::*[1][self::lbkgruppe]">
      <xsl:value-of select="$delim" />
    </xsl:if>
    <xsl:if test="not(following-sibling::*[1][self::lbkgruppe])">
      <xsl:value-of select="$quote" />
      <xsl:value-of select="$delim" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="beruf/typ">
    <xsl:value-of select="$quote" />
    <xsl:value-of select="normalize-space()"/>
    <xsl:value-of select="$quote" />
    <xsl:value-of select="$delim" />
    <xsl:if test="not(following-sibling::*[1][self::lbkgruppe])">
      <xsl:value-of select="$quote" />
      <xsl:value-of select="$quote" />
      <xsl:value-of select="$delim" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="qualifikationsNiveaus">
    <xsl:value-of select="$quote" />
    <xsl:for-each select="qualifikationsNiveau">
      <xsl:value-of select="normalize-space(@niveau)"/>
      <xsl:if test="following-sibling::*">
        <xsl:value-of select="$delim" />
      </xsl:if>
    </xsl:for-each>
    <xsl:value-of select="$quote" />    
    <xsl:value-of select="$delim" />
  </xsl:template>

  <xsl:template match="*">
    <!-- remove normalize-space() if you want keep white-space at it is --> 
    <xsl:value-of select="concat($quote,normalize-space(.), $quote)" />
    <xsl:if test="following-sibling::*">
      <xsl:value-of select="$delim" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="text()"/>
</xsl:stylesheet>