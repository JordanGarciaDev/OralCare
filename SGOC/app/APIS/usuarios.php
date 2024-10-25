<?php
include('../../app/config.php');
header('Content-Type: application/json');

$action = isset($_GET['action']) ? $_GET['action'] : '';

// Obtener todos los usuarios
if ($action == 'fetch') {
    $query = "
        SELECT u.*, c.nombre AS cargo_nombre 
        FROM usuarios u 
        JOIN cargos c ON u.cargo_id = c.id";

    $result = $conn->query($query);
    $data = array();

    while ($row = $result->fetch_assoc()) {
        // Verifica si hay una foto de perfil; de lo contrario, usa 'default.png'
        $row['foto'] = !empty($row['foto']) ? $row['foto'] : '/default.png';
        $data[] = $row;
    }

    echo json_encode(array('data' => $data));
}

// Guardar un nuevo usuario o actualizar uno existente
if ($action == 'save') {
    $id = isset($_POST['id']) ? $_POST['id'] : '';
    $nombres = $_POST['nombres'];
    $apellidos = $_POST['apellidos'];
    $usuario = $_POST['usuario'];
    $pass = password_hash($_POST['pass'], PASSWORD_DEFAULT); // Encriptar contraseña
    $cargo_id = $_POST['cargo_id'];

    $nuevoNombre = null;
    if (isset($_FILES['foto']) && $_FILES['foto']['error'] == 0) {
        $foto = $_FILES['foto'];

        $allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];
        if (in_array($foto['type'], $allowedTypes)) {
            $targetDir = TARGET_DIR; // Carpeta donde se guardarán las fotos
            $extension = pathinfo($foto['name'], PATHINFO_EXTENSION);
            $nuevoNombre = uniqid() . '.' . $extension; // Generar un nuevo nombre único

            if (!move_uploaded_file($foto['tmp_name'], $targetDir . $nuevoNombre)) {
                echo json_encode(['error' => 'Error al subir la foto']);
                exit();
            }
        } else {
            echo json_encode(['error' => 'Formato de imagen no permitido']);
            exit();
        }
    }

    if ($id == '') {
        // Crear nuevo
        $query = "INSERT INTO usuarios (nombres, apellidos, usuario, pass, cargo_id, foto) VALUES (?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('ssssss', $nombres, $apellidos, $usuario, $pass, $cargo_id, $nuevoNombre);
        $stmt->execute();
        $stmt->close();
    } else {
        // Actualizar existente
        if ($nuevoNombre) {
            // Si hay nueva foto, actualiza el campo de la foto
            $query = "UPDATE usuarios SET nombres = ?, apellidos = ?, usuario = ?, pass = ?, cargo_id = ?, foto = ? WHERE id = ?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param('ssssssi', $nombres, $apellidos, $usuario, $pass, $cargo_id, $nuevoNombre, $id);
        } else {
            // Si no hay nueva foto, no se actualiza el campo de la foto
            $query = "UPDATE usuarios SET nombres = ?, apellidos = ?, usuario = ?, pass = ?, cargo_id = ? WHERE id = ?";
            $stmt = $conn->prepare($query);
            $stmt->bind_param('sssssi', $nombres, $apellidos, $usuario, $pass, $cargo_id, $id);
        }
        $stmt->execute();
        $stmt->close();
    }

    echo json_encode(array('status' => 'success'));
}

// Editar (obtener un usuario por id)
if ($action == 'edit') {
    $id = $_GET['id'];
    $query = "
        SELECT u.*, c.nombre AS cargo_nombre 
        FROM usuarios u 
        JOIN cargos c ON u.cargo_id = c.id 
        WHERE u.id = ?";

    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();

    echo json_encode($row);
}

// Eliminar
if ($action == 'delete') {
    $id = $_GET['id'];
    $query = "DELETE FROM usuarios WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();

    echo json_encode(array('status' => 'success'));
}
?>
