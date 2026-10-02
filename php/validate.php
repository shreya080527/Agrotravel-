<?php

$origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '*';
header("Access-Control-Allow-Origin: " . $origin);
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

$name = isset($_POST['name']) ? trim($_POST['name']) : '';
$phone = isset($_POST['phone']) ? trim($_POST['phone']) : '';
$location = isset($_POST['location']) ? trim($_POST['location']) : '';

$errors = array();

if ($name === '') {
    $errors[] = "Name is required.";
}
elseif (!preg_match("/^[a-zA-Z ]+$/", $name)) {
    $errors[] = "Name should contain only letters.";
}

if ($phone === '') {
    $errors[] = "Phone number is required.";
}
elseif (!preg_match("/^[0-9]{10}$/", $phone)) {
    $errors[] = "Phone number must contain exactly 10 digits.";
}

if ($location === '') {
    $errors[] = "Location is required.";
}

if (count($errors) > 0) {

    echo "<span style='color:#c93b2b; font-weight:600;'>";

    foreach ($errors as $error) {
        echo "⚠️ " . htmlspecialchars($error) . "<br>";
    }

    echo "</span>";

} else {

    echo "<span style='color:#2e7d32; font-weight:600;'>";
    echo "✓ Registration details are valid!";
    echo "</span>";
}

?>