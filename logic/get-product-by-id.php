<?php
require_once 'services/db-connection.php';

// Get the ID from URL parameter
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Create XML header
header('Content-Type: text/xml');
echo '<?xml version="1.0" encoding="UTF-8"?>';
echo '<data>';

if ($id > 0) {
    $stmt = $conn->prepare("SELECT * FROM products WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($row = $result->fetch_assoc()) {
        echo '<product>';
        echo '<id>' . htmlspecialchars($row['id']) . '</id>';
        echo '<name>' . htmlspecialchars($row['name']) . '</name>';
        echo '<price>' . htmlspecialchars($row['price']) . '</price>';
        echo '<description>' . htmlspecialchars($row['description']) . '</description>';
        echo '<size>' . htmlspecialchars($row['size']) . '</size>';
        echo '<image>' . htmlspecialchars($row['image']) . '</image>';
        echo '</product>';
    } else {
        echo '<error>Product not found.</error>';
    }
    $stmt->close();
}

echo '</data>';
$conn->close();
?>
