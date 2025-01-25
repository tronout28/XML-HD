<?php
require_once '../services/db-connection.php';

// Execute SQL query to fetch all columns
$sql = "SELECT * FROM products";
$result = $conn->query($sql);

// Display all results
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "ID: " . $row["id"] . " - Name: " . $row["name"] . " - Price: " . $row["price"] . 
             " - Image: " . $row["image"] . " - Description: " . $row["description"] . 
             " - Size: " . $row["size"] . "<br>";
    }
} else {
    echo "No products found";
}

$conn->close();
?>
