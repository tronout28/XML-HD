<?php
require_once '../services/db-connection.php'; // Sambungkan ke database

// Buat dokumen XML baru
$xml = new SimpleXMLElement('<?xml version="1.0" encoding="UTF-8"?><products/>');

// Ambil data dari tabel products
$sql = "SELECT * FROM products";
$result = $conn->query($sql);

// Tambahkan data ke XML jika ada hasil
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $product = $xml->addChild('product');
        $product->addChild('id', $row['id']);
        $product->addChild('name', htmlspecialchars($row['name']));
        $product->addChild('price', $row['price']);
        
        $image = $product->addChild('image');
        $image->addChild('url', htmlspecialchars($row['image']));
        
        $product->addChild('description', htmlspecialchars($row['description']));
        $product->addChild('size', $row['size']);
    }
}

// Tampilkan XML
header('Content-Type: application/xml');
echo $xml->asXML();

$conn->close();
?>
