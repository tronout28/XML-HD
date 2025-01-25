<?php
// Include database connection
require_once '../services/db-connection.php';

// Start session if not already started
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        // Get data from POST request
        $user_id = $_POST['user_id']; 
        $product_id = $_POST['product_id'];
        
        // Get product price from products table
        $stmt = $conn->prepare("SELECT price FROM products WHERE id = ?");
        $stmt->execute([$product_id]);
        $product = $stmt->fetch(PDO::FETCH_ASSOC);
        
        // Calculate total price (you can modify this based on your needs)
        $total_price = $product['price'];
        
        // Prepare insert statement
        $stmt = $conn->prepare("INSERT INTO user_product (user_id, product_id, total_price) VALUES (?, ?, ?)");
        
        // Execute the statement with values
        $stmt->execute([$user_id, $product_id, $total_price]);
        
        // Send success response
        echo json_encode([
            'status' => 'success',
            'message' => 'Product purchased successfully'
        ]);
        
    } catch (PDOException $e) {
        // Handle errors
        echo json_encode([
            'status' => 'error',
            'message' => 'Failed to process purchase: ' . $e->getMessage()
        ]);
    }
} else {
    // If not POST request, return error
    echo json_encode([
        'status' => 'error',
        'message' => 'Invalid request method'
    ]);
}
?>