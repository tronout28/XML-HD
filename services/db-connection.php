<?php
$host = "localhost"; // Server database
$username = "root"; // Username database
$password = ""; // Password database
$database = "xml_sepatu"; // Nama database

// Membuat koneksi
$conn = new mysqli($host, $username, $password, $database);

// Cek koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
?>
