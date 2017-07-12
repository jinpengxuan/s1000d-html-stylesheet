<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0"><xsl:param name="numbered-titles" select="false()"/><xsl:param name="show-references-table" select="false()"/><xsl:param name="reference-resolver" select="false()"/><xsl:param name="extra-header-tags" select="false()"/><xsl:output method="html"/><xsl:template match="/"><html><xsl:apply-templates/></html></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="identAndStatusSection"><head><meta name="viewport" content="width=device-width, initial-scale=1.0"/><meta name="author"><xsl:attribute name="content"><xsl:apply-templates select="dmStatus/originator"/></xsl:attribute></meta><meta name="date"><xsl:attribute name="content"><xsl:apply-templates select="dmAddress/dmAddressItems/issueDate"/></xsl:attribute></meta><xsl:if test="$extra-header-tags"><xsl:copy-of select="$extra-header-tags"/></xsl:if><title><xsl:apply-templates select="dmAddress/dmAddressItems/dmTitle"/></title></head></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="content"><body><h1><xsl:apply-templates select="ancestor::dmodule//dmAddressItems/dmTitle"/></h1><xsl:if test="$show-references-table"><h2>References</h2><table><tr><th>Data module/Technical publication</th><th>Title</th></tr><xsl:if test="not(refs)"><tr><td>None</td><td/></tr></xsl:if><xsl:apply-templates select="refs"/></table></xsl:if><xsl:apply-templates select="description|procedure"/></body></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="levelledPara"><div><xsl:call-template name="unique-id-attr"/><xsl:apply-templates/></div></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="levelledPara/title"><h2><xsl:apply-templates/></h2></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="levelledPara/levelledPara/title"><h3><xsl:apply-templates/></h3></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="levelledPara/levelledPara/levelledPara/title"><h4><xsl:apply-templates/></h4></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="levelledPara/levelledPara/levelledPara/levelledPara/title"><h5><xsl:apply-templates/></h5></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="levelledPara/levelledPara/levelledPara/levelledPara/levelledPara/title"><h6><xsl:apply-templates/></h6></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="levelledPara/title/text()"><xsl:if test="$numbered-titles"><xsl:apply-templates select="parent::title/parent::*" mode="number"/><xsl:text> </xsl:text></xsl:if><xsl:value-of select="."/></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="levelledPara|levelledParaAlts" mode="number"><xsl:number level="multiple" from="dmodule" count="levelledPara|levelledParaAlts"/></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="table"><table><xsl:apply-templates/></table></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="row"><tr><xsl:apply-templates/></tr></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="thead/row/entry"><th><xsl:apply-templates/></th></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="tbody/row/entry"><td><xsl:apply-templates/></td></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="table/title"><caption><xsl:apply-templates/></caption></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="randomList"><xsl:apply-templates select="title"/><ul><xsl:apply-templates select="listItem"/></ul></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="listItem"><li><xsl:apply-templates/></li></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="definitionList"><xsl:apply-templates select="title"/><dl><xsl:apply-templates select="definitionListItem"/></dl></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="listItemTerm"><dt><xsl:apply-templates/></dt></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="listItemDefinition"><dd><xsl:apply-templates/></dd></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="refs"><xsl:apply-templates mode="refs"/></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="externalPubRef" mode="refs"><tr><xsl:apply-templates select="externalPubRefIdent" mode="refs"/></tr></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="dmRef" mode="refs"><tr><td><xsl:apply-templates select="."/></td><td><xsl:apply-templates select="dmRefAddressItems/dmTitle"/></td></tr></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="externalPubRefIdent" mode="refs"><td><xsl:choose><xsl:when test="../@xlink:href"><a href="{../@xlink:href}"><xsl:apply-templates select="externalPubCode"/></a></xsl:when><xsl:otherwise><xsl:apply-templates select="externalPubCode"/></xsl:otherwise></xsl:choose></td><td><xsl:apply-templates select="externalPubTitle"/></td></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="dmCode"><xsl:value-of select="@modelIdentCode"/><xsl:text>-</xsl:text><xsl:value-of select="@systemDiffCode"/><xsl:text>-</xsl:text><xsl:value-of select="@systemCode"/><xsl:text>-</xsl:text><xsl:value-of select="@subSystemCode"/><xsl:value-of select="@subSubSystemCode"/><xsl:text>-</xsl:text><xsl:value-of select="@assyCode"/><xsl:text>-</xsl:text><xsl:value-of select="@disassyCode"/><xsl:value-of select="@disassyCodeVariant"/><xsl:text>-</xsl:text><xsl:value-of select="@infoCode"/><xsl:value-of select="@infoCodeVariant"/><xsl:text>-</xsl:text><xsl:value-of select="@itemLocationCode"/><xsl:if test="@learnCode"><xsl:text>-</xsl:text><xsl:value-of select="@learnCode"/><xsl:value-of select="@learnEventCode"/></xsl:if></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="issueInfo"><xsl:value-of select="@issueNumber"/><xsl:text>-</xsl:text><xsl:value-of select="@inWork"/></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="language"><xsl:value-of select="@languageIsoCode"/><xsl:text>-</xsl:text><xsl:value-of select="@countryIsoCode"/></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="identExtension"><xsl:value-of select="@extensionProducer"/><xsl:text>-</xsl:text><xsl:value-of select="@extensionProducer"/></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="dmIdent|dmRefIdent"><xsl:if test="identExtension"><xsl:apply-templates select="identExtension"/><xsl:text>-</xsl:text></xsl:if><xsl:apply-templates select="dmCode"/><xsl:if test="issueInfo"><xsl:text>_</xsl:text><xsl:apply-templates select="issueInfo"/></xsl:if><xsl:if test="language"><xsl:text>_</xsl:text><xsl:apply-templates select="language"/></xsl:if></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="issueDate"><xsl:value-of select="@year"/><xsl:text>-</xsl:text><xsl:value-of select="@month"/><xsl:text>-</xsl:text><xsl:value-of select="@day"/></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="dmTitle"><xsl:apply-templates select="techName"/><xsl:if test="infoName"><xsl:text> - </xsl:text><xsl:apply-templates select="infoName"/></xsl:if></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="responsiblePartnerCompany|originator"><xsl:apply-templates select="enterpriseName"/></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="para"><p><xsl:apply-templates/></p></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="title"><b><xsl:apply-templates/></b></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="internalRef"><xsl:variable name="target-id" select="@internalRefId"/><xsl:variable name="target" select="ancestor::dmodule//*[@id=$target-id]"/><xsl:variable name="target-object-id"><xsl:call-template name="object-id"><xsl:with-param name="object" select="$target"/></xsl:call-template></xsl:variable><a href="#{$target-object-id}"><xsl:choose><xsl:when test="$target/shortName"><xsl:apply-templates select="$target/shortName"/></xsl:when><xsl:when test="$target/name"><xsl:apply-templates select="$target/name"/></xsl:when><xsl:otherwise><xsl:choose><xsl:when test="@internalRefTargetType='irtt01' or name($target)='figure' or name($target)='figureAlts' or name($target)='multimedia'"><xsl:text>Fig</xsl:text></xsl:when><xsl:when test="@internalRefTargetType='irtt02' or name($target)='table'"><xsl:text>Table</xsl:text></xsl:when><xsl:when test="@internalRefTargetType='irtt07' or name($target)='levelledPara' or name($target)='levelledParaAlts'"><xsl:text>Para</xsl:text></xsl:when><xsl:when test="@internalRefTargetType='irtt08' or name($target)='proceduralStep' or name($target)='proceduralStepAlts'"><xsl:text>Step</xsl:text></xsl:when></xsl:choose><xsl:text> </xsl:text><xsl:apply-templates select="$target" mode="number"/></xsl:otherwise></xsl:choose></a></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="dmRef"><xsl:variable name="ref"><xsl:apply-templates select="dmRefIdent"/></xsl:variable><xsl:choose><xsl:when test="$reference-resolver"><a href="{concat($reference-resolver, '?', $ref)}"><xsl:value-of select="$ref"/></a></xsl:when><xsl:otherwise><xsl:value-of select="$ref"/></xsl:otherwise></xsl:choose></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="externalPubRef[@xlink:href]"><xsl:call-template name="create-link"/></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="externalPubRefIdent"><xsl:choose><xsl:when test="externalPubTitle"><xsl:apply-templates select="externalPubTitle"/></xsl:when><xsl:otherwise><xsl:apply-templates select="externalPubCode"/></xsl:otherwise></xsl:choose></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="verbatimText"><pre><xsl:apply-templates/></pre></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="create-link"><a href="{@xlink:href}"><xsl:attribute name="target"><xsl:choose><xsl:when test="behavior/@linkShow = 'newPane'">_blank</xsl:when><xsl:otherwise>_self</xsl:otherwise></xsl:choose></xsl:attribute><xsl:apply-templates/></a></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="object-id"><xsl:param name="object" select="."/><xsl:value-of select="generate-id($object)"/></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" name="unique-id-attr"><xsl:attribute name="id"><xsl:call-template name="object-id"/></xsl:attribute></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="emphasis"><em><xsl:apply-templates/></em></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="figure"><figure><xsl:apply-templates select="graphic"/><xsl:apply-templates select="title"/></figure></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="title"><figcaption><xsl:apply-templates/></figcaption></xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="graphic"><img class="graphic" src="unparsed-entity-uri(@infoEntityIdent)"/></xsl:template></xsl:stylesheet>
