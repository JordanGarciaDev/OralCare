<?php
include('../../app/config.php');
header('Content-Type: application/json');


$action = isset($_GET['action']) ? $_GET['action'] : '';

// Obtener todos los tipos de documentos
if ($action == 'fetch') {
    $query = "SELECT * FROM tipo_identificacion";
    $result = $conn->query($query);
    $data = array();

    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    echo json_encode(array('data' => $data));
}

// Guardar un nuevo tipo de documento o actualizar uno existente
if ($action == 'save') {
    $id = isset($_POST['id']) ? $_POST['id'] : '';
    $nombre = $_POST['nombre'];

    if ($id == '') {
        // Crear nuevo
        $query = "INSERT INTO tipo_identificacion (nombre) VALUES (?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('s', $nombre);
        $stmt->execute();
        $stmt->close();
    } else {
        // Actualizar existente
        $query = "UPDATE tipo_identificacion SET nombre = ? WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('si', $nombre, $id);
        $stmt->execute();
        $stmt->close();
    }

    echo json_encode(array('status' => 'success'));
}

// Editar (obtener un tipo de documento por id)
if ($action == 'edit') {
    $id = $_GET['id'];
    $query = "SELECT * FROM tipo_identificacion WHERE id = ?";
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
    $query = "DELETE FROM tipo_identificacion WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();

    echo json_encode(array('status' => 'success'));
}
