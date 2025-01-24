<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xhtml="http://www.w3.org/1999/xhtml">
    <xsl:template name="sidebar">

        <xsl:element name="link" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="rel">stylesheet</xsl:attribute>
            <xsl:attribute name="type">text/css</xsl:attribute>
            <xsl:attribute name="href">css/sidebar.css</xsl:attribute>
        </xsl:element>
        
        <div class="sidebar">
            <div class="logo">
                <h2>Admin</h2>
            </div>
            <nav>
                <ul>
                    <li >
                        <a href="admin-menu.xml">Product Management</a>
                    </li>
                    <li>
                        <a href="admin-user.xml">User Management</a>
                    </li>
                </ul>
            </nav>
        </div>
    </xsl:template>
</xsl:stylesheet>

