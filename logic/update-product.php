<?php
require_once '../services/db-connection.php';

// get form data
$id = $_POST['id'];
$name = $_POST['name'];
$price = $_POST['price'];
$image = $_POST['image'];
$description = $_POST['description'];
$size = $_POST['size'];

// prepare and execute SQL query
$sql = "UPDATE products SET name='$name', price=$price, image='$image', description='$description', size='$size' WHERE id=$id";
if ($conn->query($sql) === TRUE) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . $conn->error;
}

$conn->close();
?>