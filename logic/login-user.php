<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200);
    exit();
}

session_start(); // Mulai session

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include '../services/db-connection.php';

    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    if (empty($email) || empty($password)) {
        echo "Email dan password tidak boleh kosong.";
        exit();
    }

    // Query untuk mengecek email dan password
    $sql = "SELECT * FROM users WHERE email = ? AND password = ? AND role = 'customer'";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $email, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        // Simpan user ID dalam session
        $_SESSION['user_id'] = $user['id'];

        echo "Login berhasil sebagai customer! Selamat datang, " . htmlspecialchars($user['name']);
    } else {
        echo "Login gagal! Email atau password salah.";
    }

    $stmt->close();
    $conn->close();
}
?>
