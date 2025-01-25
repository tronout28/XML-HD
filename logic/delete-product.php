<?php
require_once '../services/db-connection.php';

// get form data
$id = $_POST['id'];

// prepare and execute SQL query
$sql = "DELETE FROM products WHERE id=$id";
if ($conn->query($sql) === TRUE) {
    echo "Record deleted successfully";
} else {
    echo "Error deleting record: " . $conn->error;
}

$conn->close();
?>