<?php
session_start();
include('../../app/config.php');

$userId = $_SESSION['userId'];

// Obtener los datos del formulario
$nombres = $_POST['nombres'];
$apellidos = $_POST['apellidos'];
$pass = $_POST['pass'];

// Procesar la imagen (si existe)
$fotoUrl = null;
$response = [];

if (isset($_FILES['foto']) && $_FILES['foto']['error'] == 0) {
    $foto = $_FILES['foto'];

    // Validar el tipo de archivo (solo imágenes permitidas)
    $allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
    if (in_array($foto['type'], $allowedTypes)) {
        $targetDir = $_SERVER['DOCUMENT_ROOT'] . '/assets/img/avatars/';  // Carpeta donde se guardarán las fotos
        $extension = pathinfo($foto['name'], PATHINFO_EXTENSION);
        $nuevoNombre = uniqid() . '.' . $extension; // Generar un nuevo nombre único

        // Intentar mover la imagen
        if (move_uploaded_file($foto['tmp_name'], $targetDir . $nuevoNombre)) {
            $fotoUrl = $nuevoNombre;
            $_SESSION['fotousuario'] = $fotoUrl;
            $response['foto'] = $fotoUrl;
        } else {
            $response['error'] = 'Error al subir la foto';
        }
    } else {
        echo json_encode(['error' => 'Formato de imagen no permitido']);
        exit();
    }
}

// Actualizar los datos del usuario en la base de datos
$query = "UPDATE usuarios SET nombres = ?, apellidos = ?" . ($fotoUrl ? ", foto = ?" : "") . ($pass ? ", pass = ?" : "") . " WHERE id = ?";
$stmt = $conn->prepare($query);

if ($pass) {
    // Cifrar la nueva contraseña
    $hashedPassword = password_hash($pass, PASSWORD_DEFAULT);
    if ($fotoUrl) {
        $stmt->bind_param('ssssi', $nombres, $apellidos, $fotoUrl, $hashedPassword, $userId);
    } else {
        $stmt->bind_param('sssi', $nombres, $apellidos, $hashedPassword, $userId);
    }
} else {
    if ($fotoUrl) {
        $stmt->bind_param('sssi', $nombres, $apellidos, $fotoUrl, $userId);
    } else {
        $stmt->bind_param('ssi', $nombres, $apellidos, $userId);
    }
}

if ($stmt->execute()) {
    $response['message'] = 'Datos actualizados correctamente';
    echo json_encode($response); // Enviar la respuesta
} else {
    echo json_encode(['error' => 'Error al actualizar los datos']);
}
?>