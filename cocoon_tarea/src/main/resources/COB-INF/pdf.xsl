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
                        <xsl:for-each select="$pagos/content/pago[factura = $id/ID_FACTURA]">                   
                            <fo:block space-after.optimum="10pt" font-family="Helvetica" font-size="10pt">
                                
                                <!-- fo:table nos permite tratar con tablas para organizar facilmente columnas -->
                                <fo:block font-size="25pt" text-align="center" padding="5pt"> 
                                    <xsl:value-of select="$id/Emisor"/>
                                </fo:block>

                            <fo:block font-size="18pt" text-align="center"> 
                                Recibo de pago
                            </fo:block>
                            
                            <fo:block font-size="12pt" text-align="center" padding-bottom="15pt"> 
                                1 pago por factura n°: 
                                <xsl:value-of select="$id/ID_FACTURA"/>
                            </fo:block>
                                <fo:table>
                                    <fo:table-column column-width="250pt"/>
                                
                                    <fo:table-column column-width="190pt"/>

                                    <fo:table-body>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block padding="6pt" text-align="start"  font-size="14pt"> 
                                                    Fecha de vencimiento de pago:
                                                </fo:block>                                      
                                            </fo:table-cell>
                                            <fo:table-cell >
                                            <fo:block padding="6pt" text-align="start" font-size="14pt">
                                                    <xsl:value-of select="$id/fecha_venc"/>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                            <fo:table-cell >
                                                <fo:block padding="6pt" text-align="start" font-size="14pt"> 
                                                    Fecha de pago:
                                                </fo:block>
                                                
                                            </fo:table-cell>
                                            <fo:table-cell >
                                            <fo:block padding="6pt" text-align="start" font-size="14pt">
                                                    <xsl:value-of select="./fecha"></xsl:value-of>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                            <fo:table-cell  >
                                                <fo:block padding="6pt" text-align="start"  font-size="14pt"> 
                                                    Cliente:
                                                </fo:block>                                      
                                            </fo:table-cell>
                                            <fo:table-cell >
                                            <fo:block padding="6pt" text-align="start" font-size="14pt">
                                                    <xsl:value-of select="$id/Receptor"/>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
  
                                        <fo:table-row>
                                            <fo:table-cell  >
                                                <fo:block padding="6pt" text-align="start"  font-size="14pt"> 
                                                    Importe Total en (S/.):
                                                </fo:block>                                      
                                            </fo:table-cell>
                                            <fo:table-cell >
                                            <fo:block padding="6pt" text-align="start" font-size="14pt">
                                                    <xsl:value-of select="$id/importe"/>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                        
                                        
                                        
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block padding="6pt" text-align="start"  font-size="14pt"> 
                                                    Nombre del producto:
                                                </fo:block>                                      
                                            </fo:table-cell>
                                            <fo:table-cell >
                                            <fo:block padding="6pt" text-align="start" font-size="14pt">
                                                    <xsl:value-of select="$id/producto/nombre"/>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                        <fo:table-row>
                                            <fo:table-cell  >
                                                <fo:block padding="6pt" text-align="start"  font-size="14pt"> 
                                                    Descripción del producto:
                                                </fo:block>                                      
                                            </fo:table-cell>
          
                                        </fo:table-row>
                                        
                                    </fo:table-body>
                                </fo:table>
                                <fo:table>
                                   <fo:table-column column-width="440pt"/>
                                   <fo:table-body>
                                      <fo:table-row>
                                          <fo:table-cell >
                                             <fo:block font-size="14pt"> 
                                                    <xsl:value-of select="$id/producto/descripcion"/> 
                                                </fo:block> 
                                          </fo:table-cell>
                                  
                                   </fo:table-row> 
                                   </fo:table-body>
                                    
                                </fo:table>
                            </fo:block>
                            <fo:block padding="6pt" font-size="14pt" text-align="center" border-style="solid">
                                FACTURA CANCELADA
                            </fo:block>
                            <fo:block padding-top="6pt">
                                <fo:block>
                                    R.U.C N° <xsl:value-of select="./RUC"/>
                                </fo:block>
                 
                                <fo:block>
                                    N° de autorización de impresión: <xsl:value-of select="./IMPRESION"/>
                                </fo:block>
             
                                <fo:block>
                                    Fecha de impresión: <xsl:value-of select="./FECHA_IMPRESION"/>
                                </fo:block>
                                
                            </fo:block>
        
                            <fo:table break-after="page"></fo:table>
                            
                           
                        </xsl:for-each>        
                </xsl:for-each>
    </fo:flow>
    </fo:page-sequence>
    </fo:root>
    </xsl:template>
</xsl:stylesheet>