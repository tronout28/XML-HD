<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/restaurantWebsite">
        <html>
            <head>
                <title>Restaurant Website</title>
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
                            <li><a href="#slideshow">Gallery</a></li>
                            <li><a href="#contact">Contact</a></li>
                            <li><a href="#testimonials">Testimonials</a></li>
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
                <section id="contact">
                    <h2>Contact Us</h2>
                    <p>Address: <xsl:value-of select="contact/address"/></p>
                    <p>Phone: <xsl:value-of select="contact/phone"/></p>
                    <p>Email: <a href="mailto:{contact/email}"><xsl:value-of select="contact/email"/></a></p>
                    <div class="social-media">
                        <ul>
                            <li><a href="{contact/socialMedia/facebook}" class="facebook">Facebook</a></li>
                            <li><a href="{contact/socialMedia/instagram}" class="instagram">Instagram</a></li>
                            <li><a href="{contact/socialMedia/twitter}" class="twitter">Twitter</a></li>
                        </ul>
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

                <!-- JavaScript references at the end of body -->
                <script src="js/slideshow.js"></script>
                <script src="js/scroll-navigation.js"></script>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>