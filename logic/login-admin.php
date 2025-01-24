<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include '../services/db-connection.php';

    $email = $_POST['email'];
    $password = $_POST['password'];

    // Query untuk mengecek email dan password admin
    $sql = "SELECT * FROM users WHERE email = ? AND password = ? AND role = 'admin'";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $email, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $admin = $result->fetch_assoc();
        echo "Login berhasil sebagai admin! Selamat datang, " . $admin['name'];
    } else {
        echo "Login gagal! Email atau password salah.";
    }

    $stmt->close();
    $conn->close();
}
?>