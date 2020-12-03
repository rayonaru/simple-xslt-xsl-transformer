<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsd="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ct="http://tempuri.org/eaviias/commontypes" xmlns:ms='urn:schemas-microsoft-com:xslt'>
	<xsl:template match="/">
		<credits>
				<xsl:for-each select="clients/client">
					<credit>
						<xsl:attribute name="id">
							<xsl:value-of select="credits/credit/@id"/>	
						</xsl:attribute>
						<client>
							<fullName>
								<xsl:value-of select="lastName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="firtsName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="patronymic"/>
							</fullName>
							<passport>
								<xsl:value-of select="series"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="number"/>
							</passport>
						</client>
						<xsl:for-each select="credits/credit">
							<summ>
								<xsl:attribute name="rate">
									<xsl:value-of select="rate"/>	
								</xsl:attribute>
								<xsl:value-of select="summ"/>
							</summ>
							<duration>
								<xsl:value-of select="duration"/>
							</duration>
						</xsl:for-each>
					</credit>
				</xsl:for-each>
		</credits>
	</xsl:template>
</xsl:stylesheet>