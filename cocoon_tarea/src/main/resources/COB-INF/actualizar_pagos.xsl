<?xml version="1.0" encoding="windows-1252"?>

<!--
    Document   : actualizar_pagos.xsl
    Created on : 26 de junio de 2020, 20:01
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
                <title>facturas</title>
            </head>
            <body>
                <table name="table1" border='1'>
                    <tr bgcolor="#9acd32">
                        <th>ID_Factura</th>
                        <th>Monto</th>
                        <th>¿Pago?</th>
                    </tr>
                <xsl:variable name="pagos" select="document('./pagos.xml')"/>
                    <xsl:for-each select="content/factura">
                    <xsl:variable name="id" select="."/>
                        <xsl:for-each select="$pagos/content/pago[factura = $id/ID_FACTURA]">                     
                            <tr>
                                <td><xsl:value-of select="$id/ID_FACTURA"/></td>
                                <td><xsl:value-of select="monto"/></td>
                                <td>Si</td>
                            </tr> 
                        </xsl:for-each>        
                </xsl:for-each>
                </table>
                <table border='1'>
                    <tr bgcolor="#9acd32">
                        <th>ID_Factura</th>
                        <th>Monto</th>
                        <th>¿Pago?</th>
                    </tr>
                <xsl:variable name="pagos" select="document('./pagos.xml')"/>
                    <xsl:for-each select="content/factura">
                    <xsl:variable name="id" select="."/>
                        <xsl:variable name="var1">                     
                        <xsl:for-each select="$pagos/content/pago[factura = $id/ID_FACTURA]">                                       
                            No                          
                        </xsl:for-each>
                        </xsl:variable>
                        <xsl:if test="string-length($var1) = 0">
                        <tr>
                            <td><xsl:value-of select="$id/ID_FACTURA"/></td>
                            <td><xsl:value-of select="importe"/></td>
                            <td>No</td>
                        </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
