<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>History Records</title>
                <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <script type="text/javascript" src="js/history.js"></script>
                <link rel="stylesheet" type="text/css" href="css/history.css"/>
            </head>
            <nav>
                <h1> </h1>
            </nav>
            <body>
                <div id="historyContainer">
                    <div class="header-container">
                        <!-- Teks Your History di kiri -->
                        <h1>Your History</h1>
                        <!-- Tombol Back di kanan -->
                        <a href="http://localhost/XML-HD/home.xml" class="back-button">Back</a>
                    </div>
                    <xsl:choose>
                        <xsl:when test="count(histories/history) > 0">
                            <xsl:for-each select="histories/history">
                                <div class="history-item">
                                    <div class="history-header">
                                        <span class="history-id">History ID: <xsl:value-of select="history_id"/></span>
                                        <span class="product-id">Product ID: <xsl:value-of select="product_id"/></span>
                                    </div>
                                    <div class="product">
                                        <img>
                                            <xsl:attribute name="src">
                                                <xsl:text>http://localhost/XML-HD/public/images/</xsl:text>
                                                <xsl:value-of select="image"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of select="product_name"/>
                                            </xsl:attribute>
                                        </img>

                                        <div class="product-details">
                                            <h2><xsl:value-of select="product_name"/></h2>
                                            <p><strong>Price:</strong> Rp <xsl:value-of select="format-number(price, '#,###.00')"/></p>
                                            <p><strong>Description:</strong> <xsl:value-of select="description"/></p>
                                            <p><strong>Size:</strong> <xsl:value-of select="size"/></p>
                                        </div>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <div class="no-history">No history records found. Please check database connection and data.</div>
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
