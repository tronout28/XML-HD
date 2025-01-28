<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/restaurantWebsite">
        <html>
             <head>
                <title>Shoes</title>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
                <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <script type="text/javascript" src="js/buy-product.js"></script>
                <link rel="stylesheet" type="text/css" href="css/style.css"/>
            </head>
            <body>
                <!-- Header Section -->
                <header>
                    <div class="logo">
                        <img src="{header/logo/url}" alt="{header/logo/altText}"/>
                    </div>
                    <nav>
                        <ul>
                            <li><a href="#" class="active">Home</a></li>
                            <li><a href="#about">About Us</a></li>
                            <li><a href="#slideshow">Clothes</a></li>
                            <li><a href="#contact">Shoes</a></li>
                            <li><a href="history.xml">History</a></li>
                        </ul>
                    </nav>
                </header>

                <!-- About Us Section -->
                <section id="about">
                    <h2><xsl:value-of select="about/namec"/></h2>
                    <p><xsl:value-of select="about/description"/></p>
                    <p><xsl:value-of select="about/vision"/></p>
                    <ul>
                        <xsl:for-each select="about/mission/item">
                            <li><xsl:value-of select="."/></li>
                        </xsl:for-each>
                    </ul>
                </section>

                <!-- Slideshow Section -->
                <section id="slideshow">
                    <xsl:for-each select="slideshow/image">
                        <div class="slide">
                            <xsl:if test="position() = 1">
                                <xsl:attribute name="class">slide active</xsl:attribute>
                            </xsl:if>
                            <img src="{url}" alt="{caption}"/>
                            <p><xsl:value-of select="caption"/></p>
                        </div>
                    </xsl:for-each>
                </section>

                <!-- Contact Section -->
                <section id="contact" class="container my-5">
                    <h2 class="text-center mb-4">Recommended for You</h2>
                    <div class="row">
                       <xsl:for-each select="document('logic/get-product.php')/contact/product">
                            <div class="col-md-4 mb-4">
                                <div class="card">
                                    <img src="{image}" class="card-img-top" alt="{name}"/>
                                    <div class="card-body">
                                        <h5 class="card-title"><xsl:value-of select="name"/></h5>
                                        <p class="card-text"><xsl:value-of select="description"/></p>
                                        <p class="card-text">Price: $<xsl:value-of select="price"/></p>
                                        <p class="card-text">Size: <xsl:value-of select="size"/></p>
                                        <button type="button" class="order-button" onclick="confirmOrder('{name}', '{id}')">
                                            Order Now
                                        </button>
                                    </div>
                                </div>  
                            </div>
                        </xsl:for-each>

                    </div>
                </section>

                <!-- Testimonials Section -->
                <section id="testimonials">
                    <h2>Customer Testimonials</h2>
                    <div class="testimonials-wrapper">
                        <xsl:for-each select="testimonials/testimonial">
                            <div class="testimonial">
                                <h3><xsl:value-of select="name"/> <span>(<xsl:value-of select="date"/>)</span></h3>
                                <p><xsl:value-of select="content"/></p>
                            </div>
                        </xsl:for-each>
                    </div>
                </section>

                <!-- Footer Section -->
                <footer>
                    <div class="footer-container">
                        <div class="footer-section">
                            <h3>About Us</h3>
                            <p><xsl:value-of select="about/description"/></p>
                        </div>
                        <div class="footer-section footer-links">
                            <h3>Quick Links</h3>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#about">About Us</a></li>
                                <li><a href="#slideshow">Gallery</a></li>
                                <li><a href="#contact">Contact</a></li>
                                <li><a href="#testimonials">Testimonials</a></li>
                                <li><a href="catalog.xml" target="_blank">Catalog</a></li>

                            </ul>
                        </div>
                        <div class="footer-section footer-contact">
                            <h3>Contact Info</h3>
                            <p>Address: <xsl:value-of select="contact/address"/></p>
                            <p>Phone: <xsl:value-of select="contact/phone"/></p>
                            <p>Email: <xsl:value-of select="contact/email"/></p>
                        </div>
                        <div class="footer-copyright">
                            <p>© 2024 Rumah Makan Lezat. All rights reserved.</p>
                        </div>
                    </div>
                </footer>

                <!-- JavaScript -->
                <script src="js/slideshow.js"></script>
                <script src="js/scroll-navigation.js"></script>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>