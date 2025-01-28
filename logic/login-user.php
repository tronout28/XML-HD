<?php
// Matikan output buffering dan bersihkan
ob_start();

// Set header JSON
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

// Matikan error reporting
error_reporting(0);
ini_set('display_errors', 0);

session_start(); // Mulai session

// Array untuk response
$response = [];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    try {
        include '../services/db-connection.php';

        $email = trim($_POST['email']);
        $password = trim($_POST['password']);

        if (empty($email) || empty($password)) {
            $response = [
                'status' => 'error',
                'message' => 'Email dan password tidak boleh kosong.'
            ];
        } else {
            // Query untuk mengecek email dan password
            $sql = "SELECT * FROM users WHERE email = ? AND password = ? AND role = 'customer'";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ss", $email, $password);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $user = $result->fetch_assoc();
                $_SESSION['user_id'] = $user['id'];
                
                $response = [
                    'status' => 'success',
                    'message' => 'Login berhasil sebagai customer! Selamat datang, ' . htmlspecialchars($user['name']),
                    'userId' => $user['id']
                ];
            } else {
                $response = [
                    'status' => 'error',
                    'message' => 'Login gagal! Email atau password salah.'
                ];
            }

            $stmt->close();
            $conn->close();
        }
    } catch (Exception $e) {
        $response = [
            'status' => 'error',
            'message' => 'Terjadi kesalahan sistem.'
        ];
    }
} else {
    $response = [
        'status' => 'error',
        'message' => 'Invalid request method'
    ];
}

// Bersihkan output buffer
ob_clean();

// Keluarkan response JSON
echo json_encode($response);
exit;
?>