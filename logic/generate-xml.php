<?php
require_once '../services/db-connection.php';

header('Content-Type: application/xml; charset=UTF-8');
echo '<?xml version="1.0" encoding="UTF-8"?>';
echo '<?xml-stylesheet type="text/xsl" href="admin-edit.xsl"?>';
echo '<data>';

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Query data dari database
if ($id > 0) {
    $sql = "SELECT * FROM products WHERE id = $id";
} else {
    $sql = "SELECT * FROM products"; // Ambil semua produk jika ID tidak diberikan
}

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo '<product>';
        echo '<id>' . $row['id'] . '</id>';
        echo '<image>' . htmlspecialchars($row['image']) . '</image>';
        echo '<name>' . htmlspecialchars($row['name']) . '</name>';
        echo '<price>' . $row['price'] . '</price>';
        echo '<description>' . htmlspecialchars($row['description']) . '</description>';
        echo '<size>' . htmlspecialchars($row['size']) . '</size>';
        echo '</product>';
    }
}

echo '</data>';

$conn->close();
?>
