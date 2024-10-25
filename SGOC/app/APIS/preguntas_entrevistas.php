<?php
include('../../app/config.php');
header('Content-Type: application/json');

$action = isset($_GET['action']) ? $_GET['action'] : '';

// Obtener todos los preguntas_entrevistas
if ($action == 'fetch') {
    $query = "SELECT *, p.id AS idPreg FROM preguntas_entrevistas p INNER JOIN tipos_preguntas tp ON p.tpregunta = tp.id";
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
    $tpregunta = $_POST['tpregunta'];

    if ($id == '') {
        // Crear nuevo
        $query = "INSERT INTO preguntas_entrevistas (pregunta,tpregunta) VALUES (?,?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('si', $pregunta,$tpregunta);
        $stmt->execute();
        $stmt->close();
    } else {
        // Actualizar existente
        $query = "UPDATE preguntas_entrevistas SET pregunta = ? , tpregunta = ? WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('sii', $pregunta, $tpregunta,$id);
        $stmt->execute();
        $stmt->close();
    }

    echo json_encode(array('status' => 'success'));
}

// Editar (obtener un TITULO AQUI por id)
if ($action == 'edit') {
    $id = $_GET['id'];
    $query = "SELECT *, p.id AS idPreg FROM preguntas_entrevistas p INNER JOIN tipos_preguntas tp ON p.tpregunta = tp.id WHERE tp.id = ?";
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
    $query = "DELETE FROM preguntas_entrevistas WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('i', $id);
    $stmt->execute();

    echo json_encode(array('status' => 'success'));
}
?>
