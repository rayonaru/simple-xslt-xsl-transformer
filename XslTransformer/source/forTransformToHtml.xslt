<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsd="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ct="http://tempuri.org/eaviias/commontypes" xmlns:ms='urn:schemas-microsoft-com:xslt'>
	<xsl:template match="/">
		<html>
			<head>
				<style type="text/css">
					table, th, td, div {
  					border: 1px solid black;
					}
				</style>
			</head>
			<body>
				<h1>Bank date</h1>
				<h2>Credits list</h2>
				<div>
					<ul>
						<xsl:for-each select="clients/client">
							<li>
								<xsl:text>Id: </xsl:text>
								<xsl:value-of select="@id"/>
								<xsl:text>; Full name: </xsl:text>
								<xsl:value-of select="lastName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="firtsName"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="patronymic"/>
								<ol>
									<xsl:for-each select="credits/credit">
										<li>
											<xsl:text>Summ: </xsl:text>
											<xsl:value-of select="summ"/>
											<xsl:text> rub.</xsl:text>
											<xsl:text>; Rate: </xsl:text>
											<xsl:value-of select="rate"/>
											<xsl:text>; Date: </xsl:text>
											<xsl:value-of select="date"/>		
										</li>
									</xsl:for-each>
								</ol>
							</li>
						</xsl:for-each>
					</ul>
				</div>
				<h2>Deposits list</h2>
				<table>
					<thead>
						<tr>
							<td>Full name</td>
							<td>Phone</td>
						</tr>
						<tr>
							<td rowspan="2">Id</td>
							<td rowspan="2">Type</td>
							<td rowspan="2">Summ</td>
							<td rowspan="2">Rate</td>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="clients/client">
							<tr>	
								<td>
									<xsl:value-of select="lastName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="firtsName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="patronymic"/>
								</td>
								<td>
									<xsl:value-of select="phone"/>
								</td>
							</tr>
							<xsl:for-each select="deposits/deposit">
								<tr>
									<td>
										<xsl:value-of select="@id"/>
									</td>
									<td>
									<xsl:value-of select="type"/>
									</td>
									<td>
										<xsl:value-of select="summ"/>
									</td>
									<td>
										<xsl:value-of select="rate"/>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:for-each>	
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>