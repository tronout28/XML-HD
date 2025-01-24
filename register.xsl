<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Register Page</title>
                <link rel="stylesheet" type="text/css" href="css/register.css" />
            </head>
            <body>
                <div class="login-container">
                    <xsl:apply-templates select="registerPage/header" />
                    <xsl:apply-templates select="registerPage/content" />
                    <script src="js/register.js" type="text/javascript"></script>
                </div>
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
        <h2>Register</h2>
        <form id="registerForm">
            <xsl:for-each select="form/input">
                <div class="form-group">
                    <input>
                        <xsl:attribute name="type">
                            <xsl:value-of select="type" />
                        </xsl:attribute>
                        <xsl:attribute name="name">
                            <xsl:value-of select="type" />
                        </xsl:attribute>
                        <xsl:attribute name="placeholder">
                            <xsl:value-of select="placeholder" />
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
        </form >
        <div id="message" class="message"></div>
        <div class="additional-info">
            <xsl:value-of select="additionalInfo/login" disable-output-escaping="yes" />
        </div>
    </xsl:template>
</xsl:stylesheet>