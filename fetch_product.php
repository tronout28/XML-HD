<?php
require_once 'services/db_connection.php';

header('Content-Type: application/json');

$id = $_GET['id'];

$sql = "SELECT * FROM products WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode([
        'id' => $row['id'],
        'name' => $row['name'],
        'price' => $row['price'],
        'image' => $row['image'],
        'description' => $row['description'],
        'size' => $row['size']
    ]);
} else {
    http_response_code(404);
    echo json_encode(['error' => 'Product not found']);
}

$stmt->close();
$conn->close();
?>