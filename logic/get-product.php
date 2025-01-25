<?php
require_once '../services/db-connection.php';

// Create a new XML document
$xml = new SimpleXMLElement('<?xml version="1.0" encoding="UTF-8"?><contact/>');

// Execute SQL query to fetch all columns
$sql = "SELECT * FROM products";
$result = $conn->query($sql);

// Add products to XML
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
        $product->addChild('title', htmlspecialchars($row['name']));
    }
}

// Output XML
header('Content-Type: application/xml');
echo $xml->asXML();

$conn->close();
?>