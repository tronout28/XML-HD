<?php
require_once '../services/db-connection.php';

// get form data
$name = $_POST['name'];
$price = $_POST['price'];
$image = $_POST['image'];
$description = $_POST['description'];
$size = $_POST['size'];

// prepare and execute SQL query
$sql = "INSERT INTO products (name, price, image, description, size) VALUES ('$name', $price, '$image', '$description', '$size')";
if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>