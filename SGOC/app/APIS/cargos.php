<?php
include('../../app/config.php');
header('Content-Type: application/json');


$action = isset($_GET['action']) ? $_GET['action'] : '';

// Obtener todos los cargos
if ($action == 'fetch') {
    // Realizar el INNER JOIN para obtener el depto_nombre
    $query = "
        SELECT c.id, c.nombre, d.nombre AS depto_nombre
        FROM cargos AS c
        INNER JOIN dep_contratacion AS d ON c.depto_id = d.id
    ";

    $result = $conn->query($query);
    $data = array();

    if ($result) {
        while ($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
    } else {
        // Manejo de errores en la consulta
        echo json_encode(array('error' => $conn->error));
        exit;
    }

    echo json_encode(array('data' => $data));
}

// Guardar un nuevo cargo o actualizar uno existente
if ($action == 'save') {
    $id = isset($_POST['id']) ? $_POST['id'] : '';
    $nombre = $_POST['nombre'];
    $depto_id = $_POST['depto_id']; // Asegúrate de que este campo esté siendo enviado desde el frontend

    if ($id == '') {
        // Crear nuevo
        $query = "INSERT INTO cargos (nombre, depto_id) VALUES (?, ?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('si', $nombre, $depto_id);
        $stmt->execute();
        $stmt->close();
    } else {
        // Actualizar existente
        $query = "UPDATE cargos SET nombre = ?, depto_id = ? WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('sii', $nombre, $depto_id, $id);
        $stmt->execute();
        $stmt->close();
    }

    echo json_encode(array('status' => 'success'));
}

// Editar (obtener un cargo por id)
if ($action == 'edit') {
    $id = $_GET['id'];
    // Realizar el INNER JOIN para obtener el depto_nombre
    $query = "
        SELECT c.id, c.nombre, c.depto_id, d.nombre AS depto_nombre
        FROM cargos AS c
        INNER JOIN dep_contratacion AS d ON c.depto_id = d.id
        WHERE c.id = ?";

    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();

    // Comprobar si se obtuvo el cargo
    if ($row) {
        echo json_encode($row);
    } else {
        echo json_encode(array('error' => 'No se encontró el cargo.'));
    }
}

// Eliminar
if ($action == 'delete') {
    $id = $_GET['id'];
    $query = "DELETE FROM cargos WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();

    echo json_encode(array('status' => 'success'));
}
