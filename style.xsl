<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/restaurantWebsite">
        <html>
             <head>
                <title>Shoes</title>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
                <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                        <xsl:for-each select="document('logic/get-product.php')/products/product">
                            <div class="col-md-4 mb-4">
                                <div class="card">
                                    <img src="{image}" class="card-img-top" alt="{title}"/>
                                    <div class="card-body">
                                        <h5 class="card-title"><xsl:value-of select="title"/></h5>
                                        <p class="card-text"><xsl:value-of select="description"/></p>
                                        <p class="card-text"><strong>Price: $<xsl:value-of select="price"/></strong></p>
                                        <button type="button" 
                                                class="btn btn-primary order-button" 
                                                data-product-id="{id}" 
                                                onclick="confirmOrder('{title}')">
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
            <script type="text/javascript">
                    //<![CDATA[
                    function confirmOrder(productName) {
                        Swal.fire({
                            title: 'purchase confirmation.',
                            text: 'Do you want to buy this product?',
                            icon: 'question',
                            showCancelButton: true,
                            confirmButtonColor: '#ff6b6b',
                            cancelButtonColor: '#6c757d',
                            confirmButtonText: 'Yes',
                            cancelButtonText: 'No'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                Swal.fire(
                                    'Succes!',
                                    'Order ' + productName + 'has been received.',
                                    'success'
                                );
                            }
                        });
                    }

                    // Menambahkan event listener setelah DOM loaded
                    document.addEventListener('DOMContentLoaded', function() {
                        const orderButtons = document.querySelectorAll('.order-button');
                        orderButtons.forEach(button => {
                            button.addEventListener('click', function() {
                                const card = this.closest('.menu-card');
                                const productName = card.dataset.name;
                                confirmOrder(productName);
                            });
                        });
                    });

                    document.addEventListener('DOMContentLoaded', function () {
                        const dropdownToggle = document.getElementById('catalogDropdown');
                        const dropdown = dropdownToggle.closest('.dropdown');
                        const dropdownMenu = dropdown.querySelector('.dropdown-menu');

                        // Event listener untuk toggle dropdown
                        dropdownToggle.addEventListener('click', function (e) {
                            e.preventDefault();
                            dropdown.classList.toggle('active');
                            dropdownMenu.classList.toggle('active');
                        });

                        // Tutup dropdown jika mengklik di luar
                        document.addEventListener('click', function (e) {
                            if (!dropdown.contains(e.target)) {
                                dropdown.classList.remove('active');
                                dropdownMenu.classList.remove('active');
                            }
                        });
                    });

                    //]]>
                </script>
        </html>
    </xsl:template>

</xsl:stylesheet>