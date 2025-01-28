<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Include database connection
require_once __DIR__ . '/../services/db-connection.php';

// Function to sanitize input
function sanitize_input($conn, $data) {
    return mysqli_real_escape_string($conn, trim($data));
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    if (isset($_POST["product_id"]) && !empty($_POST["product_id"])) {
        // Sanitize input
        $product_id = sanitize_input($conn, $_POST["product_id"]);
        
        // Validate that product_id is numeric
        if (!is_numeric($product_id)) {
            echo json_encode([
                "status" => "error",
                "message" => "Invalid product ID format"
            ]);
            exit;
        }

        // Prepare the SQL query
        $query = "INSERT INTO histories (product_id) VALUES ('$product_id')";
        
        // Execute the query
        if ($conn->query($query)) {
            echo json_encode([
                "status" => "success",
                "message" => "Order placed successfully"
            ]);
        } else {
            error_log("Database error: " . $conn->error);
            echo json_encode([
                "status" => "error",
                "message" => "Failed to place order",
                "debug" => $conn->error
            ]);
        }
    } else {
        echo json_encode([
            "status" => "error",
            "message" => "Product ID is required"
        ]);
    }
} else {
    echo json_encode([
        "status" => "error",
        "message" => "Invalid request method"
    ]);
}

// Close the database connection
$conn->close();
?>