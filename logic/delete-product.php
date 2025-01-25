<?php
require_once '../services/db-connection.php';

// Check if the 'id' parameter is set
if (isset($_POST['id'])) {
    $id = $_POST['id'];

    // Prepare the SQL query
    $stmt = $conn->prepare("DELETE FROM products WHERE id = ?");
    $stmt->bind_param("i", $id); // 'i' indicates the parameter type is integer

    // Execute the query
    if ($stmt->execute()) {
        echo "Record deleted successfully";
    } else {
        echo "Error deleting record: " . $stmt->error;
    }

    // Close the statement
    $stmt->close();
} else {
    echo "Invalid request: ID is missing";
}

// Close the database connection
$conn->close();
