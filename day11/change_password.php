<?php
# change_password.php - Simulates password change

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $newpass = $_POST['newpass'];
    file_put_contents("password.txt", "New password: $newpass\n", FILE_APPEND);
    echo "Password changed!";
} else {
    echo "Only POST allowed.";
}
?>
