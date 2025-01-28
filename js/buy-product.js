document.addEventListener("DOMContentLoaded", function () {
    console.log("buy-product.js loaded successfully");
});

// Function untuk konfirmasi order dan mengirim data ke PHP
function confirmOrder(productName, productId) {
    Swal.fire({
        title: "Confirm Order",
        text: `Are you sure you want to order "${productName}"?`,
        icon: "question",
        showCancelButton: true,
        confirmButtonText: "Yes, Order Now",
        cancelButtonText: "Cancel",
    }).then((result) => {
        if (result.isConfirmed) {
            placeOrder(productId);
        }
    });
}

// Function untuk mengirim product_id ke buy-product.php
function placeOrder(productId) {
    fetch("logic/buy-product.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `product_id=${productId}`,
    })
    .then(response => response.text()) // Ambil respons sebagai teks
    .then(text => {
        console.log("Server response:", text); // Debugging
        return JSON.parse(text); // Ubah ke JSON
    })
    .then(data => {
        if (data.status === "success") {
            Swal.fire({
                title: "Success!",
                text: data.message,
                icon: "success",
                confirmButtonText: "OK",
            });
        } else {
            Swal.fire({
                title: "Error!",
                text: data.message,
                icon: "error",
                confirmButtonText: "OK",
            });
        }
    })
    .catch(error => {
        console.error("Error placing order:", error);
        Swal.fire({
            title: "Error!",
            text: "An unexpected error occurred. Please try again later.",
            icon: "error",
            confirmButtonText: "OK",
        });
    });    
}
