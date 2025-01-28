<?php
// Matikan output buffering dan bersihkan
ob_start();

// Include database connection
require_once '../services/db-connection.php';

// Set header JSON
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

// Handle preflight OPTIONS request
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    // Set CORS headers untuk preflight
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: POST, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type");
    http_response_code(200);
    exit;
}

// Sementara: Aktifkan error reporting untuk melihat kesalahan
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Start session
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Check request method
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405); // Method Not Allowed
    echo json_encode([
        'status' => 'error',
        'message' => 'Invalid request method. Only POST is allowed.'
    ]);
    exit;
}

try {
    // Validate and sanitize input
    $user_id = filter_input(INPUT_POST, 'user_id', FILTER_VALIDATE_INT);
    $product_id = filter_input(INPUT_POST, 'product_id', FILTER_VALIDATE_INT);

    if (!$user_id || !$product_id) {
        throw new Exception('Invalid user ID or product ID.');
    }

    // Check user authentication (optional, based on session)
    if (!isset($_SESSION['user_id']) || $_SESSION['user_id'] != $user_id) {
        throw new Exception('User not authenticated. Please log in.');
    }

    // Fetch product details
    $stmt = $conn->prepare("SELECT price FROM products WHERE id = ?");
    $stmt->execute([$product_id]);
    $product = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$product) {
        throw new Exception('Product not found.');
    }

    $total_price = $product['price'];

    // Insert into user_product
    $stmt = $conn->prepare("INSERT INTO user_product (user_id, product_id, total_price) VALUES (?, ?, ?)");
    $stmt->execute([$user_id, $product_id, $total_price]);

    // Return success response
    ob_clean();
    echo json_encode([
        'status' => 'success',
        'message' => 'Product purchased successfully'
    ]);
} catch (Exception $e) {
    // Pastikan buffer bersih
    ob_clean();

    // Tangani pesan kesalahan dengan format JSON
    echo json_encode([
        'status' => 'error',
        'message' => 'Failed to process purchase: ' . $e->getMessage()
    ]);
    http_response_code(500); // Pastikan mengembalikan kode error 500
}
exit;
