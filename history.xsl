<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Your Orders</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f9f9f9;
                        color: #333;
                        margin: 0;
                        padding: 0;
                    }
                    .container {
                        max-width: 800px;
                        margin: 20px auto;
                        background: #fff;
                        padding: 20px;
                        border-radius: 8px;
                        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                    }
                    .order {
                        margin-bottom: 20px;
                        padding: 15px;
                        border: 1px solid #ddd;
                        border-radius: 8px;
                    }
                    .order-header {
                        display: flex;
                        justify-content: space-between;
                        margin-bottom: 10px;
                    }
                    .order-header div {
                        font-size: 14px;
                    }
                    .product {
                        display: flex;
                        margin-top: 10px;
                    }
                    .product img {
                        width: 100px;
                        height: 100px;
                        margin-right: 15px;
                        border-radius: 8px;
                        border: 1px solid #ddd;
                    }
                    .product-details {
                        font-size: 14px;
                    }
                    .product-details h4 {
                        margin: 0;
                        font-size: 16px;
                    }
                    .actions a {
                        text-decoration: none;
                        color: #6200EE;
                        margin-right: 10px;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1>Your Orders</h1>
                    <xsl:for-each select="orders/order">
                        <div class="order">
                            <div class="order-header">
                                <div>Order Date: <xsl:value-of select="orderDate"/></div>
                                <div>Total Amount: <xsl:value-of select="totalAmount"/></div>
                                <div>Ship To: <xsl:value-of select="shipTo"/></div>
                                <div>Order #: <xsl:value-of select="orderNumber"/></div>
                            </div>
                            <div class="delivery-date">
                                Delivered <xsl:value-of select="deliveryDate"/>
                            </div>
                            <div class="product">
                                <img src="{product/image}" alt="Product Image"/>
                                <div class="product-details">
                                    <h4><xsl:value-of select="product/name"/></h4>
                                    <div>Return or Replace items: <xsl:value-of select="product/returnEligible"/></div>
                                    <div class="actions">
                                        <a href="#">Buy it again</a>
                                        <a href="#">View Product</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
