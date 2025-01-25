<?php
require_once '../services/db-connection.php';

// Menyiapkan header untuk output XML
header('Content-Type: application/xml');

// Buat objek DOMDocument untuk menghasilkan XML
$doc = new DOMDocument();
$root = $doc->createElement("menu-management");
$doc->appendChild($root);

// Query untuk mengambil semua produk dari tabel 'products'
$sql = "SELECT * FROM products";
$result = $conn->query($sql);

// Jika ada hasil, tambahkan elemen ke dalam XML
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $menu = $doc->createElement("menu");

        $no = $doc->createElement("no", $row["id"]);
        $menu->appendChild($no);

        $image = $doc->createElement("image", $row["image"]);
        $menu->appendChild($image);

        $name = $doc->createElement("name", $row["name"]);
        $menu->appendChild($name);

        $price = $doc->createElement("price", $row["price"]);
        $menu->appendChild($price);

        $description = $doc->createElement("description", $row["description"]);
        $menu->appendChild($description);

        $size = $doc->createElement("size", $row["size"]);
        $menu->appendChild($size);

        $root->appendChild($menu);
    }
} else {
    $noProducts = $doc->createElement("message", "No products found");
    $root->appendChild($noProducts);
}

// Output XML
echo $doc->saveXML();

// Menutup koneksi database
$conn->close();
?>
