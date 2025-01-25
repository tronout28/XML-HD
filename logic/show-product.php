<?php
require_once 'services/db_connection.php';

$id = $_GET['id'];

$sql = "SELECT * FROM products WHERE id = $id";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo "ID: " . $row["id"] . "<br>";
    echo "Name: " . $row["name"] . "<br>";
    echo "Price: " . $row["price"] . "<br>";
    echo "Image: " . $row["image"] . "<br>";
    echo "Description: " . $row["description"] . "<br>";
    echo "Size: " . $row["size"] . "<br>";
} else {
    echo "Product not found";
}

$conn->close();
?>