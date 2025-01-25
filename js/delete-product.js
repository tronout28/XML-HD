// Function to handle delete action
async function deleteProduct(productId) {
    if (confirm('Are you sure you want to delete this product?')) {
        try {
            const response = await fetch('logic/delete-product.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: `id=${productId}`
            });

            const result = await response.text();
            alert(result);

            if (response.ok) {
                // Reload table data or refresh page
                window.location.reload();
            }
        } catch (error) {
            console.error('Error:', error);
            alert('Failed to delete the product. Please try again later.');
        }
    }
}
