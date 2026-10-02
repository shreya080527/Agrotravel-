<?php

$origin = isset($_SERVER['HTTP_ORIGIN']) ? $_SERVER['HTTP_ORIGIN'] : '*';
header("Access-Control-Allow-Origin: " . $origin);
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
header("Content-Type: text/html; charset=UTF-8");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

echo "<div style='padding:10px; background:#e8f5e9; border-left:4px solid #2e7d32; border-radius:6px;'>";
echo "<h4 style='margin:0 0 8px; color:#1b5e20;'>✓ AJAX successfully received live data from PHP service!</h4>";
echo "<p style='margin:4px 0; color:#333;'><b>Backend Server:</b> XAMPP Apache / PHP 8 Engine</p>";
echo "<p style='margin:4px 0; color:#333;'><b>Service Status:</b> Connected and responding to AgroTravel application.</p>";
echo "<p style='margin:4px 0; color:#2e7d32; font-weight:600;'>🌱 Fresh organic farm products & tours are active and open for booking!</p>";
echo "<small style='color:#666;'>Server Timestamp: " . date("Y-m-d H:i:s") . "</small>";
echo "</div>";

?>