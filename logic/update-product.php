<?php
require_once '../services/db-connection.php';

// Pastikan folder `public/images` ada dan dapat ditulis
$uploadDir = '../public/images/'; // Lokasi folder tujuan

// Ambil data dari form
$id = $_POST['id'];
$name = $_POST['name'];
$price = $_POST['price'];
$description = $_POST['description'];
$size = $_POST['size'];
$imageName = '';

// Periksa apakah file diunggah
if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
    $imageTmpPath = $_FILES['image']['tmp_name'];
    $imageName = basename($_FILES['image']['name']);
    $imageSize = $_FILES['image']['size'];
    $imageType = $_FILES['image']['type'];

    // Validasi tipe file
    $allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
    if (!in_array($imageType, $allowedTypes)) {
        die("Error: Only JPG, PNG, and GIF files are allowed.");
    }

    // Pastikan nama file unik
    $uniqueFileName = time() . '_' . $imageName;
    $targetFilePath = $uploadDir . $uniqueFileName;

    // Pindahkan file ke folder tujuan
    if (move_uploaded_file($imageTmpPath, $targetFilePath)) {
        echo "File uploaded successfully.";
        $imageName = $uniqueFileName; // Simpan nama file untuk database
    } else {
        die("Error: Failed to upload file.");
    }
}

// Jika gambar baru diunggah, gunakan nama file baru. Jika tidak, tetap gunakan nama file lama.
$imageSqlPart = $imageName ? "image='$imageName'," : "";

// Update data ke database
$sql = "UPDATE products SET 
    name='$name', 
    price=$price, 
    $imageSqlPart
    description='$description', 
    size='$size' 
    WHERE id=$id";

if ($conn->query($sql) === TRUE) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . $conn->error;
}

$conn->close();
?>
