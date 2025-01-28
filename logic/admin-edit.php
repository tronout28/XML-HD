<?php
require_once '../services/db-connection.php';

// Ambil ID dari URL
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Query untuk mengambil data produk berdasarkan ID
$sql = "SELECT * FROM products WHERE id = $id";
$result = $conn->query($sql);

// Periksa apakah produk ditemukan
if ($result->num_rows > 0) {
    $product = $result->fetch_assoc();
} else {
    die("Product not found.");
}

// Tampilkan halaman dengan XSLT
$dom = new DOMDocument();
$dom->load('admin-edit.xsl'); // Template XSL

// Buat transformasi XSLT
$xslt = new XSLTProcessor();
$xslt->importStylesheet($dom);

// Render HTML dan tambahkan data produk menggunakan PHP
echo str_replace(
    [
        'value="" id="id"',
        'value="" id="image"',
        'value="" id="name"',
        'value="" id="price"',
        'placeholder="Enter product description"></textarea>',
        'value="M"',
        'value="L"',
        'value="XL"',
    ],
    [
        'value="' . htmlspecialchars($product['id']) . '" id="id"',
        'value="' . htmlspecialchars($product['image']) . '" id="image"',
        'value="' . htmlspecialchars($product['name']) . '" id="name"',
        'value="' . htmlspecialchars($product['price']) . '" id="price"',
        'placeholder="Enter product description">' . htmlspecialchars($product['description']) . '</textarea>',
        $product['size'] == 'M' ? 'value="M" selected' : 'value="M"',
        $product['size'] == 'L' ? 'value="L" selected' : 'value="L"',
        $product['size'] == 'XL' ? 'value="XL" selected' : 'value="XL"',
    ],
    $xslt->transformToXML(new DOMDocument())
);
?>
