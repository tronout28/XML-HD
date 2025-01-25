<?php
require_once '../services/db-connection.php';

// Pastikan folder `public/images` ada dan dapat ditulis
$uploadDir = '../public/images/'; // Lokasi folder tujuan

// Ambil data dari form
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

    // Validasi tipe file (opsional: tambahkan validasi ukuran)
    $allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
    if (!in_array($imageType, $allowedTypes)) {
        die("Error: Only JPG, PNG, and GIF files are allowed.");
    }

    // Pastikan nama file unik untuk menghindari konflik
    $uniqueFileName = time() . '_' . $imageName;
    $targetFilePath = $uploadDir . $uniqueFileName;

    // Pindahkan file ke folder tujuan
    if (move_uploaded_file($imageTmpPath, $targetFilePath)) {
        echo "File uploaded successfully.";
        $imageName = $uniqueFileName; // Simpan nama file untuk database
    } else {
        die("Error: Failed to upload file.");
    }
} else {
    die("Error: No file uploaded or an error occurred during upload.");
}

// Masukkan data ke database
$sql = "INSERT INTO products (name, price, image, description, size) VALUES ('$name', $price, '$imageName', '$description', '$size')";
if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
    header('Location: ../admin/dashboard.php'); // Redirect ke halaman admin setelah berhasil
    exit();
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
