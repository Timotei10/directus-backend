<?php
header('Content-Type: application/json');
$conn = new mysqli('localhost', 'root', '', 'numele_taul_de_baza_date');

if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(['error' => 'Database connection failed']);
    exit;
}

$data = json_decode(file_get_contents('php://input'), true);

$name = $conn->real_escape_string($data['name']);
$email = $conn->real_escape_string($data['email']);
$password = password_hash($data['password'], PASSWORD_BCRYPT);

// verifică dacă emailul există deja
$check = $conn->query("SELECT id FROM site_users WHERE email = '$email'");
if ($check->num_rows > 0) {
    http_response_code(400);
    echo json_encode(['error' => 'Email already exists']);
    exit;
}

// inserează userul
$sql = "INSERT INTO site_users (name, email, password) VALUES ('$name', '$email', '$password')";
if ($conn->query($sql)) {
    echo json_encode(['success' => true]);
} else {
    http_response_code(500);
    echo json_encode(['error' => 'Registration failed']);
}
$conn->close();
