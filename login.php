<?php
header('Content-Type: application/json');
$conn = new mysqli('localhost', 'root', '', 'numele_taul_de_baza_date');

if ($conn->connect_error) {
http_response_code(500);
echo json_encode(['error' => 'Database connection failed']);
exit;
}

$data = json_decode(file_get_contents('php://input'), true);

$email = $conn->real_escape_string($data['email']);
$password = $data['password'];

$result = $conn->query("SELECT id, name, email, password FROM site_users WHERE email = '$email'");

if ($result->num_rows === 0) {
http_response_code(401);
echo json_encode(['error' => 'Invalid email or password']);
exit;
}

$user = $result->fetch_assoc();

if (!password_verify($password, $user['password'])) {
http_response_code(401);
echo json_encode(['error' => 'Invalid email or password']);
exit;
}

// Nu trimitem parola înapoi!
unset($user['password']);

echo json_encode(['success' => true, 'user' => $user]);
$conn->close();
