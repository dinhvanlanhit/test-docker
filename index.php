<?php
$servername = "127.0.0.1";
$username = "taoanhpro";
$password = "taoanhpro";
$dbname = "taoanhpro";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // Thiết lập chế độ lỗi để bật chế độ báo lỗi khi có lỗi xảy ra
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Kết nối thành công";
} catch(PDOException $e) {
    echo "Kết nối thất bại: " . $e->getMessage();
}

echo "<br>";
try {
//   // Ví dụ: Thực hiện truy vấn SELECT
//   $sql = "SELECT * FROM keyword_temps";
//   $result = $conn->query($sql);
//   var_dump($result->rowCount());

//   // Xử lý kết quả
//   if ($result->rowCount() > 0) {
//       while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
//           // Xử lý dữ liệu
//           echo "Column 1: " . $row['keyword'] . "<br>";
//           echo "Column 2: " . $row['slug'] . "<br>";
//           // và cứ tiếp tục với các cột khác
//       }
//   } else {
//       echo "Không có dữ liệu trả về từ truy vấn.";
//   }
} catch(PDOException $e) {
  echo "Lỗi truy vấn: " . $e->getMessage();
}