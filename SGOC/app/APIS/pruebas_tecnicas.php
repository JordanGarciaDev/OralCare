<?php
include('../../app/config.php');
header('Content-Type: application/json');

$action = isset($_GET['action']) ? $_GET['action'] : '';

// Obtener todos los entrevistas
if ($action == 'fetch') {
    $query = "SELECT * FROM entrevistas WHERE tipo 2";
    $result = $conn->query($query);
    $data = array();

    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    echo json_encode(array('data' => $data));
}

// Guardar un nuevo TITULO AQUI o actualizar uno existente
if ($action == 'save') {
    $id = isset($_POST['id']) ? $_POST['id'] : '';
    $pregunta = $_POST['pregunta'];

    if ($id == '') {
        // Crear nuevo
        $query = "INSERT INTO entrevistas (pregunta) VALUES (?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('s', $pregunta);
        $stmt->execute();
        $stmt->close();
    } else {
        // Actualizar existente
        $query = "UPDATE entrevistas SET pregunta = ? WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('si', $pregunta, $id);
        $stmt->execute();
        $stmt->close();
    }

    echo json_encode(array('status' => 'success'));
}

// Editar (obtener un TITULO AQUI por id)
if ($action == 'edit') {
    $id = $_GET['id'];
    $query = "SELECT * FROM entrevistas WHERE id = ?";
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
    $query = "DELETE FROM entrevistas WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();

    echo json_encode(array('status' => 'success'));
}
?>
