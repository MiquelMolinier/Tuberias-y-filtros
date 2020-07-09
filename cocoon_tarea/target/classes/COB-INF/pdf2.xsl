<?xml version="1.0" encoding="windows-1252"?>
    <xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" omit-xml-declaration="yes"/>
    <xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <fo:layout-master-set>
        <fo:simple-page-master master-name="page"
            page-height="29.7cm"
            page-width="21cm"
            margin-top="1cm"
            margin-bottom="2cm"
            margin-left="2.5cm"
            margin-right="2.5cm">
            <fo:region-before extent="3cm"/>
            <fo:region-body margin-top="3cm"/>
            <fo:region-after extent="1.5cm"/>
        </fo:simple-page-master>
        <fo:page-sequence-master master-name="all">
            <fo:repeatable-page-master-alternatives>
            <fo:conditional-page-master-reference
            master-reference="page" page-position="first"/>
            </fo:repeatable-page-master-alternatives>
        </fo:page-sequence-master>
    </fo:layout-master-set>
    <fo:page-sequence master-reference="all">
    <fo:flow flow-name="xsl-region-body">
                <xsl:variable name="pagos" select="document('./pagos.xml')"/>
                <xsl:for-each select="content/factura">
                    <xsl:variable name="id" select="."/>
                    <xsl:variable name="var1">                     
                        <xsl:for-each select="$pagos/content/pago[factura = $id/ID_FACTURA]">                                       
                            No                          
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:if test="string-length($var1) = 0">
                        <fo:block space-after.optimum="10pt" font-family="Helvetica" font-size="10pt">
                            <fo:table>
                                <fo:table-column column-width="250pt"/>
                                <fo:table-column column-width="100pt"/>
                                <fo:table-body>
                                    <fo:table-row>
                                        <fo:table-cell padding="15pt">
                                            <fo:block font-size="40pt">
                                                <xsl:value-of select="$id/Emisor"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="15pt">
                                                <fo:block padding-bottom="6pt" text-align="center" font-size="12pt" >
                                                    <xsl:value-of select="$id/Emisor"/>
                                                </fo:block>
                                                <fo:block padding-bottom="6pt" text-align="center" font-size="12pt">
                                                    R.U.C. 20100074568
                                                </fo:block>
                                                <fo:block padding-bottom="6pt" text-align="center">
                                                    Lima, 26 de junio de 2020
                                                </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </fo:table-body>
                            </fo:table>
             
                            </fo:block>
                            <fo:block font-size="12pt" text-align="start">
                                Señor(a):
                            </fo:block>
                            <fo:block padding-bottom="5pt" font-size="12pt" text-align="start">
                                <xsl:value-of select="$id/Receptor"/>
                            </fo:block>
                            <fo:block padding-bottom="5pt" font-size="12pt" text-align="start"> 
                                Asunto: Recordatorio pago de factura
                            </fo:block>
                            <fo:block padding-bottom="5pt" font-size="12pt" text-align="start"> 
                                Estimado Cliente, aprovechamos la ocasión para saludarlo e informarle que aún se encuentra pendiente del pago de la
                                factura <xsl:value-of select="$id/ID_FACTURA"/>, con fecha de vencimiento <xsl:value-of select="$id/fecha_venc"/>. Esperamos
                                su pronto pago, agradecemos la atención presta.
                            </fo:block>
                            <fo:block font-size="12pt">Atentamente.</fo:block>
                            <fo:block text-align="end" padding-top="6cm">
                                <fo:block padding-right="15pt">
                                    MIGUEL ALDERETE CRUZATT
                                </fo:block>
                                <fo:block>
                                    --------------------------------------------
                                </fo:block>
                                <fo:block>
                                    GERENTE GENERAL
                                </fo:block>
                            </fo:block>
                           
                            
                            <fo:table break-after="page"></fo:table>
                    </xsl:if>       
                </xsl:for-each>
    </fo:flow>
    </fo:page-sequence>
    </fo:root>
    </xsl:template>
</xsl:stylesheet>