<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="sidebar.xsl"/>

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="css/admin-user.css"/>
                <title>User Management</title>
            </head>
            <body>
                <div class="user-container">
                    <xsl:call-template name="sidebar"/>
                    
                    <div class="main-content">
                        <div class="header">
                            <h1>User Management</h1>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Image</th>
                                    <th>Email</th>
                                    <th>Name</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="user-management/user">
                                    <tr>
                                        <td><xsl:value-of select="no"/></td>
                                        <td>
                                            <img src="images/{image}" alt="{name}" class="user-image"/>
                                        </td>
                                        <td><xsl:value-of select="email"/></td>
                                        <td><xsl:value-of select="name"/></td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
