<?php
$servername = "localhost";
$username = "taoanhpro";
$password = "taoanhpro";
$dbname = "taoanhpro";
$port = "3306"; // Thay 3307 bằng số cổng MySQL bạn muốn sử dụng

try {
    $conn = new PDO("mysql:host=$servername;port=$port;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Kết nối thành công";
} catch(PDOException $e) {
    echo "Kết nối thất bại: " . $e->getMessage();
}
