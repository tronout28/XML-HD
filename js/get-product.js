document.addEventListener('DOMContentLoaded', function () {
    const contactSection = document.getElementById('contact');
    const productContainer = contactSection.querySelector('.row');

    // Function to fetch data from PHP
    async function fetchProducts() {
        try {
            const response = await fetch('logic/get-product.php');
            
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            
            const xmlText = await response.text();
            const parser = new DOMParser();
            const xmlDoc = parser.parseFromString(xmlText, "text/xml");
            
            // Parse products from XML
            const products = xmlDoc.getElementsByTagName('product');
            productContainer.innerHTML = ''; // Clear existing content

            Array.from(products).forEach((product) => {
                const id = product.querySelector('id')?.textContent || '';
                const title = product.querySelector('title')?.textContent || '';
                const description = product.querySelector('description')?.textContent || '';
                const price = product.querySelector('price')?.textContent || '';
                const image = product.querySelector('image')?.textContent || '';

                // Create product card
                const productCard = `
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <img src="${image}" class="card-img-top" alt="${title}" />
                            <div class="card-body">
                                <h5 class="card-title">${title}</h5>
                                <p class="card-text">${description}</p>
                                <p class="card-text"><strong>Price: $${price}</strong></p>
                                <button type="button" 
                                        class="btn btn-primary order-button" 
                                        data-product-id="${id}" 
                                        onclick="confirmOrder('${title}')">
                                    Order Now
                                </button>
                            </div>
                        </div>
                    </div>
                `;
                productContainer.innerHTML += productCard;
            });
        } catch (error) {
            console.error('Error fetching products:', error);
            productContainer.innerHTML = '<p class="text-danger">Failed to load products. Please try again later.</p>';
        }
    }

    // Confirm order function (already defined)
    function confirmOrder(productName) {
        Swal.fire({
            title: 'Purchase Confirmation',
            text: `Do you want to buy "${productName}"?`,
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#ff6b6b',
            cancelButtonColor: '#6c757d',
            confirmButtonText: 'Yes',
            cancelButtonText: 'No',
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire('Order Placed!', `Your order for "${productName}" has been placed successfully.`, 'success');
            }
        });
    }
    

    // Fetch products on page load
    fetchProducts();
    confirmOrder();
});
