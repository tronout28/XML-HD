<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="sidebar.xsl"/>

    <!-- Parameter ID produk yang diambil dari URL -->
    <xsl:param name="id"/>

    <xsl:template match="/data">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="css/admin-edit.css"/>
                <title>Admin Edit Product</title>
            </head>
            <body>
                <div class="container">
                    <xsl:call-template name="sidebar"/>

                    <div class="form-container">
                        <h2>Edit Product</h2>
                        <form method="POST" action="update-product.php" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="{$id}" />

                            <label for="image">Image:</label>
                            <input type="text" id="image" name="image" placeholder="Enter image URL" value="{product[no=$id]/image}"/>

                            <label for="name">Name:</label>
                            <input type="text" id="name" name="name" placeholder="Enter product name" value="{product[no=$id]/name}"/>

                            <label for="price">Price:</label>
                            <input type="number" id="price" name="price" placeholder="Enter product price" value="{product[no=$id]/price}"/>

                            <label for="description">Description:</label>
                            <textarea id="description" name="description" placeholder="Enter product description">
                                <xsl:value-of select="product[no=$id]/description"/>
                            </textarea>

                            <label for="size">Size:</label>
                            <select id="size" name="size">
                                <option value="S">
                                    <xsl:if test="product[no=$id]/size = 'S'">Selected</xsl:if> Small
                                </option>
                                <option value="M">
                                    <xsl:if test="product[no=$id]/size = 'M'">Selected</xsl:if> Medium
                                </option>
                                <option value="L">
                                    <xsl:if test="product[no=$id]/size = 'L'">Selected</xsl:if> Large
                                </option>
                                <option value="XL">
                                    <xsl:if test="product[no=$id]/size = 'XL'">Selected</xsl:if> Extra Large
                                </option>
                            </select>

                            <button type="submit">Update Product</button>
                        </form>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <!-- Parameter ID -->
    <xsl:param name="id" select="'1'"/> 
</xsl:stylesheet>
