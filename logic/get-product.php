<?php
require_once '../services/db-connection.php';

// execute SQL query
$sql = "SELECT * FROM products";
$result = $conn->query($sql);

// display results
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "ID: " . $row["id"]. " - Name: " . $row["name"]. " - Price: " . $row["price"]. "<br>";
    }
} else {
    echo "No products found";
}

$conn->close();
?>