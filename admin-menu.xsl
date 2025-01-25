<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="sidebar.xsl"/>

    <xsl:template match="/menu-management">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="css/admin-menu.css"/>
                <title>Admin Menu Management</title>
            </head>
            <body>
                <div class="admin-container">
                    <!-- Panggil Sidebar -->
                    <xsl:call-template name="sidebar"/>

                    <div class="main-content">
                        <div class="header">
                            <h1>Product Management</h1>
                            <a href="admin-add.xml" class="add-new">Add Product</a>
                        </div>

                        <table>
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Description</th>
                                    <th>Size</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Fetch data dari logic/get-product-admin.php -->
                                <xsl:for-each select="document('logic/get-product-admin.php')/products/product">
                                    <tr>
                                        <td><xsl:value-of select="position()"/></td>
                                        <td>
                                            <img src="images/{image/url}" alt="{name}" class="menu-image"/>
                                        </td>
                                        <td><xsl:value-of select="name"/></td>
                                        <td>Rp <xsl:value-of select="price"/></td>
                                        <td><xsl:value-of select="description"/></td>
                                        <td><xsl:value-of select="size"/></td>
                                        <td>
                                            <a href="admin-edit.xml?name={name}" class="edit">Edit</a>
                                            <button class="delete">Delete</button>
                                        </td>
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
