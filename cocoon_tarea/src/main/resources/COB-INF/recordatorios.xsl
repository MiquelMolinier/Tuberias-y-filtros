<?xml version="1.0" encoding="windows-1252"?>

<!--
    Document   : recordatorios.xsl
    Created on : 26 de junio de 2020, 23:14
    Author     : USER
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Recordatorios</title>
            </head>
            <body>
                <xsl:variable name="pagos" select="document('./pagos.xml')"/>
                    <xsl:for-each select="content/factura">
                    <xsl:variable name="id" select="."/>
                        <xsl:variable name="var1">                     
                        <xsl:for-each select="$pagos/content/pago[factura = $id/ID_FACTURA]">                                       
                            No                          
                        </xsl:for-each>
                        </xsl:variable>
                        <xsl:if test="string-length($var1) = 0">
                            <table border='1'>
                                <tr >
                                        <th colspan="2">Recordatorio electrónico <xsl:value-of select="$id/ID_FACTURA"/> </th>
                                </tr>
                                <tr >
                                    <td bgcolor="#9acd32">monto</td>
                                    <td><xsl:value-of select="$id/importe"/></td>
                                </tr>
                                <tr >
                                    <td bgcolor="#9acd32">producto</td>
                                    <td><xsl:value-of select="$id/producto/nombre"/></td>
                                </tr>
                                <tr >
                                    <td bgcolor="#9acd32">Empresa</td>
                                    <td><xsl:value-of select="$id/Emisor"/></td>
                                </tr>
                               
                                <tr >
                                    <td bgcolor="#9acd32">Nombre de cliente</td>
                                    <td><xsl:value-of select="$id/Receptor"/></td>
                                </tr>
                                <tr >
                                    <td bgcolor="#9acd32">Mensaje</td>
                                    <td> Estimado Cliente, aprovechamos la ocasión para saludarlo e informarle que a la fecha aún se encuentra pendiente de pago</td>
                                </tr>
                            </table>
                            <br></br> 
                        </xsl:if>
                    </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
