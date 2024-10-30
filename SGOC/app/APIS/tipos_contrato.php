<?php
include('../../app/config.php');
header('Content-Type: application/json');

$action = isset($_GET['action']) ? $_GET['action'] : '';

// Obtener todos los tipos de contrato
if ($action == 'fetch') {
    $query = "SELECT * FROM tipos_contratos";
    $result = $conn->query($query);
    $data = array();

    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    echo json_encode(array('data' => $data));
}

// Guardar un nuevo tipo de contrato o actualizar uno existente
if ($action == 'save') {
    $id = isset($_POST['id']) ? $_POST['id'] : '';
    $nombre = $_POST['nombre'];

    if ($id == '') {
        // Crear nuevo
        $query = "INSERT INTO tipos_contratos (nombre) VALUES (?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('s', $nombre);
        $stmt->execute();
        $stmt->close();
    } else {
        // Actualizar existente
        $query = "UPDATE tipos_contratos SET nombre = ? WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('si', $nombre, $id);
        $stmt->execute();
        $stmt->close();
    }

    echo json_encode(array('status' => 'success'));
}

// Editar (obtener un tipo de contrato por id)
if ($action == 'edit') {
    $id = $_GET['id'];
    $query = "SELECT * FROM tipos_contratos WHERE id = ?";
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
    $query = "DELETE FROM tipos_contratos WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();

    echo json_encode(array('status' => 'success'));
}
?>
