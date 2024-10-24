<?php
session_start();

include('../../app/config.php');

$userId = $_SESSION['userId'];

$query = "SELECT nombres, apellidos, usuario, perfil, pass,foto FROM usuarios WHERE id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param('i', $userId);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $userData = $result->fetch_assoc();
    echo json_encode($userData);
} else {
    echo json_encode(['error' => 'Usuario no encontrado']);
}
?>
