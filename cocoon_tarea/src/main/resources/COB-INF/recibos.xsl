<?xml version="1.0" encoding="windows-1252"?>

<!--
    Document   : recibos.xsl
    Created on : 26 de junio de 2020, 22:53
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
                <title>Recibos</title>
            </head>
            <body>
                <xsl:variable name="pagos" select="document('./pagos.xml')"/>
                    <xsl:for-each select="content/factura">
                    <xsl:variable name="id" select="."/>
                        <xsl:for-each select="$pagos/content/pago[factura = $id/ID_FACTURA]">                     
                            <table border='1'>
                                <tr>
                                    <th colspan="2">Recibo Electronico <xsl:value-of select="$id/ID_FACTURA"/> </th>
                                </tr>
                                <tr >
                                    <td bgcolor="#9acd32">Monto</td>
                                    <td><xsl:value-of select="$id/importe"/></td>
                                </tr>
                                <tr >
                                    <td bgcolor="#9acd32">Cliente</td>
                                    <td><xsl:value-of select="$id/Receptor"/></td>
                                </tr>
                                <tr >
                                    <td bgcolor="#9acd32">Fecha</td>
                                    <td><xsl:value-of select="./fecha"></xsl:value-of></td>
                                </tr>
                                <tr >
                                    <td bgcolor="#9acd32">numero_operacion</td>
                                    <td><xsl:value-of select="./nro_operacion"></xsl:value-of></td>
                                </tr>
                                <tr >
                                    <td bgcolor="#9acd32">producto nombre</td>
                                    <td><xsl:value-of select="$id/producto/nombre"/></td>
                                </tr>
                                <tr >
                                    <td bgcolor="#9acd32">producto descripcion</td>
                                    <td><xsl:value-of select="$id/producto/descripcion"/></td>
                                </tr>
                            </table>
                            <br></br> 
                        </xsl:for-each>        
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
