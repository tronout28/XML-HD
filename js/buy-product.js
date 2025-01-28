// Function to get user ID from session storage
function getCurrentUserId() {
    return sessionStorage.getItem('userId');
}

async function handlePurchase(productId) {
    const userId = getCurrentUserId();
    
    if (!userId) {
        Swal.fire({
            title: 'Please Login',
            text: 'You need to be logged in to make a purchase',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Login Now',
            cancelButtonText: 'Cancel'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = 'login.xml';
            }
        });
        return;
    }

    const formData = new FormData();
    formData.append('user_id', userId);
    formData.append('product_id', productId);

    try {
        const response = await fetch('logic/buy-product.php', {
            method: 'POST',
            body: formData,
            headers: {
                'Accept': 'application/json'
            }
        });

        const data = await response.json();

        if (data.status === 'success') {
            Swal.fire({
                title: 'Success!',
                text: data.message,
                icon: 'success'
            });
        } else {
            throw new Error(data.message);
        }
    } catch (error) {
        Swal.fire({
            title: 'Error',
            text: error.message || 'Failed to process purchase',
            icon: 'error'
        });
    }
}

// Confirmation dialog function
function confirmOrder(productName, productId) {
    Swal.fire({
        title: 'Purchase Confirmation',
        text: `Do you want to buy ${productName}?`,
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#ff6b6b',
        cancelButtonColor: '#6c757d',
        confirmButtonText: 'Yes',
        cancelButtonText: 'No'
    }).then((result) => {
        if (result.isConfirmed) {
            handlePurchase(productId);
        }
    });
}

// Handle dropdown menu if exists
document.addEventListener('DOMContentLoaded', function () {
    const dropdownToggle = document.getElementById('catalogDropdown');
    if (dropdownToggle) {  // Check if element exists first
        const dropdown = dropdownToggle.closest('.dropdown');
        const dropdownMenu = dropdown.querySelector('.dropdown-menu');

        dropdownToggle.addEventListener('click', function (e) {
            e.preventDefault();
            dropdown.classList.toggle('active');
            dropdownMenu.classList.toggle('active');
        });

        document.addEventListener('click', function (e) {
            if (!dropdown.contains(e.target)) {
                dropdown.classList.remove('active');
                dropdownMenu.classList.remove('active');
            }
        });
    }
});
