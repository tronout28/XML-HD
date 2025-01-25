<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="sidebar.xsl"/>

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="css/admin-add.css"/>
                <title>Admin Add Product</title>
            </head>
            <body>
                <!-- Container utama -->
                <div class="container">
                    <!-- Import sidebar -->
                    <xsl:call-template name="sidebar"/>

                    <!-- Form untuk pengisian data -->
                    <div class="form-container">
                        <h2>Add Product</h2>
                        <form action="logic/add-product.php" method="POST" enctype="multipart/form-data">
                            <label for="image">Image:</label>
                            <input type="file" id="image" name="image" required="required"/>

                            <label for="name">Name:</label>
                            <input type="text" id="name" name="name" placeholder="Enter product name" required="required"/>

                            <label for="price">Price:</label>
                            <input type="number" id="price" name="price" placeholder="Enter product price" required="required"/>

                            <label for="description">Description:</label>
                            <textarea id="description" name="description" placeholder="Enter product description" required="required"></textarea>

                            <label for="size">Size:</label>
                            <select id="size" name="size" required="required">
                                <option value="S">Small</option>
                                <option value="M">Medium</option>
                                <option value="L">Large</option>
                                <option value="XL">Extra Large</option>
                            </select>

                            <button type="submit">Submit</button>
                        </form>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
