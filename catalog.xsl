<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd"/>

    <xsl:template match="/catalog">
        <html>
            <head>
                <title>Menu Catalog</title>
                <link rel="stylesheet" href="css/catalog.css"/>
                <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            </head>
            <body>
                <header>
                    <div class="logo">
                        <img src="images/logo.png" alt="Restaurant Logo"/>
                    </div>
                    <nav>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#about">About Us</a></li>
                            <li><a href="#menu">Menu</a></li>
                            <li><a href="#contact">Contact</a></li>
                            <li><a href="#testimonials">Testimonials</a></li>
                           <li class="dropdown">
                                <a href="#catalog" id="catalogDropdown" class="dropdown-toggle">Catalog</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#history">History Payment</a></li>
                                </ul>
                            </li>

                        </ul>
                    </nav>
                </header>
                <main>
                    <h1>Menu Catalog</h1>
                    <div class="categories">
                        <xsl:for-each select="category">
                            <section class="category">
                                <h2><xsl:value-of select="name"/></h2>
                                <div class="items-grid">
                                    <xsl:for-each select="item">
                                        <div class="menu-card" data-name="{name}" data-price="{price}">
                                            <div class="menu-card-image">
                                                <img src="{image}" alt="Image of {name}"/>
                                            </div>
                                            <div class="menu-card-content">
                                                <h3><xsl:value-of select="name"/></h3>
                                                <p class="description"><xsl:value-of select="description"/></p>
                                                <div class="price"><xsl:value-of select="price"/></div>
                                                <button type="button" class="order-button" onclick="confirmOrder('{name}')">
                                                    Order Now
                                                </button>
                                            </div>
                                        </div>
                                    </xsl:for-each>
                                </div>
                            </section>
                        </xsl:for-each>
                    </div>
                </main>

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
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>