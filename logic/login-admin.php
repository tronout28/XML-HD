<?php
include 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Query untuk mengecek email dan password
    $sql = "SELECT * FROM user WHERE email = ? AND password = ? AND role = 'admin'";
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

<!-- Form Login Admin -->
<form method="POST" action="login_admin.php">
    <input type="email" name="email" placeholder="Email" required><br>
    <input type="password" name="password" placeholder="Password" required><br>
    <button type="submit">Login</button>
</form>
