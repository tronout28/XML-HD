<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="loginPage/content/title" /></title>
                <link rel="stylesheet" type="text/css" href="css/login.css" />
            </head>
            <body>
                <div class="login-container">
                    <xsl:apply-templates select="loginPage/header" />
                    <xsl:apply-templates select="loginPage/content" />
                </div>
                <script src="js/login.js" type="text/javascript"></script>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="header">
        <div class="header">
            <img>
                <xsl:attribute name="src">
                    <xsl:value-of select="logo/url" />
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="logo/altText" />
                </xsl:attribute>
            </img>
        </div>
    </xsl:template>

    <xsl:template match="content">
        <div class="login-content">
            <h2><xsl:value-of select="title" /></h2>
            <form id="loginForm" method="post" action="logic/login-user.php">
                <xsl:for-each select="form/input">
                    <div class="form-group">
                        <input>
                            <xsl:attribute name="type">
                                <xsl:value-of select="type" />
                            </xsl:attribute>
                            <xsl:attribute name="placeholder">
                                <xsl:value-of select="placeholder" />
                            </xsl:attribute>
                            <xsl:attribute name="name">
                                <xsl:value-of select="name" />
                            </xsl:attribute>
                            <xsl:if test="required = 'true'">
                                <xsl:attribute name="required">required</xsl:attribute>
                            </xsl:if>
                        </input>
                    </div>
                </xsl:for-each>

                <button type="submit">
                    <xsl:value-of select="form/button/label" />
                </button>
            </form>
            <div id="message"></div>
            <div class="additional-info">
                <xsl:value-of select="additionalInfo/register" disable-output-escaping="yes" />
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>